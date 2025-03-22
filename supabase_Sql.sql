-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- Create profiles table
create table profiles (
  id uuid references auth.users on delete cascade,
  email text unique not null,
  role text not null check (role in ('admin', 'judge')),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  primary key (id)
);

-- Create hackathons table
create table hackathons (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  description text,
  start_date timestamp with time zone not null,
  end_date timestamp with time zone not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create teams table
create table teams (
  id uuid default gen_random_uuid() primary key,
  hackathon_id uuid references hackathons on delete cascade not null,
  name text not null,
  project_name text not null,
  members text[] not null default '{}',
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  -- Ensure unique team names within a hackathon
  unique(hackathon_id, name)
);

-- Create judging_criteria table
create table judging_criteria (
  id uuid default gen_random_uuid() primary key,
  hackathon_id uuid references hackathons on delete cascade not null,
  name text not null,
  description text,
  max_score integer not null check (max_score > 0),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Create scores table
create table scores (
  id uuid default gen_random_uuid() primary key,
  hackathon_id uuid references hackathons on delete cascade not null,
  team_id uuid references teams on delete cascade not null,
  judge_id uuid references profiles on delete cascade not null,
  criteria_id uuid references judging_criteria on delete cascade not null,
  score numeric not null check (score >= 0),
  comments text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  -- Ensure one score per judge per team per criteria
  unique(hackathon_id, team_id, judge_id, criteria_id)
);

-- Enable Row Level Security (RLS) for all tables
alter table profiles enable row level security;
alter table hackathons enable row level security;
alter table teams enable row level security;
alter table judging_criteria enable row level security;
alter table scores enable row level security;

-- Teams policies
create policy "Teams are viewable by everyone"
  on teams for select
  using (true);

create policy "Only admins can insert teams"
  on teams for insert
  with check (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

create policy "Only admins can update teams"
  on teams for update
  using (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

create policy "Only admins can delete teams"
  on teams for delete
  using (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

-- Profiles policies
create policy "Public profiles are viewable by everyone"
  on profiles for select
  using (true);

create policy "Users can update their own profile"
  on profiles for update
  using (auth.uid() = id);

-- Hackathons policies
create policy "Hackathons are viewable by everyone"
  on hackathons for select
  using (true);

create policy "Only admins can insert hackathons"
  on hackathons for insert
  with check (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

create policy "Only admins can update hackathons"
  on hackathons for update
  using (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

create policy "Only admins can delete hackathons"
  on hackathons for delete
  using (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

-- Teams policies
create policy "Teams are viewable by everyone"
  on teams for select
  using (true);

create policy "Only admins can insert teams"
  on teams for insert
  with check (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

create policy "Only admins can update teams"
  on teams for update
  using (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

create policy "Only admins can delete teams"
  on teams for delete
  using (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

-- Judging criteria policies
create policy "Criteria are viewable by everyone"
  on judging_criteria for select
  using (true);

create policy "Only admins can insert criteria"
  on judging_criteria for insert
  with check (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

create policy "Only admins can update criteria"
  on judging_criteria for update
  using (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

create policy "Only admins can delete criteria"
  on judging_criteria for delete
  using (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

-- Scores policies
create policy "Scores are viewable by everyone"
  on scores for select
  using (true);

create policy "Judges can insert their own scores"
  on scores for insert
  with check (auth.uid() = judge_id);

create policy "Judges can update their own scores"
  on scores for update
  using (auth.uid() = judge_id);

create policy "Only admins can delete scores"
  on scores for delete
  using (exists (
    select 1 from profiles
    where id = auth.uid()
    and role = 'admin'
  ));

-- Add this policy to allow inserting profiles during signup
create policy "Allow public profile creation during signup"
  on profiles for insert
  with check (true);

CREATE POLICY "Users can view their own profile" ON profiles
FOR SELECT TO authenticated
USING (auth.uid() = id);

-- Optional: Enhanced scores policies
-- Uncomment these if you want more granular control

-- drop policy if exists "Scores are viewable by everyone" on scores;
-- 
-- -- Allow judges and admins to view all scores
-- create policy "Scores are viewable by judges and admins"
--   on scores for select
--   using (
--     exists (
--       select 1 from profiles
--       where id = auth.uid()
--       and role in ('admin', 'judge')
--     )
--   );
-- 
-- -- Allow judges to insert their own scores with role check
-- create policy "Judges can insert their own scores with role check"
--   on scores for insert
--   with check (
--     auth.uid() = judge_id and
--     exists (
--       select 1 from profiles
--       where id = auth.uid()
--       and role = 'judge'
--     )
--   );