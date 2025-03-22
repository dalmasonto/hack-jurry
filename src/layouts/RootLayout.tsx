import { AppShell, Avatar, Box, Burger, Group, Menu, NavLink, Text, UnstyledButton } from '@mantine/core';
import { useDisclosure } from '@mantine/hooks';
import { IconChevronRight, IconDashboard, IconHome, IconLogout, IconSettings2, IconTrophy } from '@tabler/icons-react';
import { Navigate, Outlet, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { forwardRef } from 'react';
import { limitChars } from '../utils/functions';
import ColoSchemeToggle from '../components/colorScheme/ColoSchemeToggle';

interface UserButtonProps extends React.ComponentPropsWithoutRef<'button'> {
  image: string;
  name: string;
  email: string;
  icon?: React.ReactNode;
}

const UserButton = forwardRef<HTMLButtonElement, UserButtonProps>(
  ({ image, name, email, icon, ...others }: UserButtonProps, ref) => (
    <UnstyledButton
      ref={ref}
      p={"2px"}
      style={{
        color: 'var(--mantine-color-text)',
        borderRadius: 'var(--mantine-radius-sm)',
      }}
      {...others}
    >
      <Group>
        <Avatar src={image} radius="xl" />

        <div style={{ flex: 1 }}>
          <Text size="sm" fw={500}>
            {name}
          </Text>

          <Text c="dimmed" size="xs">
            {email}
          </Text>
        </div>

        {icon || <IconChevronRight size={16} />}
      </Group>
    </UnstyledButton>
  )
);

const AccountMenu = () => {
  const { user, signOut } = useAuth();

  return (
    <Menu shadow="md" width={200}>
      <Menu.Target>
        {/* Use a freepik image for user avatar */}
        <UserButton image={'https://cdn-icons-png.flaticon.com/512/149/149071.png'} name={'Unknown'} email={limitChars(user?.email!, 10)} />
      </Menu.Target>

      <Menu.Dropdown>
        {/* <Menu.Label>Application</Menu.Label>
        <Menu.Item leftSection={<IconSettings size={14} />}>
          Settings
        </Menu.Item>
        <Menu.Item leftSection={<IconMessageCircle size={14} />}>
          Messages
        </Menu.Item>
        <Menu.Item leftSection={<IconPhoto size={14} />}>
          Gallery
        </Menu.Item>
        <Menu.Item
          leftSection={<IconSearch size={14} />}
          rightSection={
            <Text size="xs" c="dimmed">
              ⌘K
            </Text>
          }
        >
          Search
        </Menu.Item>

        <Menu.Divider />

        <Menu.Label>Danger zone</Menu.Label>
        <Menu.Item
          leftSection={<IconArrowsLeftRight size={14} />}
        >
          Transfer my data
        </Menu.Item> */}
        <Menu.Item
          color="red"
          leftSection={<IconLogout size={14} />}
          onClick={() => signOut()}
        >
          Sign Out
        </Menu.Item>
      </Menu.Dropdown>
    </Menu>
  );
};

export default function RootLayout() {
  const [opened, { toggle }] = useDisclosure();
  const { user, loading } = useAuth();
  const navigate = useNavigate();

  if (loading) {
    return <Text>Root Loading...</Text>;
  }

  if (!user) {
    return <Navigate to="/login" />;
  }

  const navItems = [
    { label: 'Home', icon: IconHome, path: '/' },
    { label: 'Dashboard', icon: IconDashboard, path: '/dashboard' },
    { label: 'Hackathons', icon: IconTrophy, path: '/hackathons' },
  ];

  if (user.role === 'admin') {
    navItems.push(
      { label: 'Admin Dashboard', icon: IconSettings2, path: '/admin' },
      // { label: 'Results', icon: IconChartBar, path: '/admin/results' }
    );
  }

  return (
    <AppShell
      header={{ height: 60 }}
      navbar={{ width: 300, breakpoint: 'sm', collapsed: { mobile: !opened } }}
      padding="0"
    >
      <AppShell.Header w={'100vw'}>
        <Group h="100%" px="xs" justify="space-between">
          <Group gap={10}>
            <Burger opened={opened} onClick={toggle} hiddenFrom="sm" size="sm" />
            <Text size="lg" fw={600}>HackJurry</Text>
          </Group>
          <Group>
            <AccountMenu />
            <ColoSchemeToggle />
          </Group>
        </Group>
      </AppShell.Header>

      <AppShell.Navbar px="xs">
        {navItems.map((item) => (
          <NavLink
            key={item.path}
            label={item.label}
            leftSection={<item.icon size="1.2rem" />}
            onClick={() => {
              toggle();
              navigate(item.path)
            }}
          />
        ))}
      </AppShell.Navbar>

      <AppShell.Main>
        <Box px={{base: "10px", sm: "20px"}} py={{base: "10px", sm: "20px"}}>
        <Outlet />
        </Box>
      </AppShell.Main>
    </AppShell>
  );
}
