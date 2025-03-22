import { Button, Card, Grid, Group, Modal, Stack, Tabs, Text, TextInput, Title, MultiSelect, Select } from '@mantine/core';
import { DateInput } from '@mantine/dates';
import { useForm } from '@mantine/form';
import { notifications } from '@mantine/notifications';
import { useDisclosure } from '@mantine/hooks';
import { IconTrophy, IconUsers } from '@tabler/icons-react';
import { useEffect, useState } from 'react';
import { Navigate } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import { supabase, supabaseAdmin } from '../../lib/supabase';
import { Hackathon, User } from '../../types';

export default function AdminDashboard() {
  const { user } = useAuth();
  const [opened, { open, close }] = useDisclosure(false);
  const [users, setUsers] = useState<User[]>([]);
  const [hackathons, setHackathons] = useState<Hackathon[]>([]);
  const [loading, setLoading] = useState(true);
  const [hackathonJudges, setHackathonJudges] = useState<Record<string, string[]>>({});

  const hackathonForm = useForm({
    initialValues: {
      name: '',
      description: '',
      start_date: '',
      end_date: '',
    },
    validate: {
      name: (value: string) => (value.length < 2 ? 'Name must be at least 2 characters' : null),
      description: (value: string) => (value.length < 10 ? 'Description must be at least 10 characters' : null),
      start_date: (value: string) => (!value ? 'Start date is required' : null),
      end_date: (value: string) => (!value ? 'End date is required' : null),
    },
  });

  const userForm = useForm({
    initialValues: {
      email: '',
      password: '',
      role: 'judge',
    },
    validate: {
      email: (value: string) => (/^\S+@\S+$/.test(value) ? null : 'Invalid email'),
      password: (value: string) => (value.length < 6 ? 'Password must be at least 6 characters' : null),
    },
  });

  useEffect(() => {
    async function fetchData() {
      try {
        // Fetch users
        const { data: usersData, error: usersError } = await supabase
          .from('profiles')
          .select('*');
        
        if (usersError) throw usersError;
        setUsers(usersData || []);

        // Fetch hackathons
        const { data: hackathonsData, error: hackathonsError } = await supabase
          .from('hackathons')
          .select('*');
        
        if (hackathonsError) throw hackathonsError;
        setHackathons(hackathonsData || []);

        // Fetch hackathon judges
        const { data: judgesData, error: judgesError } = await supabase
          .from('hackathon_judges')
          .select('hackathon_id, judge_id');

        if (judgesError) throw judgesError;

        // Transform into a map of hackathon_id -> judge_ids[]
        const judgesMap: Record<string, string[]> = {};
        judgesData?.forEach(({ hackathon_id, judge_id }) => {
          if (!judgesMap[hackathon_id]) {
            judgesMap[hackathon_id] = [];
          }
          judgesMap[hackathon_id].push(judge_id);
        });
        setHackathonJudges(judgesMap);
      } catch (error) {
        console.error('Error fetching data:', error);
        notifications.show({
          title: 'Error',
          message: 'Failed to load data',
          color: 'red',
        });
      } finally {
        setLoading(false);
      }
    }

    fetchData();
  }, []);

  const handleCreateHackathon = async (values: typeof hackathonForm.values) => {
    try {
      const { error } = await supabase.from('hackathons').insert([values]);
      if (error) throw error;

      notifications.show({
        title: 'Success',
        message: 'Hackathon created successfully',
        color: 'green',
      });

      // Refresh hackathons list
      const { data } = await supabase.from('hackathons').select('*');
      setHackathons(data || []);
      close();
      hackathonForm.reset();
    } catch (error) {
      notifications.show({
        title: 'Error',
        message: 'Failed to create hackathon',
        color: 'red',
      });
    }
  };

  const handleCreateUser = async (values: typeof userForm.values) => {
    try {
      // Create user using admin client
      const { data: authData, error: authError } = await supabaseAdmin.auth.admin.createUser({
        email: values.email,
        password: values.password,
        email_confirm: true,
      });

      if (authError) throw authError;

      // Create profile using admin client
      if (authData.user) {
        const { error: profileError } = await supabaseAdmin.from('profiles').insert([
          {
            id: authData.user.id,
            email: values.email,
            role: values.role,
          },
        ]);

        if (profileError) throw profileError;
      }

      notifications.show({
        title: 'Success',
        message: 'User created successfully',
        color: 'green',
      });

      // Refresh users list
      const { data } = await supabase.from('profiles').select('*');
      setUsers(data || []);
      userForm.reset();
    } catch (error) {
      notifications.show({
        title: 'Error',
        message: 'Failed to create user',
        color: 'red',
      });
    }
  };

  if (user?.role !== 'admin') {
    return <Navigate to="/" />;
  }

  if (loading) {
    return <Text>Loading...</Text>;
  }

  const handleJudgeAssignment = async (hackathonId: string, judgeIds: string[]) => {
    try {
      // Remove all existing assignments for this hackathon
      await supabase
        .from('hackathon_judges')
        .delete()
        .eq('hackathon_id', hackathonId);

      // Add new assignments
      if (judgeIds.length > 0) {
        const assignments = judgeIds.map(judgeId => ({
          hackathon_id: hackathonId,
          judge_id: judgeId,
          created_at: new Date().toISOString()
        }));

        const { error } = await supabase
          .from('hackathon_judges')
          .insert(assignments);

        if (error) throw error;
      }

      // Update local state
      setHackathonJudges(prev => ({
        ...prev,
        [hackathonId]: judgeIds
      }));

      notifications.show({
        title: 'Success',
        message: 'Judge assignments updated successfully',
        color: 'green'
      });
    } catch (error) {
      console.error('Error updating judge assignments:', error);
      notifications.show({
        title: 'Error',
        message: 'Failed to update judge assignments',
        color: 'red'
      });
    }
  };

  return (
    <Stack>
      <Title order={2}>Admin Dashboard</Title>

      <Tabs defaultValue="hackathons">
        <Tabs.List>
          <Tabs.Tab value="hackathons" leftSection={<IconTrophy size="1rem" />}>
            Hackathons
          </Tabs.Tab>
          <Tabs.Tab value="users" leftSection={<IconUsers size="1rem" />}>
            Users
          </Tabs.Tab>
        </Tabs.List>

        <Tabs.Panel value="hackathons" pt="xl">
          <Group justify="space-between" mb="md">
            <Title order={3}>Hackathons</Title>
            <Button onClick={open}>Create Hackathon</Button>
          </Group>

          <Grid>
            {hackathons.map((hackathon) => (
              <Grid.Col key={hackathon.id} span={{ base: 12, sm: 6, lg: 4 }}>
                <Card withBorder radius={"lg"} h={'100%'}>
                  <Title order={4}>{hackathon.name}</Title>
                  <Text c="dimmed" size="sm" mb="md">
                    {hackathon.description}
                  </Text>
                  <Group>
                    <div>
                      <Text size="xs">Start Date</Text>
                      <Text>{new Date(hackathon.start_date).toLocaleDateString()}</Text>
                    </div>
                    <div>
                      <Text size="xs">End Date</Text>
                      <Text>{new Date(hackathon.end_date).toLocaleDateString()}</Text>
                    </div>
                  </Group>
                  <MultiSelect
                    label="Assigned Judges"
                    placeholder="Select judges"
                    data={users
                      .filter(u => u.role === 'judge')
                      .map(judge => ({
                        value: judge.id,
                        label: judge.email
                      }))}
                    value={hackathonJudges[hackathon.id] || []}
                    onChange={(value) => handleJudgeAssignment(hackathon.id, value)}
                    mt="md"
                    radius={"md"}
                  />
                </Card>
              </Grid.Col>
            ))}
          </Grid>
        </Tabs.Panel>

        <Tabs.Panel value="users" pt="xl">
          <Stack>
            <Card withBorder mb="md" radius="lg" shadow="sm">
              <Title order={4} mb="md" fw={500}>Create User</Title>
              <form onSubmit={userForm.onSubmit(handleCreateUser)}>
                <Stack>
                  <TextInput
                    label="Email"
                    placeholder="user@example.com"
                    required
                    radius="md"
                    {...userForm.getInputProps('email')}
                  />
                  <TextInput
                    label="Password"
                    type="password"
                    placeholder="Password"
                    required
                    radius="md"
                    {...userForm.getInputProps('password')}
                  />
                  <Select
                    label="Role"
                    placeholder="Select role"
                    required
                    radius="md"
                    data={[
                      { value: 'admin', label: 'Admin' },
                      { value: 'judge', label: 'Judge' },
                      { value: 'hacker', label: 'Hacker' }
                    ]}
                    {...userForm.getInputProps('role')}
                  />
                  <Button type="submit" radius="md">Create User</Button>
                </Stack>
              </form>
            </Card>

            <Title order={4} mb="md" fw={500}>Users</Title>
            <Grid>
              {users.map((user) => (
                <Grid.Col key={user.id} span={{ base: 12, sm: 6, lg: 4 }}>
                  <Card withBorder radius="lg" shadow="sm">
                    <Text fw={500}>{user.email}</Text>
                    <Text size="sm" c="dimmed" mt={4}>
                      Role: {user.role}
                    </Text>
                  </Card>
                </Grid.Col>
              ))}
            </Grid>
          </Stack>
        </Tabs.Panel>
      </Tabs>

      <Modal opened={opened} onClose={close} title="Create Hackathon"
        radius="lg"
        size={"lg"}
        centered
      >
        <form onSubmit={hackathonForm.onSubmit(handleCreateHackathon)}>
          <Stack>
            <TextInput
              label="Name"
              placeholder="Hackathon name"
              required
              {...hackathonForm.getInputProps('name')}
              radius="md"
            />
            <TextInput
              label="Description"
              placeholder="Describe the hackathon"
              required
              {...hackathonForm.getInputProps('description')}
              radius="md"
              />
            <DateInput
              label="Start Date"
              placeholder="Pick start date"
              required
              {...hackathonForm.getInputProps('start_date')}
              radius="md"
            />
            <DateInput
              label="End Date"
              placeholder="Pick end date"
              required
              {...hackathonForm.getInputProps('end_date')}
              radius="md"
            />
            <Button type="submit" radius="md">Create</Button>
          </Stack>
        </form>
      </Modal>
    </Stack>
  );
}
