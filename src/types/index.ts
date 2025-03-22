export interface User {
  id: string;
  email: string;
  role: 'admin' | 'judge';
}

export interface Hackathon {
  id: string;
  name: string;
  description: string;
  start_date: string;
  end_date: string;
  created_at: string;
}

export interface JudgingCriteria {
  id: string;
  hackathon_id: string;
  name: string;
  description: string;
  max_score: number;
}

export interface Team {
  id: string;
  hackathon_id: string;
  name: string;
  project_name: string;
  members: string[];
}

export interface Score {
  id: string;
  hackathon_id: string;
  team_id: string;
  judge_id: string;
  criteria_id: string;
  score: number;
  comments: string;
  created_at: string;
}
