import { ColorSchemeScript, MantineProvider } from '@mantine/core';
import { Notifications } from '@mantine/notifications';
import { RouterProvider, createBrowserRouter } from 'react-router-dom';
import { AuthProvider } from './contexts/AuthContext';
import RootLayout from './layouts/RootLayout';
import Login from './pages/Login';
import Signup from './pages/Signup';
import Dashboard from './pages/Dashboard';
import AdminDashboard from './pages/admin/Dashboard';
import HackathonDetails from './pages/HackathonDetails';
import '@mantine/core/styles.css';
import '@mantine/notifications/styles.css';
import '@mantine/dates/styles.css';
import '@mantine/charts/styles.css';
import Hackathons from './pages/Hackathons';
import HackathonScoring from './pages/HackathonScoring';
import Home from './pages/Home';
import { ModalsProvider } from '@mantine/modals';
const router = createBrowserRouter([
  {
    path: '/',
    element: (
      <AuthProvider>
        <RootLayout />
      </AuthProvider>
    ),
    children: [
      { path: '/', element: <Home /> },
      { path: '/dashboard', element: <Dashboard /> },
      { path: '/hackathons', element: <Hackathons /> },
      { path: '/hackathon/:id', element: <HackathonDetails /> },
      { path: '/hackathons/:id/scoring', element: <HackathonScoring /> },
      { path: '/admin', element: <AdminDashboard /> },
    ],
  },
  {
    path: '/login',
    element: (
      <AuthProvider>
        <Login />
      </AuthProvider>
    ),
  },
  {
    path: '/signup',
    element: (
      <AuthProvider>
        <Signup />
      </AuthProvider>
    ),
  },
]);

function App() {
  return (
    <>
      <ColorSchemeScript
        nonce="8IBTHwOdqNKAWeKl7plt8g=="
        defaultColorScheme="dark"
      />
      <MantineProvider>
      <ModalsProvider>
        <Notifications />
        <RouterProvider router={router} />
      </ModalsProvider>
      </MantineProvider>
    </>
  );
}

export default App;
