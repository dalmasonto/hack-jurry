import { Button, Card, Grid, Group, Modal, Stack, Text, TextInput, Title, Anchor } from '@mantine/core';
import { DateInput } from '@mantine/dates';
import { useForm } from '@mantine/form';
import { notifications } from '@mantine/notifications';
import { useDisclosure } from '@mantine/hooks';
import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';
import { Hackathon } from '../types';

export default function Hackathons() {
  const { user } = useAuth();
  const [opened, { open, close }] = useDisclosure(false);
  const [hackathons, setHackathons] = useState<Hackathon[]>([]);
  const [loading, setLoading] = useState(true);

  const form = useForm({
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

  useEffect(() => {
    fetchHackathons();
  }, []);

  const fetchHackathons = async () => {
    try {
      let query = supabase.from('hackathons').select('*');
      
      // If user is a judge, only show hackathons they're assigned to
      if (user?.role === 'judge') {
        const { data: judgeHackathons, error: judgeError } = await supabase
          .from('hackathon_judges')
          .select('hackathon_id')
          .eq('judge_id', user.id);

        if (judgeError) throw judgeError;
        
        if (judgeHackathons && judgeHackathons.length > 0) {
          query = query.in('id', judgeHackathons.map(h => h.hackathon_id));
        } else {
          setHackathons([]);
          setLoading(false);
          return;
        }
      }

      const { data, error } = await query;
      
      if (error) throw error;
      setHackathons(data || []);
    } catch (error) {
      console.error('Error fetching hackathons:', error);
      notifications.show({
        title: 'Error',
        message: 'Failed to load hackathons',
        color: 'red',
      });
    } finally {
      setLoading(false);
    }
  };

  const handleSubmit = async (values: typeof form.values) => {
    try {
      const { error } = await supabase.from('hackathons').insert([values]);
      if (error) throw error;

      notifications.show({
        title: 'Success',
        message: 'Hackathon created successfully',
        color: 'green',
      });

      // Refresh hackathons list
      await fetchHackathons();
      close();
      form.reset();
    } catch (error) {
      notifications.show({
        title: 'Error',
        message: 'Failed to create hackathon',
        color: 'red',
      });
    }
  };

  if (loading) {
    return <Text>Loading...</Text>;
  }
  
  return (
    <Stack>
      <Group justify="space-between" mb="md">
        <Title order={2}>Hackathons</Title>
        {user?.role === 'admin' && (
          <Button onClick={open} radius={"md"}>Create Hackathon</Button>
        )}
      </Group>

      <Grid>
        {hackathons.map((hackathon) => (
          <Grid.Col key={hackathon.id} span={{ base: 12, sm: 6, lg: 4 }}>
            <Card withBorder radius={"md"}>
              <Anchor component={Link} to={`/hackathon/${hackathon.id}`} style={{ textDecoration: 'none' }}>
                <Title order={4}>{hackathon.name}</Title>
                <Text c="dimmed" size="sm" mb="md">
                  {hackathon.description}
                </Text>
              </Anchor>
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
              <Button
                component={Link}
                to={`/hackathon/${hackathon.id}`}
                variant="light"
                mt="md"
                fullWidth
                radius={"md"}
              >
                View Details
              </Button>
            </Card>
          </Grid.Col>
        ))}
      </Grid>

      <Modal opened={opened} onClose={close} title="Create Hackathon" size="lg" 
      centered
      radius={"lg"}>
        <form onSubmit={form.onSubmit(handleSubmit)}>
          <Stack>
            <TextInput
              label="Name"
              placeholder="Enter hackathon name"
              required
              {...form.getInputProps('name')}
              radius={"md"}
            />
            <TextInput
              label="Description"
              placeholder="Enter hackathon description"
              required
              {...form.getInputProps('description')}
              radius={"md"}
            />
            <DateInput
              label="Start Date"
              placeholder="Select start date"
              required
              {...form.getInputProps('start_date')}
              radius={"md"}
            />
            <DateInput
              label="End Date"
              placeholder="Select end date"
              required
              {...form.getInputProps('end_date')}
              radius={"md"}
            />
            <Button type="submit" radius={"md"}>Create</Button>
          </Stack>
        </form>
      </Modal>
    </Stack>
  );
}
