import { createContext, useContext, useEffect, useMemo, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import { User } from '../types';
import { showNotification } from '@mantine/notifications';

interface AuthContextType {
  user: User | null;
  loading: boolean;
  signIn: (email: string, password: string) => Promise<void>;
  signUp: (email: string, password: string) => Promise<void>;
  signOut: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate();

  const signIn = async (email: string, password: string) => {
    try {

      if (!email || !password) {
        throw new Error("Email and password are required");
      }


      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (error) {
        throw new Error(error.message);
      }

      if (!data.session) {
        throw new Error("No session returned after login");
      }

      const { data: profileData, error: profileError } = await supabase
        .from("profiles")
        .select("role")
        .eq("id", data.user.id)
        .single();

      if (profileError) {
        if (profileError.code === "PGRST116") {
          // Use service role client for initial profile creation
          const { error: createError } = await supabase
            .from("profiles")
            .insert([
              {
                id: data.session.user.id,
                email: data.session.user.email,
                role: "judge",
              },
            ])
            .select()
            .single();

          if (createError) {
            throw new Error("Failed to create profile: " + createError.message);
          }

          setUser({
            id: data.session.user.id,
            email: data.session.user.email!,
            role: "judge",
          } as any);
        } else {
          throw new Error("Profile fetch error: " + profileError.message);
        }
      } else {
        setUser({
          id: data.session.user.id,
          email: data.session.user.email!,
          role: profileData?.role || "judge",
        } as any);
      }

      setLoading(false);
      navigate("/");

      showNotification({
        title: "Success",
        message: "Signed in successfully",
        color: "green",
      });
    } catch (err) {
      console.error("Sign-in error:", err);
      setLoading(false);
      showNotification({
        title: "Error",
        message: err instanceof Error ? err.message : "An unknown error occurred",
        color: "red",
      });
    }
  };

  const signOut = async () => {
    const { error } = await supabase.auth.signOut();
    if (error) throw error;
    setUser(null);
    navigate('/login');
  };

  const signUp = async (email: string, password: string) => {
    try {

      const { data: userData, error } = await supabase.auth.signUp({
        email,
        password,
        options: {
          data: {
            confirm: false
          }
        }
      });

      if (error) {
        showNotification({
          title: 'Error',
          message: error.message,
          color: 'red',
        });
        return;
      }

      if (!userData.user || !userData.user.id) {
        console.error("User data is incomplete:", userData);
        showNotification({
          title: 'Error',
          message: 'User creation incomplete. Email confirmation may be required.',
          color: 'orange',
        });
        return;
      }

      // Create a profile entry with default role
      const { error: profileError } = await supabase
        .from('profiles')
        .insert([{ id: userData.user.id, email: userData.user.email, role: 'judge' }])
        .select();


      if (profileError) {
        console.error("Profile creation failed:", profileError);
        showNotification({
          title: 'Profile Creation Error',
          message: profileError.message,
          color: 'red',
        });
        return;
      }

      showNotification({
        title: 'Success',
        message: 'Account created successfully' + (userData.user.email_confirmed_at ? '' : '. Please check your email to confirm your account.'),
        color: 'green',
      });

    } catch (err) {
      console.error("Unexpected error during signup:", err);
      showNotification({
        title: 'Unexpected Error',
        message: err instanceof Error ? err.message : 'An unknown error occurred',
        color: 'red',
      });
    }
  };

  useEffect(() => {
    setLoading(false);
  }, [user]);

  const contextValue = useMemo(() => ({
    user,
    loading,
    signIn,
    signUp,
    signOut
  }), [user, loading, signIn, signUp, signOut]);


  // Initialize auth state and get session
  const initializeAuth = async () => {
    try {
      const { data: { session }, error } = await supabase.auth.getSession();
      if (error) {
        console.error("Init auth error:", error);
        return null;
      }
      return session;
    } catch (err) {
      console.error("Unexpected error in initializeAuth:", err);
      return null;
    }
  };

  // Handle session and profile fetching
  const handleSession = async (session: any) => {
    if (session) {
      try {
        const { data: profile, error } = await supabase
          .from("profiles")
          .select("role")
          .eq("id", session.user.id)
          .single();

        if (error) {
          console.error("Profile fetch error:", error);
          if (error.code === "PGRST116") {
            // Profile doesn't exist, create it
            const { error: createError } = await supabase
              .from("profiles")
              .insert([
                {
                  id: session.user.id,
                  email: session.user.email,
                  role: "judge",
                },
              ])
              .select()
              .single();

            if (createError) {
              throw new Error("Failed to create profile: " + createError.message);
            }
            setUser({
              id: session.user.id,
              email: session.user.email!,
              role: "judge",
            } as any);
          } else {
            throw new Error("Profile fetch error: " + error.message);
          }
        } else {
          setUser({
            id: session.user.id,
            email: session.user.email!,
            role: profile?.role || "judge",
          } as any);
        }
        setTimeout(() => navigate("/"), 500); // Delay navigation to avoid interrupting signIn
      } catch (err) {
        console.error("Error handling session:", err);
        setUser(null);
        navigate("/login");
      }
    }
    setLoading(false);
  };

  // useEffect for auth state management
  useEffect(() => {

    // Initial session check
    initializeAuth().then((session) => handleSession(session));

    // Listen for auth state changes
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      handleSession(session);
    });

    // Cleanup subscription
    return () => subscription.unsubscribe();
  }, [navigate, setUser, setLoading]); // Add dependencies

  return (
    <AuthContext.Provider value={contextValue}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}
