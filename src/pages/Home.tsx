import { Group, Stack, Text, Title } from '@mantine/core';
import { useEffect, useState } from 'react';
import HackTeamLeaderBoard from '../components/common/HackTeamLeaderBoard';
import { supabase } from '../lib/supabase';
import { Hackathon } from '../types';

const Home = () => {
  const [hackathons, setHackathons] = useState<Hackathon[]>([]);
  const [loading, setLoading] = useState(true);

  const fetchHackathons = async () => {
    try {
      const { data, error } = await supabase
        .from('hackathons')
        .select('*')
        // .gte('end_date', new Date().toISOString())
        // .order('start_date', { ascending: true });

      if (error) throw error;
      setHackathons(data || []);
    } catch (error) {
      console.error('Error fetching hackathons:', error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchHackathons();
  }, []);

  if (loading) {
    return <Text>Loading...</Text>;
  }

  return (
    <Stack px={{base: "8px", sm: "20px"}}>
      <Title order={1} fw={400}>Active Hackathons</Title>
        {hackathons.map((hackathon) => (
          <Stack key={hackathon.id} p="0">
            <Title order={3} fw={500}>{hackathon.name}</Title>
            <Group gap="xs">
              <Text size="sm" c="dimmed">Ends:</Text>
              <Text size="sm">{new Date(hackathon.end_date).toLocaleDateString()}</Text>
            </Group>
            <HackTeamLeaderBoard hackId={hackathon.id} />
          </Stack>
        ))}
        {hackathons.length === 0 && (
          <Text c="dimmed">No active hackathons at the moment.</Text>
        )}
    </Stack>
  );
};

export default Home;