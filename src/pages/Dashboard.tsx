import { Card, Grid, Group, SimpleGrid, Text, Title } from '@mantine/core';
import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';
import { Hackathon } from '../types';

export default function Dashboard() {
  const { user } = useAuth();
  const navigate = useNavigate();
  const [hackathons, setHackathons] = useState<Hackathon[]>([]);
  const [loading, setLoading] = useState(true);

  async function fetchHackathons() {
    try {
      let query = supabase
        .from('hackathons')
        .select('*');
      
      // If user is a judge, filter through a join with hackathon_judges
      if (user?.role === 'judge') {
        query = supabase
          .from('hackathon_judges')
          .select('hackathons:hackathons(*)')
          .eq('judge_id', user.id)
          .eq('hackathons.is_active', true);
      }

      const { data, error } = await query;
      
      if (error) throw error;
      
      // For judges, we need to transform the nested data structure
      const hackathonData = user?.role === 'judge'
        ? data?.map(item => item.hackathons) || []
        : data || [];
        
      setHackathons(hackathonData);
    } catch (error) {
      console.error('Error fetching hackathons:', error);
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {

    fetchHackathons();
  }, [user]);

  if (loading) {
    return <Text>Loading...</Text>;
  }

  return (
    <>
      <Title order={2} mb="md">Your Hackathons</Title>
      <SimpleGrid cols={{ base: 1, sm: 2, lg: 3 }}>
        {hackathons.map((hackathon) => (
          <Card 
            key={hackathon.id} 
            shadow="sm" 
            padding="lg" 
            radius="md" 
            withBorder
            onClick={() => navigate(`/hackathon/${hackathon.id}`)}
            style={{ cursor: 'pointer' }}
          >
            <Group justify="space-between" mb="xs">
              <Text fw={500}>{hackathon.name}</Text>
            </Group>

            <Text size="sm" c="dimmed" mb="md">
              {hackathon.description}
            </Text>

            <Grid>
              <Grid.Col span={6}>
                <Text size="xs" c="dimmed">Start Date</Text>
                <Text size="sm">{new Date(hackathon.start_date).toLocaleDateString()}</Text>
              </Grid.Col>
              <Grid.Col span={6}>
                <Text size="xs" c="dimmed">End Date</Text>
                <Text size="sm">{new Date(hackathon.end_date).toLocaleDateString()}</Text>
              </Grid.Col>
            </Grid>
          </Card>
        ))}
      </SimpleGrid>
    </>
  );
}
