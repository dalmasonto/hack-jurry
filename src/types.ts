export interface Hackathon {
  id: string;
  name: string;
  description: string;
  start_date: string;
  end_date: string;
  created_at: string;
}

export interface Team {
  id: string;
  name: string;
  project_name: string;
  members: string[];
  hackathon_id: string;
  created_at: string;
}

export interface JudgingCriteria {
  id: string;
  name: string;
  description: string;
  max_score: number;
  hackathon_id: string;
  created_at: string;
}

export interface Score {
  id: string;
  score: number;
  team_id: string;
  judge_id: string;
  criteria_id: string;
  hackathon_id: string;
  created_at: string;
}

export interface User {
  id: string;
  email: string;
  role: 'admin' | 'judge';
  created_at: string;
}
