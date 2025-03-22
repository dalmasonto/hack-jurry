import { Box, Button, Card, em, Grid, Group, NumberInput, Paper, Stack, Text, Title } from '@mantine/core';
import { useForm } from '@mantine/form';
import { notifications, showNotification } from '@mantine/notifications';
import { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';
import { Hackathon, JudgingCriteria, Score, Team } from '../types';
import { IconInfoCircle, IconSend2 } from '@tabler/icons-react';
import { limitChars } from '../utils/functions';
import { modals } from '@mantine/modals';

export default function HackathonScoring() {
  const { id } = useParams();
  const { user } = useAuth();
  const [hackathon, setHackathon] = useState<Hackathon | null>(null);
  const [teams, setTeams] = useState<Team[]>([]);
  const [criteria, setCriteria] = useState<JudgingCriteria[]>([]);
  const [scores, setScores] = useState<Score[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, [id]);

  const fetchData = async () => {
    try {
      if(!hackathon){
        setLoading(true);
      }
      // Fetch hackathon details
      const { data: hackathonData } = await supabase
        .from('hackathons')
        .select('*')
        .eq('id', id)
        .single();

      if (hackathonData) {
        setHackathon(hackathonData);

        // Fetch teams
        const { data: teamsData } = await supabase
          .from('teams')
          .select('*')
          .eq('hackathon_id', id);
        setTeams(teamsData || []);

        // Fetch criteria
        const { data: criteriaData } = await supabase
          .from('judging_criteria')
          .select('*')
          .eq('hackathon_id', id);
        setCriteria(criteriaData || []);

        // Fetch scores
        const { data: scoresData } = await supabase
          .from('scores')
          .select('*')
          .eq('hackathon_id', id);
        setScores(scoresData || []);
      }
    } catch (error) {
      console.error('Error fetching data:', error);
      notifications.show({
        title: 'Error',
        message: 'Failed to load hackathon data',
        color: 'red'
      });
    } finally {
      setLoading(false);
    }
  };

  const fetchScores = async () => {
    // Fetch scores
    if(!id) return;
    const { data: scoresData } = await supabase
    .from('scores')
    .select('*')
    .eq('hackathon_id', id);
  setScores(scoresData || []);
  }

  const handleScoreSubmit = async (values: Record<string, number>, teamId: string) => {
    try {
      const scoreSubmissions = Object.entries(values).map(([criteriaId, score]) => ({
        hackathon_id: id,
        team_id: teamId,
        judge_id: user?.id,
        criteria_id: criteriaId,
        score,
        // TODO: Add comment per criteria from each judge
        // comments: "some random test comment"
      }));

      const { error } = await supabase
        .from('scores')
        .upsert(scoreSubmissions, {
          onConflict: 'hackathon_id,team_id,judge_id,criteria_id'
        });

      if (error) {
        showNotification({
          title: 'Error',
          message: error.message || 'Failed to submit scores',
          color: 'red'
        });
        return;
      };

      showNotification({
        title: 'Success',
        message: 'Scores submitted successfully',
        color: 'green'
      });

      fetchData(); // Refresh scores
    } catch (error: any) {
      showNotification({
        title: 'Error',
        message: error.message || 'Failed to submit scores',
        color: 'red'
      });
    }
  };

  const getTeamTotalScore = (teamId: string) => {
    const teamScores = scores.filter(score => score.team_id === teamId);
    return teamScores.reduce((sum, score) => sum + score.score, 0);
  };

  const sortedTeams = [...teams].sort((a, b) => {
    const scoreA = getTeamTotalScore(a.id);
    const scoreB = getTeamTotalScore(b.id);
    return scoreB - scoreA;
  });

  // Use useEffect to listen to all changes in score data in realtime
  useEffect(() => {
    const channel = supabase
      .channel('scores')
      .on('postgres_changes', { event: '*', schema: 'public', table: 'scores' }, () => {
        fetchScores();
      })
      .subscribe();

    return () => {
      channel.unsubscribe();
    };
  }, []);

  if (loading) {
    return <Text>Loading...</Text>;
  }

  return (
    <Box p="md">
      <Title order={2} mb="lg">{hackathon?.name} - Scoring</Title>

      <Grid>
        <Grid.Col span={{md: 8, xs: 12}} order={{base: 2, md: 1}}>
          <Stack>
            {teams.map(team => (
              <ScoreCard
                key={team.id}
                team={team}
                criteria={criteria}
                scores={scores}
                onSubmit={handleScoreSubmit}
                userId={user?.id}
              />
            ))}
          </Stack>
        </Grid.Col>

        <Grid.Col span={{md: 4, xs: 12}} order={{base: 1, md: 2}}>
          <Paper withBorder p="md">
            <Title order={3} mb="md">Current Standings</Title>
            <Stack>
              {sortedTeams.map((team, index) => (
                <Group key={team.id} justify="space-between">
                  <Text size='sm'>
                    {index + 1}. {team.name}
                  </Text>
                  <Text fw={500}>{getTeamTotalScore(team.id)}</Text>
                </Group>
              ))}
            </Stack>
          </Paper>
        </Grid.Col>
      </Grid>
    </Box>
  );
}

interface ScoreCardProps {
  team: Team;
  criteria: JudgingCriteria[];
  scores: Score[];
  onSubmit: (values: Record<string, number>, teamId: string) => Promise<void>;
  userId?: string;
}

function ScoreCard({ team, criteria, scores, onSubmit, userId }: ScoreCardProps) {
  const initialValues = criteria.reduce((acc, criterion) => {
    const existingScore = scores.find(
      score => score.team_id === team.id &&
        score.criteria_id === criterion.id &&
        score.judge_id === userId
    );
    return {
      ...acc,
      [criterion.id]: existingScore?.score || 0
    };
  }, {});

  const form = useForm({
    initialValues
  });

  const handleIconInfoClick = (content: string) => modals.open({
    title: 'Criteria Description',
    children: <Text style={{whiteSpace: "pre-wrap"}}>{content}</Text>,
    radius: "md"
  })

  return (
    <Card withBorder>
      <Title order={4} mb="sm">{team.name}</Title>
      <Text size="sm" mb="md">Project: {team.project_name}</Text>
      
      <form onSubmit={form.onSubmit(values => onSubmit(values, team.id))}>
        <Stack>
          <Grid>
          {criteria.map(criterion => (
            <Grid.Col key={`${criterion.id}-${team.id}`} span={{md: 6}}>
                <NumberInput
                  label={criterion.name}
                  description={limitChars(criterion.description, 100)}
                  leftSection={<IconInfoCircle stroke={em(1.5)} size={"22px"} onClick={() => handleIconInfoClick(criterion.description ?? "")} />}
                  {...form.getInputProps(criterion.id)}
                  min={0}
                  max={criterion.max_score}
                  step={1}
                  radius="md"
                  rightSection={<Text size="sm" c="dimmed">/ {criterion.max_score}</Text>}
                />
            </Grid.Col>
          ))}
          </Grid>
          <Group justify="flex-end">
            <Button type="submit" radius={"md"} rightSection={<IconSend2 />}>Submit Scores</Button>
          </Group>
        </Stack>
      </form>
    </Card>
  );
}
