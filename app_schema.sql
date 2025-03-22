-- Application Tables

--
-- Name: hackathon_judges; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.hackathon_judges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    hackathon_id uuid NOT NULL,
    judge_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

--
-- Name: hackathons; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.hackathons (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

--
-- Name: judging_criteria; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.judging_criteria (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    hackathon_id uuid NOT NULL,
    name text NOT NULL,
    description text,
    max_score integer NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    CONSTRAINT judging_criteria_max_score_check CHECK ((max_score > 0))
);

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    email text NOT NULL,
    role text NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    CONSTRAINT profiles_role_check CHECK ((role = ANY (ARRAY['admin'::text, 'judge'::text])))
);

--
-- Name: scores; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.scores (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    hackathon_id uuid NOT NULL,
    team_id uuid NOT NULL,
    judge_id uuid NOT NULL,
    criteria_id uuid NOT NULL,
    score numeric NOT NULL,
    comments text,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    CONSTRAINT scores_score_check CHECK ((score >= (0)::numeric))
);

--
-- Name: teams; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.teams (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    hackathon_id uuid NOT NULL,
    name text NOT NULL,
    project_name text NOT NULL,
    members text[] DEFAULT '{}'::text[] NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Primary Keys and Constraints

ALTER TABLE ONLY public.hackathon_judges
    ADD CONSTRAINT hackathon_judges_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.hackathons
    ADD CONSTRAINT hackathons_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.judging_criteria
    ADD CONSTRAINT judging_criteria_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);

-- Foreign Key Constraints

ALTER TABLE ONLY public.hackathon_judges
    ADD CONSTRAINT hackathon_judges_hackathon_id_fkey FOREIGN KEY (hackathon_id) REFERENCES public.hackathons(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.hackathon_judges
    ADD CONSTRAINT hackathon_judges_judge_id_fkey FOREIGN KEY (judge_id) REFERENCES public.profiles(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.judging_criteria
    ADD CONSTRAINT judging_criteria_hackathon_id_fkey FOREIGN KEY (hackathon_id) REFERENCES public.hackathons(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_criteria_id_fkey FOREIGN KEY (criteria_id) REFERENCES public.judging_criteria(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_hackathon_id_fkey FOREIGN KEY (hackathon_id) REFERENCES public.hackathons(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_judge_id_fkey FOREIGN KEY (judge_id) REFERENCES public.profiles(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_hackathon_id_fkey FOREIGN KEY (hackathon_id) REFERENCES public.hackathons(id) ON DELETE CASCADE;

-- RLS Policies

ALTER TABLE public.hackathon_judges ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.hackathons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.judging_criteria ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.scores ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.teams ENABLE ROW LEVEL SECURITY;

-- Hackathon Judges Policies
CREATE POLICY "Enable read access for all users" ON public.hackathon_judges FOR SELECT USING (true);
CREATE POLICY "Enable insert for admins only" ON public.hackathon_judges FOR INSERT WITH CHECK ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));
CREATE POLICY "Enable delete for admins only" ON public.hackathon_judges FOR DELETE USING ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));

-- Hackathons Policies
CREATE POLICY "Enable read access for all users" ON public.hackathons FOR SELECT USING (true);
CREATE POLICY "Enable insert for admins only" ON public.hackathons FOR INSERT WITH CHECK ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));
CREATE POLICY "Enable update for admins only" ON public.hackathons FOR UPDATE USING ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));
CREATE POLICY "Enable delete for admins only" ON public.hackathons FOR DELETE USING ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));

-- Judging Criteria Policies
CREATE POLICY "Enable read access for all users" ON public.judging_criteria FOR SELECT USING (true);
CREATE POLICY "Enable insert for admins only" ON public.judging_criteria FOR INSERT WITH CHECK ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));
CREATE POLICY "Enable update for admins only" ON public.judging_criteria FOR UPDATE USING ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));
CREATE POLICY "Enable delete for admins only" ON public.judging_criteria FOR DELETE USING ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));

-- Profiles Policies
CREATE POLICY "Enable read access for all users" ON public.profiles FOR SELECT USING (true);
CREATE POLICY "Enable insert for authenticated users only" ON public.profiles FOR INSERT WITH CHECK (
    -- Allow users to create their own profile
    auth.uid() = id OR
    -- Allow initial profile creation during signup
    (SELECT COUNT(*) FROM public.profiles WHERE id = auth.uid()) = 0
);
CREATE POLICY "Enable update for users based on id" ON public.profiles FOR UPDATE USING ((auth.uid() = id));

-- Scores Policies
CREATE POLICY "Enable read access for all users" ON public.scores FOR SELECT USING (true);
CREATE POLICY "Enable insert for judges" ON public.scores FOR INSERT WITH CHECK ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = ANY (ARRAY['admin'::text, 'judge'::text])))));
CREATE POLICY "Enable update for judges" ON public.scores FOR UPDATE USING ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = ANY (ARRAY['admin'::text, 'judge'::text])))));
CREATE POLICY "Enable delete for admins only" ON public.scores FOR DELETE USING ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));

-- Teams Policies
CREATE POLICY "Enable read access for all users" ON public.teams FOR SELECT USING (true);
CREATE POLICY "Enable insert for admins only" ON public.teams FOR INSERT WITH CHECK ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));
CREATE POLICY "Enable update for admins only" ON public.teams FOR UPDATE USING ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));
CREATE POLICY "Enable delete for admins only" ON public.teams FOR DELETE USING ((auth.uid() IN ( SELECT profiles.id FROM public.profiles WHERE (profiles.role = 'admin'::text))));

-- Unique Constraints
ALTER TABLE ONLY public.hackathon_judges
    ADD CONSTRAINT hackathon_judges_hackathon_id_judge_id_key UNIQUE (hackathon_id, judge_id);

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_hackathon_id_name_key UNIQUE (hackathon_id, name);
