import { useState } from 'react';
import { TextInput, PasswordInput, Button, Paper, Title, Container, Text, Anchor } from '@mantine/core';
import { useAuth } from '../contexts/AuthContext';
import { Link } from 'react-router-dom';

export default function Signup() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const { signUp } = useAuth();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setLoading(true);
    
    try {
      
      await signUp(email, password);
      console.log("after signup")
      // Redirect will be handled by the auth state change in AuthContext
      setLoading(false);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to create an account');
    } finally {
      setLoading(false);
    }
  };

  return (
    <Container size={420} my={40}>
      <Title ta="center">Create an account</Title>
      <Text c="dimmed" size="sm" ta="center" mt={5}>
        Already have an account?{' '}
        <Anchor size="sm" component={Link} to="/login">
          Login
        </Anchor>
      </Text>

      <Paper withBorder shadow="md" p={30} mt={30} radius="md">
        <form onSubmit={handleSubmit}>
          {error && (
            <Text c="red" size="sm" mb="md">
              {error}
            </Text>
          )}
          <TextInput
            label="Email"
            placeholder="you@example.com"
            required
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
          <PasswordInput
            label="Password"
            placeholder="Your password"
            required
            mt="md"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
          <Button type="submit" fullWidth mt="xl" loading={loading}>
            Sign up
          </Button>
        </form>
      </Paper>
    </Container>
  );
}
