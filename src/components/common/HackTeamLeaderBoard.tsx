import { Avatar, Box, Card, Center, Group, Image, Stack, Text, useMantineColorScheme, useMantineTheme } from '@mantine/core';
import { useEffect, useState } from 'react';
import { supabase } from '../../lib/supabase';
import { JudgingCriteria, Score, Team } from '../../types';
import { generateAvatar } from '../../utils/functions';

interface IHackTeamLeaderBoard {
    hackId: string;
}

interface CriteriaScore {
    criteriaId: string;
    name: string;
    score: number;
    maxScore: number;
    percentage: number;
    judgesScored: number;
    totalJudges: number;
}

interface TeamScore extends Team {
    totalScore: number;
    maxPossibleScore: number;
    criteriaScores: CriteriaScore[];
}

const HackTeamLeaderBoard = ({ hackId }: IHackTeamLeaderBoard) => {
    const [teams, setTeams] = useState<TeamScore[]>([]);
    const [loading, setLoading] = useState(true);

    const imgSize = 40;
    const { colorScheme } = useMantineColorScheme();
    const theme = useMantineTheme();
    const isDark = colorScheme === 'dark'

    // Set up real-time subscriptions
    useEffect(() => {
        // Subscribe to score changes
        const scoresSubscription = supabase
            .channel('scores-changes')
            .on(
                'postgres_changes',
                {
                    event: '*',
                    schema: 'public',
                    table: 'scores',
                    filter: `hackathon_id=eq.${hackId}`
                },
                () => {
                    console.log('Scores changed, refreshing data...');
                    fetchData();
                }
            )
            .subscribe();

        // Subscribe to judge changes
        const judgesSubscription = supabase
            .channel('judges-changes')
            .on(
                'postgres_changes',
                {
                    event: '*',
                    schema: 'public',
                    table: 'hackathon_judges',
                    filter: `hackathon_id=eq.${hackId}`
                },
                () => {
                    console.log('Judges changed, refreshing data...');
                    fetchData();
                }
            )
            .subscribe();

        // Cleanup subscriptions
        return () => {
            scoresSubscription.unsubscribe();
            judgesSubscription.unsubscribe();
        };
    }, [hackId])

    const fetchData = async () => {
        try {
            // Fetch teams
            const { data: teamsData } = await supabase
                .from('teams')
                .select('*')
                .eq('hackathon_id', hackId);

            // Fetch criteria to calculate max possible score
            const { data: criteriaData } = await supabase
                .from('judging_criteria')
                .select('*')
                .eq('hackathon_id', hackId);

            // Fetch all scores
            const { data: scoresData } = await supabase
                .from('scores')
                .select('*')
                .eq('hackathon_id', hackId);

            if (!teamsData || !criteriaData || !scoresData) return;

            const criteria = criteriaData as JudgingCriteria[];
            const scores = scoresData as Score[];

            // Calculate max possible score
            const maxPossibleScore = criteria.reduce((sum, c) => sum + c.max_score, 0);

            // Get all judges assigned to this hackathon
            const { data: hackathonJudges } = await supabase
                .from('hackathon_judges')
                .select('judge_id')
                .eq('hackathon_id', hackId);
            console.log("hack judges : ", hackathonJudges)

            const totalJudges = hackathonJudges?.length || 0;

            // Get unique judges who have scored
            const uniqueJudgeIds = [...new Set(scores.map(s => s.judge_id))];
            const judgeCount = uniqueJudgeIds.length;

            if (judgeCount === 0) return [];

            // Calculate scores for each team and criteria
            const teamsWithScores: TeamScore[] = teamsData.map((team) => {
                const teamScores = scores.filter((s) => s.team_id === team.id);

                // Calculate average scores for each criteria
                const criteriaScores: CriteriaScore[] = criteria.map(c => {
                    const criteriaScores = teamScores.filter(s => s.criteria_id === c.id);

                    // Calculate average score for this criterion across all judges
                    let totalScore = 0;
                    let judgesWhoScored = 0;

                    uniqueJudgeIds.forEach(judgeId => {
                        const judgeScore = criteriaScores.find(s => s.judge_id === judgeId);
                        if (judgeScore) {
                            totalScore += judgeScore.score;
                            judgesWhoScored++;
                        }
                    });

                    // Average score for this criterion
                    const averageScore = judgesWhoScored > 0 ? totalScore / judgesWhoScored : 0;
                    const percentage = (averageScore / c.max_score) * 100;

                    return {
                        criteriaId: c.id,
                        name: c.name,
                        score: Math.round(averageScore * 10) / 10, // Round to 1 decimal
                        maxScore: c.max_score,
                        percentage,
                        judgesScored: judgesWhoScored,
                        totalJudges
                    };
                });

                // Calculate total average score
                const totalScore = criteriaScores.reduce((sum, c) => sum + c.score, 0);

                return {
                    ...team,
                    totalScore: Math.round(totalScore * 10) / 10, // Round to 1 decimal
                    maxPossibleScore,
                    criteriaScores,
                };
            });

            // Sort teams by total score in descending order
            const sortedTeams = teamsWithScores.sort((a, b) => b.totalScore - a.totalScore);
            setTeams(sortedTeams);
        } catch (error) {
            console.error('Error fetching leaderboard data:', error);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchData();
    }, [hackId]);

    if (loading) {
        return <Text>Loading leaderboard...</Text>;
    }

    return (
        <Card shadow="xs" p={{ base: "8px", md: "md" }} radius="lg"
            bg={isDark ? `linear-gradient(to right,rgb(12, 12, 12),rgb(34, 34, 34))` : theme.white}
            style={{
                transition: "all 0.3s ease-in-out"
            }} >
            <Text size="xl" fw={600} mb="md">Team Rankings</Text>
            <Stack gap="xs">
                {teams.map((team, index) => (
                    <Box key={team.id} style={{
                        position: "relative"
                    }}>
                        {/* How can we push this box backwards */}
                        <Box
                            style={{
                                position: 'absolute',
                                top: 0,
                                left: 0,
                                bottom: 0,
                                right: 0,
                                width: '100%',
                                height: '100%',
                                borderRadius: '0 30px 30px 0',
                                background: 'linear-gradient(to right, #0030ff24, #05b9d8)',
                                maxWidth: `${(team.totalScore / team.maxPossibleScore) * 100}%`,
                                backgroundRepeat: 'no-repeat',
                                zIndex: 1
                            }}
                        >
                        </Box>
                        <Box px={"sm"} w={"100%"} style={{ position: "relative", zIndex: 2, }}>
                            <Group justify="space-between" mb={5} h={'100%'} align='center' gap={0} wrap='nowrap'>
                                <Group gap={6} flex={1} wrap='nowrap'>
                                    {
                                        index === 0 ? (
                                            <Center h={imgSize} w={imgSize} mih={imgSize} maw={imgSize} miw={imgSize} style={{ overflow: "hidden" }}>
                                                <Image src={"/images/1.png"} h={'100%'} w={'auto'} />
                                            </Center>
                                        ) : index === 1 ? (
                                            <Center h={imgSize} w={imgSize} mih={imgSize} maw={imgSize} miw={imgSize}>
                                                <Image src={"/images/2.png"} h={'100%'} w={'auto'} />
                                            </Center>
                                        ) : index === 2 ? (
                                            <Center h={imgSize} w={imgSize} mih={imgSize} maw={imgSize} miw={imgSize}>
                                                <Image src={"/images/3.png"} height={'100%'} w={'auto'} />
                                            </Center>
                                        ) : (
                                            <Box h={imgSize} w={imgSize} style={{ borderRadius: "50%" }} mih={imgSize} maw={imgSize} miw={imgSize} bg={isDark ? "#1e1e1e" : "#f5f5f5"}>
                                                <Center h={"100%"} w={"100%"}>
                                                    <Text fw={500} size='xl'>{index + 1}</Text>
                                                </Center>
                                            </Box>
                                        )
                                    }
                                    <Avatar name={team?.name} src={generateAvatar(team.name)} size="md" radius={"xl"} bg={isDark ? "#1e1e1e" : "#f5f5f5"} />
                                    <Stack gap={0}>
                                        <Text size="md" tt={"capitalize"} fw={400}>{team.name}</Text>
                                        <Group gap={16}>
                                            {team.criteriaScores.map((cs) => {
                                                let emoji = '😢'; // 0-20%
                                                if (cs.percentage >= 80) emoji = '😊'; // 80-100%
                                                else if (cs.percentage >= 60) emoji = '🙂'; // 60-80%
                                                else if (cs.percentage >= 40) emoji = '😐'; // 40-60%
                                                else if (cs.percentage >= 20) emoji = '🙁'; // 20-40%

                                                return (
                                                    <Text
                                                        key={cs.criteriaId}
                                                        size="xs"
                                                        fw={400}
                                                        title={`${cs.name}: ${cs.score}/${cs.maxScore} (${cs.judgesScored}/${cs.totalJudges} Js scored)`}
                                                    >
                                                        {emoji}  {cs.score} | {cs.judgesScored}/{cs.totalJudges}
                                                    </Text>
                                                );
                                            })}
                                        </Group>
                                    </Stack>
                                </Group>
                                <Text c={"white"} size="xl" fw={400}
                                    left={team.totalScore === 0 ? "60%" : `calc(${(team.totalScore / team.maxPossibleScore) * 100}% - 60px)`}
                                    pos={"absolute"}
                                >
                                    {team.totalScore.toLocaleString()}
                                </Text>
                            </Group>
                        </Box>
                    </Box>
                ))}
            </Stack>
        </Card>
    );
};

export default HackTeamLeaderBoard;