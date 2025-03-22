import { Button, Card, em, Grid, Group, Modal, MultiSelect, Paper, Stack, Text, Title } from '@mantine/core';
import { notifications, showNotification } from '@mantine/notifications';
import { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { supabase } from '../lib/supabase';
import { Hackathon, JudgingCriteria, Team, User } from '../types';
import { TeamForm } from '../components/forms/TeamForm';
import { CriteriaForm } from '../components/forms/CriteriaForm';
import { IconArrowRight, IconTrash } from '@tabler/icons-react';
import { modals } from '@mantine/modals';

export default function HackathonDetails() {
  const { id } = useParams<{ id: string }>();
  const { user } = useAuth();
  const [hackathon, setHackathon] = useState<Hackathon | null>(null);
  const [teams, setTeams] = useState<Team[]>([]);
  const [criteria, setCriteria] = useState<JudgingCriteria[]>([]);
  const [judges, setJudges] = useState<User[]>([]);
  const [selectedJudges, setSelectedJudges] = useState<string[]>([]);
  const [assignedJudges, setAssignedJudges] = useState<any[]>([]);
  const [showCriteriaForm, setShowCriteriaForm] = useState(false);
  const [showTeamForm, setShowTeamForm] = useState(false);
  const [editingCriteria, setEditingCriteria] = useState<JudgingCriteria | null>(null);
  const [editingTeam, setEditingTeam] = useState<Team | null>(null);
  const [loading, setLoading] = useState(true);
  const [loadingJudges, setLoadingJudges] = useState(false);

  // Fetch functions
  const fetchHackathon = async () => {
    if (!id) return;
    try {
      const { data: hackathonData } = await supabase
        .from('hackathons')
        .select('*')
        .eq('id', id)
        .single();
      setHackathon(hackathonData);
    } catch (error) {
      console.error('Error fetching hackathon:', error);
    }
  };

  const fetchTeams = async () => {
    if (!id) return;
    try {
      const { data: teamsData } = await supabase
        .from('teams')
        .select('*')
        .eq('hackathon_id', id);
      setTeams(teamsData || []);
    } catch (error) {
      console.error('Error fetching teams:', error);
    }
  };

  const fetchCriteria = async () => {
    if (!id) return;
    try {
      const { data: criteriaData } = await supabase
        .from('judging_criteria')
        .select('*')
        .eq('hackathon_id', id);
      setCriteria(criteriaData || []);
    } catch (error) {
      console.error('Error fetching criteria:', error);
    }
  };

  const fetchJudges = async () => {
    if (!id) return;
    try {
      setLoadingJudges(true);

      const { data: judgesWithUsers } = await supabase
        .from('hackathon_judges')
        .select('*, profiles(*)')
        .eq('hackathon_id', id);
      setAssignedJudges(judgesWithUsers || []);
      setSelectedJudges(judgesWithUsers?.map(judge => judge.judge_id) || []);

    } catch (error) {
      console.error('Error fetching judges:', error);
    } finally {
      setLoadingJudges(false);
    }
  };

  // Initial data loading
  useEffect(() => {
    const loadData = async () => {
      setLoading(true);
      try {
        await Promise.all([
          fetchHackathon(),
          fetchTeams(),
          fetchCriteria(),
          fetchJudges()
        ]);
      } catch (error) {
        console.error('Error loading data:', error);
      } finally {
        setLoading(false);
      }
    };

    if (id) {
      loadData();
    }
  }, [id]);

  // Set up real-time subscriptions
  useEffect(() => {
    if (!id) return;

    // Subscribe to teams changes
    const teamsSubscription = supabase
      .channel('teams-changes')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'teams',
          filter: `hackathon_id=eq.${id}`
        },
        () => {
          console.log('Teams changed, refreshing...');
          fetchTeams();
        }
      )
      .subscribe();

    // Subscribe to judging criteria changes
    const criteriaSubscription = supabase
      .channel('criteria-changes')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'judging_criteria',
          filter: `hackathon_id=eq.${id}`
        },
        () => {
          console.log('Criteria changed, refreshing...');
          fetchCriteria();
        }
      )
      .subscribe();

    // Subscribe to hackathon judges changes
    const judgesSubscription = supabase
      .channel('judges-changes')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'hackathon_judges',
          filter: `hackathon_id=eq.${id}`
        },
        () => {
          console.log('Judges changed, refreshing...');
          fetchJudges();
        }
      )
      .subscribe();

    // Subscribe to hackathon changes
    const hackathonSubscription = supabase
      .channel('hackathon-changes')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'hackathons',
          filter: `id=eq.${id}`
        },
        () => {
          console.log('Hackathon changed, refreshing...');
          fetchHackathon();
        }
      )
      .subscribe();

    // Cleanup subscriptions
    return () => {
      teamsSubscription.unsubscribe();
      criteriaSubscription.unsubscribe();
      judgesSubscription.unsubscribe();
      hackathonSubscription.unsubscribe();
    };
  }, [id]);


  const handleDeleteTeam = async (teamId: string) => {
    try {
      const { error } = await supabase
        .from('teams')
        .delete()
        .eq('id', teamId);
      if (error) {
        console.error('Error deleting team:', error);
        showNotification({
          title: 'Error',
          message: 'Failed to delete team',
          color: 'red'
        });
        return;
      }
      setTeams((prevTeams) => prevTeams.filter(team => team.id !== teamId));
    } catch (error) {
      console.error('Error deleting team:', error);
      showNotification({
        title: 'Error',
        message: 'Failed to delete team',
        color: 'red'
      });
    }
  };

  const handleJudgeAssignment = async () => {
    try {
      const { error } = await supabase
        .from('hackathon_judges')
        .upsert(selectedJudges.map(judgeId => ({ hackathon_id: id, judge_id: judgeId })), {
          onConflict: 'hackathon_id, judge_id'
        })

      if (error) {
        showNotification({
          title: 'Error',
          message: 'Failed to update judge assignments',
          color: 'red'
        });
        return;
      } else {
        fetchJudges();
        showNotification({
          title: 'Success',
          message: 'Judge assignments updated successfully',
          color: 'green'
        });
      }
    } catch (error) {
      showNotification({
        title: 'Error',
        message: 'Failed to update judge assignments',
        color: 'red'
      });
    }
  };

  console.log(assignedJudges);

  const handleJudgeRemoval = async (judgeId: string) => {
    try {
      setLoadingJudges(true);
      const { error } = await supabase
        .from('hackathon_judges')
        .delete()
        .eq('judge_id', judgeId)
        .eq('hackathon_id', id);
      if (error) {
        console.error('Error removing judge:', error);
        showNotification({
          title: 'Error',
          message: 'Failed to remove judge',
          color: 'red'
        });
        return;
      } else {
        showNotification({
          title: 'Success',
          message: 'Judge removed successfully',
          color: 'green'
        });
      }
      setAssignedJudges((prevJudges) => prevJudges.filter(judge => judge.id !== judgeId));
      setLoadingJudges(false);
    } catch (error) {
      console.error('Error removing judge:', error);
      showNotification({
        title: 'Error',
        message: 'Failed to remove judge',
        color: 'red'
      });
      setLoadingJudges(false);
    }
  };

  const handleDeleteCriteria = async (criterionId: string) => {
    try {
      const { error } = await supabase
        .from('judging_criteria')
        .delete()
        .eq('id', criterionId)
        .eq('hackathon_id', id);
      if (error) {
        console.error('Error deleting criteria:', error);
        showNotification({
          title: 'Error',
          message: 'Failed to delete criteria',
          color: 'red'
        });
        return;
      } else {
        showNotification({
          title: 'Success',
          message: 'Criteria deleted successfully',
          color: 'green'
        });
      }
      setCriteria((prevCriteria) => prevCriteria.filter(criterion => criterion.id !== criterionId));
    } catch (error) {
      console.error('Error deleting criteria:', error);
      showNotification({
        title: 'Error',
        message: 'Failed to delete criteria',
        color: 'red'
      });
    }
  };

  const handleReadCriteria = (criteria: JudgingCriteria) => modals.open({
    title: `${criteria.name}`,
    radius: 'lg',
    centered: true,
    children: (
      <Stack>
        <Text style={{
          whiteSpace: "pre-wrap",
          textJustify: "inter-word"
        }}>{criteria.description}</Text>
        <Text fw={500}>Max Score: {criteria.max_score}</Text>
      </Stack>
    )
  })

  useEffect(() => {
    async function fetchHackathonData() {
      try {
        // Fetch hackathon details
        const { data: hackathonData } = await supabase
          .from('hackathons')
          .select('*')
          .eq('id', id)
          .single();

        if (hackathonData) {
          setHackathon(hackathonData);

          // Fetch teams with their members
          const { data: teamsData, error: teamsError } = await supabase
            .from('teams')
            .select('*')
            .eq('hackathon_id', id);

          if (teamsError) {
            console.error('Error fetching teams:', teamsError);
            notifications.show({
              title: 'Error',
              message: 'Failed to load teams',
              color: 'red'
            });
          } else {
            setTeams(teamsData || []);
          }

          // Fetch all judges (users with role 'judge')
          const { data: judgesData } = await supabase
            .from('profiles')
            .select('id, email')
            .eq('role', 'judge');
          setJudges(judgesData as any || []);

          // Fetch assigned judges for this hackathon
          // const { data: assignedJudgesData } = await supabase
          //   .from('hackathon_judges')
          //   .select('*')
          //   .eq('hackathon_id', id);
          // setAssignedJudges(assignedJudgesData || []);

          // Load the judges and the associated users
          const { data: judgesWithUsers } = await supabase
            .from('hackathon_judges')
            .select('*, profiles(*)')
            .eq('hackathon_id', id);
          setAssignedJudges(judgesWithUsers || []);
          setSelectedJudges(judgesWithUsers?.map(judge => judge.judge_id) || []);

          // Fetch scores for the current judge
          const { data: scoresData } = await supabase
            .from('scores')
            .select('*')
            .eq('hackathon_id', id)
            .eq('judge_id', user?.id);
          console.log("Scores data: ", scoresData)
          // setScores(scoresData || []);

          // Load Criteria
          const { data: criteriaData } = await supabase
            .from('judging_criteria')
            .select('*')
            .eq('hackathon_id', id);
          console.log("Criteria data: ", criteriaData)
          setCriteria(criteriaData || []);
        }
      } catch (error) {
        console.error('Error fetching hackathon data:', error);
        notifications.show({
          title: 'Error',
          message: 'Failed to load hackathon data',
          color: 'red',
        });
      } finally {
        setLoading(false);
      }
    }

    if (id) {
      fetchHackathonData();
    }
  }, [id, user]);

  // useEffect(() => {
  //   if(assignedJudges.length > 0){

  //   }
  // }, [assignedJudges])


  if (loading) {
    return <Text>Loading...</Text>;
  }

  if (!hackathon) {
    return <Text>Hackathon not found</Text>;
  }

  if (!user) {
    return <Text>Please log in to view this page</Text>;
  }

  console.log("Assinged: ", assignedJudges)
  return (
    <Stack p="md" gap={30}>

      {/* Heading */}
      <Group align='center' justify='space-between'>
        <Stack gap={10}>
          <Title order={2}>{hackathon.name}</Title>
          <Text size="sm" c="dimmed">{hackathon.description}</Text>
        </Stack>
        <Button
          component={Link}
          to={`/hackathons/${id}/scoring`}
          rightSection={<IconArrowRight />}
          radius={"md"}
          size='lg'
          variant='filled'
          color='indigo'
        >
          Go to Scoring
        </Button>
      </Group>

      {/* Judges */}
      <Grid>
        <Grid.Col span={{ md: 6 }}>
          <Paper withBorder p="md" mt="md" radius={"lg"} h={"100%"}>
            <Stack gap={10}>
              <Title order={3}>
                {user.role === 'admin' ? ("Manage Judges") : ("Judges")}
              </Title>
              {assignedJudges
                .map(judge => (
                  <Group key={judge?.judge_id} justify="space-between">
                    <Text size="sm">{judge?.profiles?.email}</Text>
                    {user.role === 'admin' && (
                      <Button
                        size="xs"
                        variant="light"
                        radius={"md"}
                        color="red"
                        onClick={() => handleJudgeRemoval(judge.id)}
                        loading={loadingJudges}
                        rightSection={<IconTrash size={"18px"} stroke={em(1.5)} />}
                      >
                        Remove
                      </Button>
                    )}
                  </Group>
                ))
              }
            </Stack>
          </Paper>

        </Grid.Col>

        {user.role === 'admin' && (
          <Grid.Col span={{ md: 6 }}>
            <Paper withBorder p="md" mt="md" h={"100%"} radius={"lg"}>
              <Title order={3} mb="md">Assign Judges</Title>
              <Stack>
                <MultiSelect
                  data={judges?.map(judge => ({
                    value: judge.id,
                    label: judge.email
                  })) || []}
                  value={selectedJudges.map(judge => judge)}
                  onChange={setSelectedJudges}
                  placeholder="Select judges"
                  label="Judges"
                  mb="md"
                />
                <Button onClick={handleJudgeAssignment}>Update Judges</Button>
              </Stack>
            </Paper>
          </Grid.Col>
        )}
      </Grid>

      {/* Criteria Management - Admin Only */}
      <Card withBorder={false} shadow="lg" radius={"lg"}>
        <Stack>
          <Group justify="space-between">
            <Title order={3}>Judging Criteria</Title>
            {user.role === 'admin' && (
              <Button onClick={() => {
                setShowCriteriaForm(true);
              }}radius={"md"}>Add Criteria</Button>
            )}
          </Group>

          {/* Criteria List */}
          {criteria.length > 0 ? (
            <Grid>
              {criteria.map((criterion) => (
                <Grid.Col key={criterion.id} span={{ base: 12, sm: 6, lg: 4 }}>
                  <Card key={criterion.id} withBorder={true} shadow='lg' radius={"lg"} h={"100%"}>
                    <Group justify="space-between">
                      <div>
                        <Text fw={500}>{criterion.name}</Text>
                        <Text size="sm" c="dimmed">Max Score: {criterion.max_score}</Text>
                        {criterion.description && (
                          <Text size="sm" mt="xs">{criterion.description}</Text>
                        )}
                      </div>
                      <Button
                        size="xs"
                        variant="light"
                        color='green'
                        radius={"md"}
                        onClick={() => handleReadCriteria(criterion)}
                      >
                        Read
                      </Button>
                      {user.role === 'admin' && (
                        <Group>
                          <Button
                            size="xs"
                            variant="light"
                            radius={"md"}
                            onClick={() => {
                              setEditingCriteria(criterion)
                              setShowCriteriaForm(true);
                            }}
                          >
                            Edit
                          </Button>

                          <Button
                            size="xs"
                            color="red"
                            variant="light"
                            radius={"md"}
                            onClick={() => handleDeleteCriteria(criterion.id)}
                          >
                            Delete
                          </Button>
                        </Group>
                      )}
                    </Group>
                  </Card>
                </Grid.Col>
              ))}
            </Grid>
          ) : (
            <Text c="dimmed" ta="center">No criteria defined yet</Text>
          )}
        </Stack>
      </Card>

      {/* Criteria Form Modal */}
      <Modal
        opened={showCriteriaForm}
        onClose={() => {
          setShowCriteriaForm(false);
          // criteriaForm.reset();
        }}
        title={`${editingCriteria ? 'Edit' : 'Add'} Judging Criteria`}
        size={"lg"}
        radius={"lg"}
        centered={true}
      >
        <CriteriaForm
          hackathonId={id || ''}
          opened={showCriteriaForm}
          onClose={() => {
            setShowCriteriaForm(false);
            setEditingCriteria(null);
          }}
          onSuccess={() => {
            setShowCriteriaForm(false);
            setEditingCriteria(null);
          }}
          // onSubmit={handleCriteriaSubmit}
          editingCriteria={editingCriteria as any}
        />
      </Modal>

        
        {/* Teams */}
      <Paper withBorder p="md" radius={"lg"}>
        <Group justify="space-between" mb="md">
          <Title order={3} fw={500}>Teams</Title>
          {user.role === 'admin' && (
            <Button onClick={() => {
              setShowTeamForm(true);
            }} radius={"md"}>Add Team</Button>
          )}
        </Group>

        <Grid>
          {teams.map(team => (
            <Grid.Col key={team.id} span={{ xs: 12, sm: 6, md: 4, lg: 3 }}>
              <Card withBorder h={'100%'} radius={"lg"}>
                <Group justify="space-between" mb="sm">
                  <div>
                    <Text fw={500} size='sm'>{team.name}</Text>
                    <Text size="xs" c="dimmed">Project: {team.project_name}</Text>
                  </div>
                  {user.role === 'admin' && (
                    <Group>
                      <Button
                        size="xs"
                        variant="light"
                        radius={"md"}
                        onClick={() => {
                          setEditingTeam(team);
                          setShowTeamForm(true);
                        }}
                      >
                        Edit
                      </Button>
                      <Button
                        size="xs"
                        radius={"md"}
                        color="red"
                        variant="light"
                        onClick={() => handleDeleteTeam(team.id)}
                      >
                        Delete
                      </Button>
                    </Group>
                  )}
                </Group>
                <div>
                  <Text size="sm" fw={500} mb="xs">Team Members:</Text>
                  <Stack gap="xs">
                    {Array.isArray(team.members) && team.members.length > 0 ? (
                      team.members.map((member, index) => (
                        <Text key={index} size="sm">{member}</Text>
                      ))
                    ) : (
                      <Text size="sm" c="dimmed">No team members</Text>
                    )}
                  </Stack>
                </div>
              </Card>
            </Grid.Col>
          ))}
        </Grid>
      </Paper>

      {/* Team Form Modal */}
      <Modal
        opened={showTeamForm}
        onClose={() => {
          setShowTeamForm(false);
          setEditingTeam(null);
        }}
        title={`${editingTeam ? 'Edit' : 'Add'} Team`}
        size={"lg"}
        radius={"lg"}
        centered={true}
      >
        <TeamForm
          hackathonId={hackathon.id}
          opened={showTeamForm}
          onClose={() => {
            setShowTeamForm(false);
            setEditingTeam(null);
          }}
          onSuccess={() => {
            setShowTeamForm(false);
            setEditingTeam(null);
          }}
          editingTeam={editingTeam as any}
        />
      </Modal>
    </Stack>
  );
}
