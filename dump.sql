--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA _realtime;


ALTER SCHEMA _realtime OWNER TO supabase_admin;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      PERFORM pg_notify(
          'realtime:system',
          jsonb_build_object(
              'error', SQLERRM,
              'function', 'realtime.send',
              'event', event,
              'topic', topic,
              'private', private
          )::text
      );
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
	select string_to_array(name, '/') into _parts;
	select _parts[array_length(_parts,1)] into _filename;
	-- @todo return the last part instead of 2
	return reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
BEGIN
    RETURN query EXECUTE
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name || '/' AS name,
                    NULL::uuid AS id,
                    NULL::timestamptz AS updated_at,
                    NULL::timestamptz AS created_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
                ORDER BY prefixes.name COLLATE "C" LIMIT $3
            )
            UNION ALL
            (SELECT split_part(name, '/', $4) AS key,
                name,
                id,
                updated_at,
                created_at,
                metadata
            FROM storage.objects
            WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
            ORDER BY name COLLATE "C" LIMIT $3)
        ) obj
        ORDER BY name COLLATE "C" LIMIT $3;
        $sql$
        USING prefix, bucket_name, limits, levels, start_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _realtime.extensions OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name text,
    external_id text,
    jwt_secret text,
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default text DEFAULT 'postgres_cdc_rls'::text,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL,
    suspend boolean DEFAULT false,
    jwt_jwks jsonb,
    notify_private_alpha boolean DEFAULT false,
    private_only boolean DEFAULT false NOT NULL
);


ALTER TABLE _realtime.tenants OWNER TO supabase_admin;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: hackathon_judges; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.hackathon_judges (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    hackathon_id uuid NOT NULL,
    judge_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE public.hackathon_judges OWNER TO supabase_admin;

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


ALTER TABLE public.hackathons OWNER TO supabase_admin;

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


ALTER TABLE public.judging_criteria OWNER TO supabase_admin;

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


ALTER TABLE public.profiles OWNER TO supabase_admin;

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


ALTER TABLE public.scores OWNER TO supabase_admin;

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


ALTER TABLE public.teams OWNER TO supabase_admin;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2025_03_20; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_03_20 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_03_20 OWNER TO supabase_admin;

--
-- Name: messages_2025_03_21; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_03_21 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_03_21 OWNER TO supabase_admin;

--
-- Name: messages_2025_03_22; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_03_22 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_03_22 OWNER TO supabase_admin;

--
-- Name: messages_2025_03_23; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_03_23 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_03_23 OWNER TO supabase_admin;

--
-- Name: messages_2025_03_24; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_03_24 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_03_24 OWNER TO supabase_admin;

--
-- Name: messages_2025_03_25; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_03_25 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_03_25 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER TABLE vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: messages_2025_03_20; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_03_20 FOR VALUES FROM ('2025-03-20 00:00:00') TO ('2025-03-21 00:00:00');


--
-- Name: messages_2025_03_21; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_03_21 FOR VALUES FROM ('2025-03-21 00:00:00') TO ('2025-03-22 00:00:00');


--
-- Name: messages_2025_03_22; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_03_22 FOR VALUES FROM ('2025-03-22 00:00:00') TO ('2025-03-23 00:00:00');


--
-- Name: messages_2025_03_23; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_03_23 FOR VALUES FROM ('2025-03-23 00:00:00') TO ('2025-03-24 00:00:00');


--
-- Name: messages_2025_03_24; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_03_24 FOR VALUES FROM ('2025-03-24 00:00:00') TO ('2025-03-25 00:00:00');


--
-- Name: messages_2025_03_25; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_03_25 FOR VALUES FROM ('2025-03-25 00:00:00') TO ('2025-03-26 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Data for Name: extensions; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
47982ca0-2249-45e9-aed6-30b7a4c3f4e0	postgres_cdc_rls	{"region": "us-east-1", "db_host": "QhixI0o7PYIABziLUL4f0A==", "db_name": "sWBpZNdjggEPTQVlI52Zfw==", "db_port": "H8x8nmym7HD1xvaLFqqMLQ==", "db_user": "uxbEq/zz8DXVD53TOI1zmw==", "slot_name": "supabase_realtime_replication_slot", "db_password": "eGxa2ZKVreSn7eWieRQdp74vN25K+qFgdnxmDCKe4p20+C0410WXonzXTEj9CgYx", "publication": "supabase_realtime", "ssl_enforced": false, "poll_interval_ms": 100, "poll_max_changes": 100, "poll_max_record_bytes": 1048576}	realtime-dev	2025-03-21 21:01:33	2025-03-21 21:01:33
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.schema_migrations (version, inserted_at) FROM stdin;
20210706140551	2025-03-21 15:33:40
20220329161857	2025-03-21 15:33:40
20220410212326	2025-03-21 15:33:40
20220506102948	2025-03-21 15:33:40
20220527210857	2025-03-21 15:33:40
20220815211129	2025-03-21 15:33:40
20220815215024	2025-03-21 15:33:40
20220818141501	2025-03-21 15:33:40
20221018173709	2025-03-21 15:33:40
20221102172703	2025-03-21 15:33:40
20221223010058	2025-03-21 15:33:40
20230110180046	2025-03-21 15:33:40
20230810220907	2025-03-21 15:33:40
20230810220924	2025-03-21 15:33:40
20231024094642	2025-03-21 15:33:40
20240306114423	2025-03-21 15:33:40
20240418082835	2025-03-21 15:33:40
20240625211759	2025-03-21 15:33:40
20240704172020	2025-03-21 15:33:40
20240902173232	2025-03-21 15:33:40
20241106103258	2025-03-21 15:33:40
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: _realtime; Owner: supabase_admin
--

COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second, suspend, jwt_jwks, notify_private_alpha, private_only) FROM stdin;
05043628-e8e1-48de-a1b2-61f0c0ebda78	realtime-dev	realtime-dev	eGxa2ZKVreSn7eWieRQdp60i5H6KJLiST7splFU6MVHylMSAoQ2SjsTrTTQo/+bmYjQcO4hNnGTU+D1wtlXreA==	200	2025-03-21 21:01:33	2025-03-21 21:01:33	100	postgres_cdc_rls	100000	100	100	f	\N	f	f
\.


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	5ad361c4-a30f-4911-addf-8d2bc2abcb7d	{"action":"user_signedup","actor_id":"ab02efde-724a-4e08-b048-ef1042a628d6","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 15:51:38.612333+00	
00000000-0000-0000-0000-000000000000	0bfc5a1f-18b9-41e0-83ae-420d789a81bd	{"action":"login","actor_id":"ab02efde-724a-4e08-b048-ef1042a628d6","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 15:51:38.614214+00	
00000000-0000-0000-0000-000000000000	c8cf5773-6fb4-4285-ba41-7f046823f2ee	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogembo@gmail.com","user_id":"ab02efde-724a-4e08-b048-ef1042a628d6","user_phone":""}}	2025-03-21 15:52:02.872818+00	
00000000-0000-0000-0000-000000000000	1b769d91-4ad0-4ebc-9f2e-95b52fc91b62	{"action":"user_signedup","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 15:52:07.370025+00	
00000000-0000-0000-0000-000000000000	f733e6ba-1b45-414b-916e-a671694db395	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 15:52:07.376975+00	
00000000-0000-0000-0000-000000000000	195ba651-260a-419e-a270-cc7013608ada	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 15:54:15.425213+00	
00000000-0000-0000-0000-000000000000	d32c1ebf-2e79-436a-9d13-f4b265a273c2	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 15:56:16.629205+00	
00000000-0000-0000-0000-000000000000	9ba819dc-66de-4c8b-8e08-79beec1a5ce6	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 15:57:40.443453+00	
00000000-0000-0000-0000-000000000000	9566dc4a-da85-4ccb-a564-b5db202b9a6a	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:00:23.80328+00	
00000000-0000-0000-0000-000000000000	622b07d8-7a1b-47f6-bee2-c01fff895ddb	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:01:23.026802+00	
00000000-0000-0000-0000-000000000000	349e47d2-7399-46ad-8c13-dd24a0457aed	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:01:48.285933+00	
00000000-0000-0000-0000-000000000000	f27762b7-5078-4ebb-8264-ac0b4f69a312	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:02:03.165596+00	
00000000-0000-0000-0000-000000000000	6fdfe0d7-d200-49ad-b577-4f2a89c2c26b	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:02:23.916558+00	
00000000-0000-0000-0000-000000000000	ef9e832f-bcbb-48a1-9567-bf73826051f9	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:03:58.644253+00	
00000000-0000-0000-0000-000000000000	287b31e2-3a60-49da-ab97-c7fe2fd27432	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:04:08.300372+00	
00000000-0000-0000-0000-000000000000	3ed69fae-9482-47de-b821-187b45d38add	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:04:24.181828+00	
00000000-0000-0000-0000-000000000000	e8ce1f44-78ec-4813-ab6c-d3f2089f18ca	{"action":"login","actor_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:05:03.153501+00	
00000000-0000-0000-0000-000000000000	a3706338-4e5d-406c-85a3-0a956162b599	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogembo@gmail.com","user_id":"2d452598-5aa1-4798-9c86-11cec4fbebca","user_phone":""}}	2025-03-21 16:10:00.219364+00	
00000000-0000-0000-0000-000000000000	bbcb8d94-2c0a-4820-b480-3a0cdec8859e	{"action":"user_signedup","actor_id":"0eda8040-eb7a-4af3-ba46-b4c682504087","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:14:57.267894+00	
00000000-0000-0000-0000-000000000000	30e7bf15-08ab-44dc-9469-f1766a8955b4	{"action":"login","actor_id":"0eda8040-eb7a-4af3-ba46-b4c682504087","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:14:57.269174+00	
00000000-0000-0000-0000-000000000000	736ed12a-c3c2-4a3c-b1e5-2756207331f0	{"action":"user_repeated_signup","actor_id":"0eda8040-eb7a-4af3-ba46-b4c682504087","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-21 16:15:57.406435+00	
00000000-0000-0000-0000-000000000000	fff2bc44-946c-407e-8d21-5ff53dc1a64b	{"action":"user_signedup","actor_id":"25802f2d-99cf-44f7-a673-38b227262c60","actor_username":"dalmasogedmbo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:16:08.974423+00	
00000000-0000-0000-0000-000000000000	f81c051a-96a4-4f9b-ac60-536b9d24b3bc	{"action":"login","actor_id":"25802f2d-99cf-44f7-a673-38b227262c60","actor_username":"dalmasogedmbo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:16:08.981054+00	
00000000-0000-0000-0000-000000000000	d8e97000-958a-4f37-870a-4247950f83ef	{"action":"user_signedup","actor_id":"986846d6-cae2-43e9-ac9f-d2ca00836b04","actor_username":"dalmasogfdfembo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:16:46.338437+00	
00000000-0000-0000-0000-000000000000	fbaf8d01-c052-4c8e-b7d5-af47b69ede19	{"action":"login","actor_id":"986846d6-cae2-43e9-ac9f-d2ca00836b04","actor_username":"dalmasogfdfembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:16:46.339407+00	
00000000-0000-0000-0000-000000000000	9731c047-5b1e-419e-9850-2670bfd5ace4	{"action":"user_signedup","actor_id":"5a96e0d1-0bff-4268-ae16-d7d8a1f55a04","actor_username":"dalmasofdsafdsgembo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:17:00.656343+00	
00000000-0000-0000-0000-000000000000	3eb06466-c40f-4cec-9f92-d321b9e7f143	{"action":"login","actor_id":"5a96e0d1-0bff-4268-ae16-d7d8a1f55a04","actor_username":"dalmasofdsafdsgembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:17:00.658382+00	
00000000-0000-0000-0000-000000000000	d2fa7d49-6db9-408b-a99a-531f0a3af81d	{"action":"user_signedup","actor_id":"94d71b2c-5847-49c9-b881-530fb25e4c3a","actor_username":"dalmasogembo@gmffdail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:18:15.880297+00	
00000000-0000-0000-0000-000000000000	b1a3b675-62d6-47f6-a4d2-c94f2ee92911	{"action":"login","actor_id":"94d71b2c-5847-49c9-b881-530fb25e4c3a","actor_username":"dalmasogembo@gmffdail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:18:15.886726+00	
00000000-0000-0000-0000-000000000000	8bff6c8b-b307-434c-bdfd-b1d7f8f5793e	{"action":"user_signedup","actor_id":"154bc089-f804-4f8d-b1ee-de00b242af6b","actor_username":"dalmasfdsfdogembo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:19:12.818357+00	
00000000-0000-0000-0000-000000000000	5c22155f-c3d8-487a-9118-eb2bf30fcd14	{"action":"login","actor_id":"154bc089-f804-4f8d-b1ee-de00b242af6b","actor_username":"dalmasfdsfdogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:19:12.819664+00	
00000000-0000-0000-0000-000000000000	1697f359-679b-4d09-a066-0b2a058eeda7	{"action":"user_signedup","actor_id":"82e339cd-e2e8-404f-a10a-984fd2926845","actor_username":"dalmasogefdfmbo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:20:17.775387+00	
00000000-0000-0000-0000-000000000000	e7adb252-6dea-44f7-87c1-370c3d4c6230	{"action":"login","actor_id":"82e339cd-e2e8-404f-a10a-984fd2926845","actor_username":"dalmasogefdfmbo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:20:17.781935+00	
00000000-0000-0000-0000-000000000000	c19a05ef-63c4-4d24-8574-b9a53b5a3165	{"action":"user_signedup","actor_id":"cacb968c-65b4-42d1-8705-3882bc0b3469","actor_username":"dalmasogfdsfdembo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:21:47.139493+00	
00000000-0000-0000-0000-000000000000	972c1f30-ce20-430d-babf-1751a2eebc92	{"action":"login","actor_id":"cacb968c-65b4-42d1-8705-3882bc0b3469","actor_username":"dalmasogfdsfdembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:21:47.141023+00	
00000000-0000-0000-0000-000000000000	cd793426-aaa6-45b1-a660-f0523964ccbf	{"action":"user_signedup","actor_id":"14cced12-66b8-433b-baef-0216565d4c1e","actor_username":"dalmasofdsfdsgembo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:23:00.364555+00	
00000000-0000-0000-0000-000000000000	3a93a2cb-4c2b-4485-8f7a-ccb2d651323d	{"action":"login","actor_id":"14cced12-66b8-433b-baef-0216565d4c1e","actor_username":"dalmasofdsfdsgembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:23:00.371139+00	
00000000-0000-0000-0000-000000000000	996a7394-0ab1-434f-afe9-05b8e898d1fa	{"action":"user_signedup","actor_id":"88e8b732-7ae0-4196-83d9-fd3480750cb2","actor_username":"dalmasogefdfdmbo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:24:47.837454+00	
00000000-0000-0000-0000-000000000000	f4754da5-e2b8-47da-9305-24f208821aef	{"action":"login","actor_id":"88e8b732-7ae0-4196-83d9-fd3480750cb2","actor_username":"dalmasogefdfdmbo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:24:47.8396+00	
00000000-0000-0000-0000-000000000000	6e81bcff-fd70-4d1b-9f56-76b136792efa	{"action":"user_signedup","actor_id":"72ce15a9-6abf-4351-be88-a4d67f436249","actor_username":"dalmasogetrt5mbo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:27:14.096139+00	
00000000-0000-0000-0000-000000000000	fc29c33f-4b3c-41ec-b4e8-09b5f42cc7fa	{"action":"login","actor_id":"72ce15a9-6abf-4351-be88-a4d67f436249","actor_username":"dalmasogetrt5mbo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:27:14.098567+00	
00000000-0000-0000-0000-000000000000	3b850a17-30e3-4041-8914-fe36efc6a491	{"action":"logout","actor_id":"72ce15a9-6abf-4351-be88-a4d67f436249","actor_username":"dalmasogetrt5mbo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 16:28:13.899556+00	
00000000-0000-0000-0000-000000000000	b59874a4-f9c6-4272-9921-9820e2926ea5	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogefdfdmbo@gmail.com","user_id":"88e8b732-7ae0-4196-83d9-fd3480750cb2","user_phone":""}}	2025-03-21 16:28:41.552887+00	
00000000-0000-0000-0000-000000000000	2a07f45f-ead8-4413-a02e-41ace2247b4c	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogefdfmbo@gmail.com","user_id":"82e339cd-e2e8-404f-a10a-984fd2926845","user_phone":""}}	2025-03-21 16:28:41.5609+00	
00000000-0000-0000-0000-000000000000	0cdf57ee-e148-459e-b6f9-a1a32f1d4907	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasofdsfdsgembo@gmail.com","user_id":"14cced12-66b8-433b-baef-0216565d4c1e","user_phone":""}}	2025-03-21 16:28:41.573991+00	
00000000-0000-0000-0000-000000000000	d4b6a641-0538-4295-8141-928e0c217dcf	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogetrt5mbo@gmail.com","user_id":"72ce15a9-6abf-4351-be88-a4d67f436249","user_phone":""}}	2025-03-21 16:28:41.577153+00	
00000000-0000-0000-0000-000000000000	c0fb6f75-dae7-49ef-8947-33f7e631abf5	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogembo@gmffdail.com","user_id":"94d71b2c-5847-49c9-b881-530fb25e4c3a","user_phone":""}}	2025-03-21 16:28:41.578706+00	
00000000-0000-0000-0000-000000000000	1fd1806d-ed77-403e-85b3-cd060898714f	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogfdsfdembo@gmail.com","user_id":"cacb968c-65b4-42d1-8705-3882bc0b3469","user_phone":""}}	2025-03-21 16:28:41.57983+00	
00000000-0000-0000-0000-000000000000	298ba587-ea63-4cce-a9ac-7cdace964414	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasofdsafdsgembo@gmail.com","user_id":"5a96e0d1-0bff-4268-ae16-d7d8a1f55a04","user_phone":""}}	2025-03-21 16:28:41.596742+00	
00000000-0000-0000-0000-000000000000	5605e257-b19d-45ce-a9c0-5f25c236856c	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasfdsfdogembo@gmail.com","user_id":"154bc089-f804-4f8d-b1ee-de00b242af6b","user_phone":""}}	2025-03-21 16:28:41.598003+00	
00000000-0000-0000-0000-000000000000	5124b6b7-dbc5-44a0-b250-79014e90335f	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogedmbo@gmail.com","user_id":"25802f2d-99cf-44f7-a673-38b227262c60","user_phone":""}}	2025-03-21 16:28:41.611937+00	
00000000-0000-0000-0000-000000000000	522367af-4629-4567-bb7c-36171f536365	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogfdfembo@gmail.com","user_id":"986846d6-cae2-43e9-ac9f-d2ca00836b04","user_phone":""}}	2025-03-21 16:28:41.611904+00	
00000000-0000-0000-0000-000000000000	c4065831-bef7-461e-95bb-c595763e6a84	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dalmasogembo@gmail.com","user_id":"0eda8040-eb7a-4af3-ba46-b4c682504087","user_phone":""}}	2025-03-21 16:28:41.620161+00	
00000000-0000-0000-0000-000000000000	9fc0ff6f-4ead-408e-a937-c7643bc074a4	{"action":"user_signedup","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 16:29:05.105262+00	
00000000-0000-0000-0000-000000000000	ac401a44-04af-4985-afe4-e31745f022fd	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:29:05.112303+00	
00000000-0000-0000-0000-000000000000	fbc7a77a-ff28-486a-a7fe-92faeb5ce068	{"action":"user_repeated_signup","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-21 16:29:50.70262+00	
00000000-0000-0000-0000-000000000000	5498b2cd-d8c3-4fbf-89b2-6e9f9f098dd5	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:29:57.048978+00	
00000000-0000-0000-0000-000000000000	8107548e-fc86-4282-94e2-632a9a57be04	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:41:26.219759+00	
00000000-0000-0000-0000-000000000000	d1030ffc-e0b2-4a88-aead-42b3af677e78	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:41:50.269863+00	
00000000-0000-0000-0000-000000000000	d718becd-b061-4bc3-9fc7-5d3c469a626d	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:42:36.021027+00	
00000000-0000-0000-0000-000000000000	c931bc39-410c-4850-9fec-e147284dc872	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:42:50.71382+00	
00000000-0000-0000-0000-000000000000	779687a1-18c3-4e0d-9563-2830d317a4bf	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:43:14.576424+00	
00000000-0000-0000-0000-000000000000	dd13b062-7187-4179-a029-5af6a5ba654c	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:46:53.706465+00	
00000000-0000-0000-0000-000000000000	7de70361-0c88-471c-a492-231e59641b0f	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 16:50:23.149268+00	
00000000-0000-0000-0000-000000000000	05d31762-fe41-405a-8016-f7b583864c0d	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:00:07.531843+00	
00000000-0000-0000-0000-000000000000	7511ccb5-c514-4d24-bf5f-fc80c6f3edae	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:02:12.686097+00	
00000000-0000-0000-0000-000000000000	9ccce952-ece1-40e6-92f8-666b19542616	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:02:59.192865+00	
00000000-0000-0000-0000-000000000000	e8bd41c0-364a-4e71-89d9-2554d2e82051	{"action":"user_repeated_signup","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-21 17:04:42.611709+00	
00000000-0000-0000-0000-000000000000	e023376b-e6f7-4996-ad9f-1d880240da86	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:04:46.642671+00	
00000000-0000-0000-0000-000000000000	ab12be6c-00ed-4750-ac87-1d2bce2ec0d6	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:08:18.41124+00	
00000000-0000-0000-0000-000000000000	92ea66da-198c-44b9-8bbd-18d6be76226a	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:08:36.897165+00	
00000000-0000-0000-0000-000000000000	99597a67-efaa-4d53-865c-7a729827d3e9	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:08:54.296336+00	
00000000-0000-0000-0000-000000000000	bb78e1d7-d8dc-4ad5-8e86-acb786651dab	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:10:47.60614+00	
00000000-0000-0000-0000-000000000000	10f29d6c-9339-49ab-9529-76e246b9f88b	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:12:58.403051+00	
00000000-0000-0000-0000-000000000000	f574dd3f-9262-4d50-abcc-7fe39e278abb	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:13:41.309641+00	
00000000-0000-0000-0000-000000000000	a8869f88-53f4-4db9-8406-b34ec4f0680c	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:14:47.338723+00	
00000000-0000-0000-0000-000000000000	91bb45ba-7899-4714-b0d1-86a9b5efaf9f	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:18:19.39998+00	
00000000-0000-0000-0000-000000000000	73c90608-5c5e-4f07-9d0a-2def5b60bc35	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:21:12.226112+00	
00000000-0000-0000-0000-000000000000	87fbfeae-5d9c-4f94-a2bb-6c5d6cbbc073	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:22:26.897158+00	
00000000-0000-0000-0000-000000000000	491ba3da-8c01-415f-a42e-e7f2da163183	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:23:12.591094+00	
00000000-0000-0000-0000-000000000000	733b1749-5af0-42f2-adeb-f9b9f1ce54b2	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:24:02.103494+00	
00000000-0000-0000-0000-000000000000	a52bd463-64b6-4751-9510-ec41e3fe2286	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:24:08.334719+00	
00000000-0000-0000-0000-000000000000	74500722-8156-4023-8b70-d63492b44a14	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:24:52.554342+00	
00000000-0000-0000-0000-000000000000	fca6cce4-8e10-4a67-adff-5ea3db2bbc95	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 17:31:54.165347+00	
00000000-0000-0000-0000-000000000000	3718252b-5819-40b1-82bd-c358c5db42e1	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:32:14.831256+00	
00000000-0000-0000-0000-000000000000	ce8345dd-23f1-46ef-875f-f7962330dd19	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 17:32:16.487138+00	
00000000-0000-0000-0000-000000000000	90615c5c-3e85-402a-848c-7ed85dd78cff	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:33:02.59398+00	
00000000-0000-0000-0000-000000000000	4377363e-c45d-4a41-a773-6941ffc5f5bf	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 17:33:03.725988+00	
00000000-0000-0000-0000-000000000000	bf02fece-7773-4754-b2b2-333c6aea1068	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:33:04.857357+00	
00000000-0000-0000-0000-000000000000	7a8adce4-f31f-4f0c-af48-a1af502d09df	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:37:02.649239+00	
00000000-0000-0000-0000-000000000000	ded49343-0956-4df3-80fa-eacfff2e5c5e	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:41:14.099336+00	
00000000-0000-0000-0000-000000000000	3e382ad9-4d4d-4409-b50d-2ffd4b96f1af	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 17:41:32.213035+00	
00000000-0000-0000-0000-000000000000	2251ff0a-6011-4880-8a1c-4b49d0a69e5f	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:41:33.169142+00	
00000000-0000-0000-0000-000000000000	1e8ec6fa-0c50-4347-96a1-142500167676	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 17:41:34.503134+00	
00000000-0000-0000-0000-000000000000	c4cc343c-d37a-4f44-9d4f-74829ffd9d03	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:41:35.339726+00	
00000000-0000-0000-0000-000000000000	16a3be60-cc82-413d-af4b-f879c4de8670	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 17:42:30.561173+00	
00000000-0000-0000-0000-000000000000	428a213c-16f2-427e-87b5-ab12d8cad8b5	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:42:31.915098+00	
00000000-0000-0000-0000-000000000000	3a4bc13f-024c-44a1-83e9-30427a6fe6ea	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 17:49:14.073534+00	
00000000-0000-0000-0000-000000000000	4ce435f7-43ff-4ccd-8840-de089d7a492c	{"action":"user_signedup","actor_id":"a2c87177-1dab-4a5d-95c8-a82a51d93182","actor_username":"cshamaldas@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-21 17:49:37.335407+00	
00000000-0000-0000-0000-000000000000	34c9aa58-4ffc-4885-9683-7072d94b1f22	{"action":"login","actor_id":"a2c87177-1dab-4a5d-95c8-a82a51d93182","actor_username":"cshamaldas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:49:37.338035+00	
00000000-0000-0000-0000-000000000000	87c0513f-5df8-4f1e-a2b1-f67bb6725884	{"action":"logout","actor_id":"a2c87177-1dab-4a5d-95c8-a82a51d93182","actor_username":"cshamaldas@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 17:49:40.679739+00	
00000000-0000-0000-0000-000000000000	4208411b-4169-417a-9b8c-c33bbcf6b38e	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 17:49:42.19269+00	
00000000-0000-0000-0000-000000000000	09c2a537-2359-488d-8b2c-e7ec08c605c8	{"action":"token_refreshed","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-21 18:54:44.639441+00	
00000000-0000-0000-0000-000000000000	7c0c4384-4ed4-43bd-b234-cfe78b385c40	{"action":"token_revoked","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-21 18:54:44.639714+00	
00000000-0000-0000-0000-000000000000	9d981fae-ee47-480a-be09-7f898c9296f9	{"action":"token_refreshed","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-21 21:03:29.93847+00	
00000000-0000-0000-0000-000000000000	cea09e2c-1769-407f-976d-78a6a4f5b7f6	{"action":"token_revoked","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-21 21:03:29.939752+00	
00000000-0000-0000-0000-000000000000	ff52aeff-62f9-437a-8183-30f25a4bd7a5	{"action":"token_refreshed","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-21 22:01:39.628175+00	
00000000-0000-0000-0000-000000000000	5b63f623-df9c-4bbe-8410-6fad52dbb0c2	{"action":"token_revoked","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-21 22:01:39.628903+00	
00000000-0000-0000-0000-000000000000	6b04c748-2230-408d-bf80-5f8988745413	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 22:33:02.214967+00	
00000000-0000-0000-0000-000000000000	fd82e08e-7b4d-44e2-aff8-6902a4d6c07c	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 22:40:24.846734+00	
00000000-0000-0000-0000-000000000000	2737e823-cd48-4333-9ca6-d0c8b5ba18ff	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-21 22:40:33.893479+00	
00000000-0000-0000-0000-000000000000	7a44c99d-1ad3-4490-a6af-dfb1f52180fd	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-21 22:41:58.799189+00	
00000000-0000-0000-0000-000000000000	f84d34ea-8dfd-495c-9df9-7598368ceb35	{"action":"token_refreshed","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-21 23:40:40.487286+00	
00000000-0000-0000-0000-000000000000	90971009-9b9d-4c43-9e98-297854089fae	{"action":"token_revoked","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-21 23:40:40.488125+00	
00000000-0000-0000-0000-000000000000	03f509d3-6e3c-4fdc-9e4f-6e186f3b13d8	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-22 00:04:55.905021+00	
00000000-0000-0000-0000-000000000000	57e55437-6bca-4e48-b4bc-f375a8d5a8ac	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-22 00:05:02.577596+00	
00000000-0000-0000-0000-000000000000	ddd816cd-42eb-4a5e-a689-5781dc4fc9ba	{"action":"user_repeated_signup","actor_id":"a2c87177-1dab-4a5d-95c8-a82a51d93182","actor_username":"cshamaldas@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2025-03-22 00:05:20.148037+00	
00000000-0000-0000-0000-000000000000	6992d084-2989-4298-8ad4-bdc794b66028	{"action":"login","actor_id":"a2c87177-1dab-4a5d-95c8-a82a51d93182","actor_username":"cshamaldas@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-22 00:05:35.343421+00	
00000000-0000-0000-0000-000000000000	d1b8e95f-089d-44e4-b72c-035e94e7065f	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-22 00:39:50.110429+00	
00000000-0000-0000-0000-000000000000	926a4ea6-4bbd-408b-ad3e-1796f6cc3feb	{"action":"user_signedup","actor_id":"2b8472f2-a485-424a-b157-0c50297373a5","actor_username":"dante@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-22 00:48:36.166983+00	
00000000-0000-0000-0000-000000000000	03cd4c1a-58a4-462d-97c2-4113640efbf7	{"action":"login","actor_id":"2b8472f2-a485-424a-b157-0c50297373a5","actor_username":"dante@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-22 00:48:36.168418+00	
00000000-0000-0000-0000-000000000000	aa0c154f-659a-4c98-b891-3f62896bd840	{"action":"token_refreshed","actor_id":"a2c87177-1dab-4a5d-95c8-a82a51d93182","actor_username":"cshamaldas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-22 01:04:50.657328+00	
00000000-0000-0000-0000-000000000000	6b60c8ba-76dc-46b8-b32b-70c670683340	{"action":"token_revoked","actor_id":"a2c87177-1dab-4a5d-95c8-a82a51d93182","actor_username":"cshamaldas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-22 01:04:50.657637+00	
00000000-0000-0000-0000-000000000000	f1b3c2d3-f177-4067-a8fe-320ed8b3e906	{"action":"token_refreshed","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-22 01:37:57.749351+00	
00000000-0000-0000-0000-000000000000	8af1abfd-526b-4232-a904-9529e9e751a9	{"action":"token_revoked","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-22 01:37:57.749562+00	
00000000-0000-0000-0000-000000000000	274d8b57-42ac-4174-8c3d-c11931d39198	{"action":"token_refreshed","actor_id":"2b8472f2-a485-424a-b157-0c50297373a5","actor_username":"dante@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-22 01:47:05.829841+00	
00000000-0000-0000-0000-000000000000	9788613e-1026-4303-b98d-eb663b88912c	{"action":"token_revoked","actor_id":"2b8472f2-a485-424a-b157-0c50297373a5","actor_username":"dante@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-22 01:47:05.830821+00	
00000000-0000-0000-0000-000000000000	43bab0f3-96c2-400d-9da1-861bc09e1ba2	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-22 01:55:32.067937+00	
00000000-0000-0000-0000-000000000000	9aec7dbf-2c86-4f6d-977f-a2d4884d6f59	{"action":"user_signedup","actor_id":"041909d9-6d77-4101-9c82-8d2fb1bb2019","actor_username":"felix@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}	2025-03-22 02:02:42.111391+00	
00000000-0000-0000-0000-000000000000	aa7be2ef-3bd2-4fca-8c84-27c036a4bcae	{"action":"login","actor_id":"041909d9-6d77-4101-9c82-8d2fb1bb2019","actor_username":"felix@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-22 02:02:42.113839+00	
00000000-0000-0000-0000-000000000000	6c232c0a-de4f-49fc-8fa1-02aeccbfb69c	{"action":"logout","actor_id":"041909d9-6d77-4101-9c82-8d2fb1bb2019","actor_username":"felix@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-22 02:02:58.321354+00	
00000000-0000-0000-0000-000000000000	41ef107f-7913-4e9d-830e-16a52e7b565c	{"action":"login","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-22 02:02:59.78497+00	
00000000-0000-0000-0000-000000000000	33de7531-90b2-4263-92b8-c4c7a1f16b11	{"action":"token_refreshed","actor_id":"a2c87177-1dab-4a5d-95c8-a82a51d93182","actor_username":"cshamaldas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-22 02:03:05.492736+00	
00000000-0000-0000-0000-000000000000	65a49697-b238-4969-b5c7-9c31a20e8e4a	{"action":"token_revoked","actor_id":"a2c87177-1dab-4a5d-95c8-a82a51d93182","actor_username":"cshamaldas@gmail.com","actor_via_sso":false,"log_type":"token"}	2025-03-22 02:03:05.493156+00	
00000000-0000-0000-0000-000000000000	dfa4f250-a2d9-443a-8c46-3099adf5bfa2	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"felix1@gmail.com","user_id":"f493b75d-cc9f-4cb6-8edf-877fcb5e4031","user_phone":""}}	2025-03-22 02:11:47.350727+00	
00000000-0000-0000-0000-000000000000	ee8f7aee-fd59-490c-80c3-fee91cd2746b	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"felix2@gmail.com","user_id":"0c8957cb-9624-435c-a754-b2367c64da43","user_phone":""}}	2025-03-22 02:12:04.719173+00	
00000000-0000-0000-0000-000000000000	4bd2bc25-ed61-499d-86c1-807323c50021	{"action":"logout","actor_id":"a3c364db-6d44-41a8-ba83-7949acc8eca2","actor_username":"dalmasogembo@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-22 02:12:06.28649+00	
00000000-0000-0000-0000-000000000000	e3964290-d42f-4e11-8788-efb2da21a167	{"action":"login","actor_id":"0c8957cb-9624-435c-a754-b2367c64da43","actor_username":"felix2@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2025-03-22 02:12:12.508193+00	
00000000-0000-0000-0000-000000000000	14f99181-2e99-429a-bb23-d51fe13b7d25	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"hacker1@gmail.com","user_id":"960c6a12-dc1c-4be4-87d6-3dbf1f4322f1","user_phone":""}}	2025-03-22 02:12:41.509585+00	
00000000-0000-0000-0000-000000000000	0402d73e-36ba-4b6c-9593-f19c942412d3	{"action":"logout","actor_id":"0c8957cb-9624-435c-a754-b2367c64da43","actor_username":"felix2@gmail.com","actor_via_sso":false,"log_type":"account"}	2025-03-22 02:17:44.273402+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
a3c364db-6d44-41a8-ba83-7949acc8eca2	a3c364db-6d44-41a8-ba83-7949acc8eca2	{"sub": "a3c364db-6d44-41a8-ba83-7949acc8eca2", "email": "dalmasogembo@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-03-21 16:29:05.10339+00	2025-03-21 16:29:05.10343+00	2025-03-21 16:29:05.10343+00	0244be94-498f-491f-a3a7-d10437f54a6f
a2c87177-1dab-4a5d-95c8-a82a51d93182	a2c87177-1dab-4a5d-95c8-a82a51d93182	{"sub": "a2c87177-1dab-4a5d-95c8-a82a51d93182", "email": "cshamaldas@gmail.com", "confirm": false, "email_verified": false, "phone_verified": false}	email	2025-03-21 17:49:37.33439+00	2025-03-21 17:49:37.334414+00	2025-03-21 17:49:37.334414+00	a9278e0d-9d0a-4827-ab7e-75f870f82f90
2b8472f2-a485-424a-b157-0c50297373a5	2b8472f2-a485-424a-b157-0c50297373a5	{"sub": "2b8472f2-a485-424a-b157-0c50297373a5", "email": "dante@gmail.com", "confirm": false, "email_verified": false, "phone_verified": false}	email	2025-03-22 00:48:36.166035+00	2025-03-22 00:48:36.166077+00	2025-03-22 00:48:36.166077+00	4e38ae6d-f39b-4d00-9f35-cfa79f28c28c
041909d9-6d77-4101-9c82-8d2fb1bb2019	041909d9-6d77-4101-9c82-8d2fb1bb2019	{"sub": "041909d9-6d77-4101-9c82-8d2fb1bb2019", "email": "felix@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-03-22 02:02:42.110046+00	2025-03-22 02:02:42.110071+00	2025-03-22 02:02:42.110071+00	c6ecc3ec-e0f3-4dec-abfc-7e6c68a9508e
f493b75d-cc9f-4cb6-8edf-877fcb5e4031	f493b75d-cc9f-4cb6-8edf-877fcb5e4031	{"sub": "f493b75d-cc9f-4cb6-8edf-877fcb5e4031", "email": "felix1@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-03-22 02:11:47.350241+00	2025-03-22 02:11:47.350288+00	2025-03-22 02:11:47.350288+00	519881f1-babd-4013-b95f-a1879c26a511
0c8957cb-9624-435c-a754-b2367c64da43	0c8957cb-9624-435c-a754-b2367c64da43	{"sub": "0c8957cb-9624-435c-a754-b2367c64da43", "email": "felix2@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-03-22 02:12:04.718553+00	2025-03-22 02:12:04.718639+00	2025-03-22 02:12:04.718639+00	ee0013ff-8685-454a-bb3a-37e07696c8fb
960c6a12-dc1c-4be4-87d6-3dbf1f4322f1	960c6a12-dc1c-4be4-87d6-3dbf1f4322f1	{"sub": "960c6a12-dc1c-4be4-87d6-3dbf1f4322f1", "email": "hacker1@gmail.com", "email_verified": false, "phone_verified": false}	email	2025-03-22 02:12:41.509226+00	2025-03-22 02:12:41.509254+00	2025-03-22 02:12:41.509254+00	65670d4a-19a2-4acb-96af-e681fb91d3c2
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
70b07300-aa49-4216-9ab6-fc8432770c20	2025-03-22 00:05:35.345213+00	2025-03-22 00:05:35.345213+00	password	4c85a598-a17e-4f8b-8a58-7132be58a3b0
a7b67ae4-11f0-4463-9787-e3ece0992fe3	2025-03-22 00:48:36.169126+00	2025-03-22 00:48:36.169126+00	password	e418b387-25ca-4414-b772-9c65fe3656fb
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	70	n4KnYCNKBde_z1NbqVchNw	a2c87177-1dab-4a5d-95c8-a82a51d93182	t	2025-03-22 00:05:35.344741+00	2025-03-22 01:04:50.657869+00	\N	70b07300-aa49-4216-9ab6-fc8432770c20
00000000-0000-0000-0000-000000000000	72	-y1nh8FmzOQpqSxmzsmrcw	2b8472f2-a485-424a-b157-0c50297373a5	t	2025-03-22 00:48:36.168783+00	2025-03-22 01:47:05.83147+00	\N	a7b67ae4-11f0-4463-9787-e3ece0992fe3
00000000-0000-0000-0000-000000000000	75	X_h7_hwrMnUCQVrk_XCo9Q	2b8472f2-a485-424a-b157-0c50297373a5	f	2025-03-22 01:47:05.831976+00	2025-03-22 01:47:05.831976+00	-y1nh8FmzOQpqSxmzsmrcw	a7b67ae4-11f0-4463-9787-e3ece0992fe3
00000000-0000-0000-0000-000000000000	73	C3G5M-LQcdahn5zKPxeDsA	a2c87177-1dab-4a5d-95c8-a82a51d93182	t	2025-03-22 01:04:50.658072+00	2025-03-22 02:03:05.493565+00	n4KnYCNKBde_z1NbqVchNw	70b07300-aa49-4216-9ab6-fc8432770c20
00000000-0000-0000-0000-000000000000	79	k_3BjkjHhiSZMNtIqHoZjA	a2c87177-1dab-4a5d-95c8-a82a51d93182	f	2025-03-22 02:03:05.493777+00	2025-03-22 02:03:05.493777+00	C3G5M-LQcdahn5zKPxeDsA	70b07300-aa49-4216-9ab6-fc8432770c20
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
a7b67ae4-11f0-4463-9787-e3ece0992fe3	2b8472f2-a485-424a-b157-0c50297373a5	2025-03-22 00:48:36.168588+00	2025-03-22 01:47:05.833915+00	\N	aal1	\N	2025-03-22 01:47:05.83382	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	172.22.0.1	\N
70b07300-aa49-4216-9ab6-fc8432770c20	a2c87177-1dab-4a5d-95c8-a82a51d93182	2025-03-22 00:05:35.344496+00	2025-03-22 02:03:05.49502+00	\N	aal1	\N	2025-03-22 02:03:05.494948	Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1	172.22.0.1	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	2b8472f2-a485-424a-b157-0c50297373a5	authenticated	authenticated	dante@gmail.com	$2a$10$gdKnDrLiEC6g9Wuxppc9IOg/Fi18Fey7GcRySpOUn3/HmC7rdJGc.	2025-03-22 00:48:36.167117+00	\N		\N		\N			\N	2025-03-22 00:48:36.168548+00	{"provider": "email", "providers": ["email"]}	{"sub": "2b8472f2-a485-424a-b157-0c50297373a5", "email": "dante@gmail.com", "confirm": false, "email_verified": true, "phone_verified": false}	\N	2025-03-22 00:48:36.163326+00	2025-03-22 01:47:05.832999+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	0c8957cb-9624-435c-a754-b2367c64da43	authenticated	authenticated	felix2@gmail.com	$2a$10$GQUH1Ty4p.MWpsqn.v5aU.YryG0Nzp.a6d9Av0SafU1QPEjVcK3Me	2025-03-22 02:12:04.720029+00	\N		\N		\N			\N	2025-03-22 02:12:12.508576+00	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-03-22 02:12:04.717669+00	2025-03-22 02:12:12.509482+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	041909d9-6d77-4101-9c82-8d2fb1bb2019	authenticated	authenticated	felix@gmail.com	$2a$10$uuTt2FpQvjmOxMsCzV9ge.uWQwJ6JNp.AEW190vuTPneE3bZX4Y4e	2025-03-22 02:02:42.111667+00	\N		\N		\N			\N	2025-03-22 02:02:42.114082+00	{"provider": "email", "providers": ["email"]}	{"sub": "041909d9-6d77-4101-9c82-8d2fb1bb2019", "email": "felix@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-03-22 02:02:42.108385+00	2025-03-22 02:02:42.114946+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a3c364db-6d44-41a8-ba83-7949acc8eca2	authenticated	authenticated	dalmasogembo@gmail.com	$2a$10$M.t.Y6nO1gNEQbaT5ZEJv.mkz0xSHwFoIHIkIAclCY.iCJvDv9D9W	2025-03-21 16:29:05.105482+00	\N		\N		\N			\N	2025-03-22 02:02:59.785306+00	{"provider": "email", "providers": ["email"]}	{"sub": "a3c364db-6d44-41a8-ba83-7949acc8eca2", "email": "dalmasogembo@gmail.com", "email_verified": true, "phone_verified": false}	\N	2025-03-21 16:29:05.098703+00	2025-03-22 02:02:59.786077+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	a2c87177-1dab-4a5d-95c8-a82a51d93182	authenticated	authenticated	cshamaldas@gmail.com	$2a$10$J3B3Y9XdS1vAhjxVoVoIvuIRnbFlTTRwSKionSO0g84MqXpZxPd8S	2025-03-21 17:49:37.335652+00	\N		\N		\N			\N	2025-03-22 00:05:35.34446+00	{"provider": "email", "providers": ["email"]}	{"sub": "a2c87177-1dab-4a5d-95c8-a82a51d93182", "email": "cshamaldas@gmail.com", "confirm": false, "email_verified": true, "phone_verified": false}	\N	2025-03-21 17:49:37.333189+00	2025-03-22 02:03:05.49441+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	960c6a12-dc1c-4be4-87d6-3dbf1f4322f1	authenticated	authenticated	hacker1@gmail.com	$2a$10$E7Pb8Qz9vAlsW.ROq4RbdezU.fRC9wG7yANJ7SPO/6te795L9PUq6	2025-03-22 02:12:41.509984+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-03-22 02:12:41.508607+00	2025-03-22 02:12:41.510981+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	f493b75d-cc9f-4cb6-8edf-877fcb5e4031	authenticated	authenticated	felix1@gmail.com	$2a$10$tSnbOorNP4uXakS5Z1M3ye2IHRzWwUwlln6z5h/gBJJIcf4U92T/i	2025-03-22 02:11:47.351368+00	\N		\N		\N			\N	\N	{"provider": "email", "providers": ["email"]}	{"email_verified": true}	\N	2025-03-22 02:11:47.349569+00	2025-03-22 02:11:47.351795+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: hackathon_judges; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.hackathon_judges (id, hackathon_id, judge_id, created_at) FROM stdin;
876ef000-d3b0-47a9-baf2-c982d8a5966e	e451e127-234c-4bd9-b34b-3da84ba4d2ef	a2c87177-1dab-4a5d-95c8-a82a51d93182	2025-03-21 21:28:06.73827+00
a805fc8b-f987-4f55-b0a1-b8928e6ff803	adb68a7f-e446-49c2-8692-b1c1c18b9459	a2c87177-1dab-4a5d-95c8-a82a51d93182	2025-03-22 00:41:38.092065+00
2d4351bd-4007-4904-ad84-d5c57452b119	adb68a7f-e446-49c2-8692-b1c1c18b9459	2b8472f2-a485-424a-b157-0c50297373a5	2025-03-22 00:48:54.160109+00
c97943fe-5127-4899-bd3c-bbe20e0a10f7	26aae630-6c51-4706-a5bf-546557c76117	2b8472f2-a485-424a-b157-0c50297373a5	2025-03-22 02:16:18.097+00
7f6d0be2-25b4-4e25-a859-586e531ba7c5	26aae630-6c51-4706-a5bf-546557c76117	f493b75d-cc9f-4cb6-8edf-877fcb5e4031	2025-03-22 02:16:27.394387+00
\.


--
-- Data for Name: hackathons; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.hackathons (id, name, description, start_date, end_date, created_at) FROM stdin;
e451e127-234c-4bd9-b34b-3da84ba4d2ef	Hack 2	some description	2025-03-04 21:00:00+00	2025-02-25 21:00:00+00	2025-03-21 17:46:02.30435+00
adb68a7f-e446-49c2-8692-b1c1c18b9459	Hack 1	Some nice description for the hackathon	2025-03-03 21:00:00+00	2025-03-30 21:00:00+00	2025-03-22 00:29:29.09045+00
26aae630-6c51-4706-a5bf-546557c76117	Another Hackathon	Some description	2025-03-04 21:00:00+00	2025-03-11 21:00:00+00	2025-03-22 02:15:36.441537+00
\.


--
-- Data for Name: judging_criteria; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.judging_criteria (id, hackathon_id, name, description, max_score, created_at) FROM stdin;
c9c78692-c0ee-4110-8be2-c7ac3c8031b2	e451e127-234c-4bd9-b34b-3da84ba4d2ef	Some criteria	Another description	5	2025-03-21 17:56:04.133837+00
33c13bef-436d-44fb-8abd-687b69a122fd	e451e127-234c-4bd9-b34b-3da84ba4d2ef	Another criteria	Some long description	5	2025-03-21 17:56:39.452685+00
7efacd2a-949c-4c15-aa8b-a2e68292afb5	e451e127-234c-4bd9-b34b-3da84ba4d2ef	Some name	Some description	5	2025-03-21 18:28:07.576583+00
e66799be-758a-4923-acf7-7f5163ea5b89	e451e127-234c-4bd9-b34b-3da84ba4d2ef	New criteria	Some description	5	2025-03-21 19:15:24.707663+00
2a2b13b9-b03b-4a78-b88e-23face5dd268	e451e127-234c-4bd9-b34b-3da84ba4d2ef	Giving it the right name and description	Correct description of the criteria	5	2025-03-21 17:56:23.658339+00
d64b90c1-b75e-4b2d-9588-c5d371ce3474	e451e127-234c-4bd9-b34b-3da84ba4d2ef	criteria one	Some description	5	2025-03-21 21:55:42.927801+00
a08704bc-58cf-44ea-879b-237338ef8dfe	adb68a7f-e446-49c2-8692-b1c1c18b9459	Design Score	Is the user experience and design of the project well thought out? Is the product aesthetically pleasing? Is the product easy to use? Does the design of the product elevate its function and original idea?	5	2025-03-22 00:40:41.217319+00
60e70d67-a52f-4e96-bae8-48703aee1d6a	adb68a7f-e446-49c2-8692-b1c1c18b9459	Potential Impact Score 	Is the Project Open Source and how big of an impact could the project have? Does it add some kind of utility for Web3? To what extent does the project potentially solve for the problem addressed?	5	2025-03-22 00:40:55.109061+00
d32e50c2-2e36-40d1-b1f2-d052f3eb82db	adb68a7f-e446-49c2-8692-b1c1c18b9459	Quality of the Idea Score	How creative and unique is the project? Is the project a high quality application? Is the solution efficiently addressing the problem statement?	5	2025-03-22 00:41:05.365569+00
f4705eda-0421-4e7c-ad90-c3adb6db3ed0	adb68a7f-e446-49c2-8692-b1c1c18b9459	Project Sustainability Score 	Is the plan for the Project thought out and realistic? \nImplementation practicality - is the project thought through and does it provide sufficient detail for implementation\n\nContext relevance/adaptability - is project realistic/adaptable to varied contexts?\n\nHow much input is required after the initial investment? does it capitalize on existing resources etc	5	2025-03-22 00:41:15.179878+00
f7781b8d-e9db-4119-bfb8-51c81c4def04	adb68a7f-e446-49c2-8692-b1c1c18b9459	Technological Implementation Score	How well was the idea executed? Does the interaction with blockchain demonstrate quality software development?	5	2025-03-22 00:30:46.194169+00
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.profiles (id, email, role, created_at) FROM stdin;
a3c364db-6d44-41a8-ba83-7949acc8eca2	dalmasogembo@gmail.com	admin	2025-03-21 16:29:05.147565+00
a2c87177-1dab-4a5d-95c8-a82a51d93182	cshamaldas@gmail.com	judge	2025-03-21 17:49:37.365386+00
2b8472f2-a485-424a-b157-0c50297373a5	dante@gmail.com	judge	2025-03-22 00:48:36.196775+00
041909d9-6d77-4101-9c82-8d2fb1bb2019	felix@gmail.com	judge	2025-03-22 02:02:42.124693+00
f493b75d-cc9f-4cb6-8edf-877fcb5e4031	felix1@gmail.com	judge	2025-03-22 02:11:47.359855+00
0c8957cb-9624-435c-a754-b2367c64da43	felix2@gmail.com	admin	2025-03-22 02:12:04.739184+00
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.scores (id, hackathon_id, team_id, judge_id, criteria_id, score, comments, created_at) FROM stdin;
edaac2df-8884-4ec7-b98a-ace472684a3a	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9962937d-b36a-4be7-9e9c-5deba6aaf4b5	a3c364db-6d44-41a8-ba83-7949acc8eca2	c9c78692-c0ee-4110-8be2-c7ac3c8031b2	5	\N	2025-03-21 18:29:36.348539+00
fb41a542-ef91-4d5e-afcd-c6fb46ed492d	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9962937d-b36a-4be7-9e9c-5deba6aaf4b5	a3c364db-6d44-41a8-ba83-7949acc8eca2	33c13bef-436d-44fb-8abd-687b69a122fd	5	\N	2025-03-21 18:29:36.348539+00
4f2207d0-7de1-4ce7-b81a-7f9c638dceac	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9962937d-b36a-4be7-9e9c-5deba6aaf4b5	a3c364db-6d44-41a8-ba83-7949acc8eca2	7efacd2a-949c-4c15-aa8b-a2e68292afb5	5	\N	2025-03-21 18:29:36.348539+00
ab85422e-1cf3-489a-8305-c8deefe4d6e2	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9962937d-b36a-4be7-9e9c-5deba6aaf4b5	a3c364db-6d44-41a8-ba83-7949acc8eca2	e66799be-758a-4923-acf7-7f5163ea5b89	4	\N	2025-03-21 22:17:51.490511+00
72167f1c-e034-45b8-9fe7-736b16ffccc7	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9962937d-b36a-4be7-9e9c-5deba6aaf4b5	a3c364db-6d44-41a8-ba83-7949acc8eca2	2a2b13b9-b03b-4a78-b88e-23face5dd268	5	\N	2025-03-21 18:29:36.348539+00
ab62ad9b-4246-4dad-8d59-f5726f52f839	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9962937d-b36a-4be7-9e9c-5deba6aaf4b5	a3c364db-6d44-41a8-ba83-7949acc8eca2	d64b90c1-b75e-4b2d-9588-c5d371ce3474	5	\N	2025-03-21 22:17:51.490511+00
0ea44a93-e10d-44d2-bd0e-a4b5e69f0cd0	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9417953b-5740-471a-8d2e-bb6f289036eb	a3c364db-6d44-41a8-ba83-7949acc8eca2	c9c78692-c0ee-4110-8be2-c7ac3c8031b2	5	\N	2025-03-21 23:54:08.430115+00
b40efe8d-0312-471f-bf7b-20a816523dc9	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9417953b-5740-471a-8d2e-bb6f289036eb	a3c364db-6d44-41a8-ba83-7949acc8eca2	33c13bef-436d-44fb-8abd-687b69a122fd	5	\N	2025-03-21 23:54:08.430115+00
7d1d74cb-2f77-4740-86c8-865ecc6e0219	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9417953b-5740-471a-8d2e-bb6f289036eb	a3c364db-6d44-41a8-ba83-7949acc8eca2	7efacd2a-949c-4c15-aa8b-a2e68292afb5	5	\N	2025-03-21 23:54:08.430115+00
6d635fa1-f65b-4822-a858-7576d16a222a	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9417953b-5740-471a-8d2e-bb6f289036eb	a3c364db-6d44-41a8-ba83-7949acc8eca2	e66799be-758a-4923-acf7-7f5163ea5b89	5	\N	2025-03-21 23:54:08.430115+00
5cdbf594-e132-445a-ba96-e16056b2bf92	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9417953b-5740-471a-8d2e-bb6f289036eb	a3c364db-6d44-41a8-ba83-7949acc8eca2	2a2b13b9-b03b-4a78-b88e-23face5dd268	5	\N	2025-03-21 23:54:08.430115+00
8356995c-47ad-44cc-82a8-41054007af59	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9417953b-5740-471a-8d2e-bb6f289036eb	a3c364db-6d44-41a8-ba83-7949acc8eca2	d64b90c1-b75e-4b2d-9588-c5d371ce3474	5	\N	2025-03-21 23:54:08.430115+00
71927b7f-d3fb-4d39-8fae-288c435cb0f3	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a2c87177-1dab-4a5d-95c8-a82a51d93182	c9c78692-c0ee-4110-8be2-c7ac3c8031b2	3	\N	2025-03-22 00:06:26.321737+00
2ffa7c39-3fac-47c4-a1c5-7d453279fdfb	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a2c87177-1dab-4a5d-95c8-a82a51d93182	33c13bef-436d-44fb-8abd-687b69a122fd	5	\N	2025-03-22 00:06:26.321737+00
a2ca39ab-bc6e-417b-825d-0551f86d261e	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a2c87177-1dab-4a5d-95c8-a82a51d93182	7efacd2a-949c-4c15-aa8b-a2e68292afb5	1	\N	2025-03-22 00:06:26.321737+00
9eb41ecf-44e7-48e1-bb09-33ca46ef2c1f	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a2c87177-1dab-4a5d-95c8-a82a51d93182	e66799be-758a-4923-acf7-7f5163ea5b89	2	\N	2025-03-22 00:06:26.321737+00
c0d92b60-4b4b-4bba-b8ff-9722191c7dd0	e451e127-234c-4bd9-b34b-3da84ba4d2ef	c8ab35a2-fd1d-4755-bc5f-82e1e59af0ba	a3c364db-6d44-41a8-ba83-7949acc8eca2	c9c78692-c0ee-4110-8be2-c7ac3c8031b2	3	some random test comment	2025-03-21 22:21:48.101083+00
d560f195-90a4-49f3-ac73-83c911e76ab2	e451e127-234c-4bd9-b34b-3da84ba4d2ef	c8ab35a2-fd1d-4755-bc5f-82e1e59af0ba	a3c364db-6d44-41a8-ba83-7949acc8eca2	33c13bef-436d-44fb-8abd-687b69a122fd	3	some random test comment	2025-03-21 22:21:48.101083+00
8f8f261d-6409-4383-a7a2-6362c15f25f0	e451e127-234c-4bd9-b34b-3da84ba4d2ef	c8ab35a2-fd1d-4755-bc5f-82e1e59af0ba	a3c364db-6d44-41a8-ba83-7949acc8eca2	7efacd2a-949c-4c15-aa8b-a2e68292afb5	2	some random test comment	2025-03-21 22:21:48.101083+00
3a977f1b-4b96-4a60-ae67-7beda466ddaf	e451e127-234c-4bd9-b34b-3da84ba4d2ef	c8ab35a2-fd1d-4755-bc5f-82e1e59af0ba	a3c364db-6d44-41a8-ba83-7949acc8eca2	e66799be-758a-4923-acf7-7f5163ea5b89	5	some random test comment	2025-03-21 22:21:48.101083+00
942bd8f5-2671-4eda-8bb4-cfa16253ccd2	e451e127-234c-4bd9-b34b-3da84ba4d2ef	c8ab35a2-fd1d-4755-bc5f-82e1e59af0ba	a3c364db-6d44-41a8-ba83-7949acc8eca2	2a2b13b9-b03b-4a78-b88e-23face5dd268	3	some random test comment	2025-03-21 22:21:48.101083+00
313bb7ff-2e7e-41a7-bfbb-8164f88bfdcb	e451e127-234c-4bd9-b34b-3da84ba4d2ef	c8ab35a2-fd1d-4755-bc5f-82e1e59af0ba	a3c364db-6d44-41a8-ba83-7949acc8eca2	d64b90c1-b75e-4b2d-9588-c5d371ce3474	2	some random test comment	2025-03-21 22:21:48.101083+00
15a838e0-d219-4661-95cd-4853ae5a9aec	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a2c87177-1dab-4a5d-95c8-a82a51d93182	2a2b13b9-b03b-4a78-b88e-23face5dd268	5	\N	2025-03-22 00:06:26.321737+00
bd99bd65-1905-4169-88fa-88280e3834fa	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a2c87177-1dab-4a5d-95c8-a82a51d93182	d64b90c1-b75e-4b2d-9588-c5d371ce3474	4	\N	2025-03-22 00:06:26.321737+00
99cb1f74-81ea-4723-8415-e1e95edd2677	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	a2c87177-1dab-4a5d-95c8-a82a51d93182	a08704bc-58cf-44ea-879b-237338ef8dfe	5	\N	2025-03-22 01:23:13.916865+00
8c4a099f-4264-44db-9a0f-b092cbc97056	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	a2c87177-1dab-4a5d-95c8-a82a51d93182	60e70d67-a52f-4e96-bae8-48703aee1d6a	4	\N	2025-03-22 01:23:13.916865+00
3560e057-f57d-459a-a16a-c84cc2249f72	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	a2c87177-1dab-4a5d-95c8-a82a51d93182	d32e50c2-2e36-40d1-b1f2-d052f3eb82db	3	\N	2025-03-22 01:23:13.916865+00
c65c2435-a7d5-42b4-9c96-f24c481c9570	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	a2c87177-1dab-4a5d-95c8-a82a51d93182	f4705eda-0421-4e7c-ad90-c3adb6db3ed0	4	\N	2025-03-22 01:23:13.916865+00
c816284b-4979-4269-99af-f0160b932b94	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a3c364db-6d44-41a8-ba83-7949acc8eca2	c9c78692-c0ee-4110-8be2-c7ac3c8031b2	4	\N	2025-03-21 22:17:27.524528+00
d95852e5-ff45-4ecd-80d3-e1f2c15794a4	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a3c364db-6d44-41a8-ba83-7949acc8eca2	33c13bef-436d-44fb-8abd-687b69a122fd	4	\N	2025-03-21 22:17:27.524528+00
0fb5c2ef-056a-4223-a6b1-d97e7d42f8e2	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a3c364db-6d44-41a8-ba83-7949acc8eca2	7efacd2a-949c-4c15-aa8b-a2e68292afb5	2	\N	2025-03-21 22:17:27.524528+00
b02ae71c-499e-46e0-b58e-8ac518360410	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a3c364db-6d44-41a8-ba83-7949acc8eca2	e66799be-758a-4923-acf7-7f5163ea5b89	5	\N	2025-03-21 22:17:27.524528+00
8345d2b2-728c-4121-96f1-88963a2cec57	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a3c364db-6d44-41a8-ba83-7949acc8eca2	2a2b13b9-b03b-4a78-b88e-23face5dd268	4	\N	2025-03-21 22:17:27.524528+00
97ea1386-e2cc-4443-830b-6217209f8405	e451e127-234c-4bd9-b34b-3da84ba4d2ef	9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	a3c364db-6d44-41a8-ba83-7949acc8eca2	d64b90c1-b75e-4b2d-9588-c5d371ce3474	4	\N	2025-03-21 22:17:27.524528+00
8d3d5eb7-cd63-41cd-9da6-0816b4e8310c	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	a2c87177-1dab-4a5d-95c8-a82a51d93182	f7781b8d-e9db-4119-bfb8-51c81c4def04	3	\N	2025-03-22 01:23:13.916865+00
af972f57-1a0a-43d2-af7a-dc417caebe25	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	2b8472f2-a485-424a-b157-0c50297373a5	a08704bc-58cf-44ea-879b-237338ef8dfe	4	\N	2025-03-22 01:23:40.541572+00
1b8a3545-29ee-4bde-aa3b-2ec347c36fd5	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	2b8472f2-a485-424a-b157-0c50297373a5	60e70d67-a52f-4e96-bae8-48703aee1d6a	3	\N	2025-03-22 01:23:40.541572+00
1e19d4e0-a412-47fd-bdd7-1306924cbd7d	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	2b8472f2-a485-424a-b157-0c50297373a5	d32e50c2-2e36-40d1-b1f2-d052f3eb82db	5	\N	2025-03-22 01:23:40.541572+00
eb459828-d19e-4696-becc-6ed7baf44547	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	2b8472f2-a485-424a-b157-0c50297373a5	f4705eda-0421-4e7c-ad90-c3adb6db3ed0	5	\N	2025-03-22 01:23:40.541572+00
96b3ef2a-5429-493d-a4e1-5d789bbe855a	adb68a7f-e446-49c2-8692-b1c1c18b9459	1efae932-3330-4f6f-b64f-a0863ac94f15	2b8472f2-a485-424a-b157-0c50297373a5	f7781b8d-e9db-4119-bfb8-51c81c4def04	4	\N	2025-03-22 01:23:40.541572+00
7e626065-26ff-405f-a3db-965440d5aca7	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	a2c87177-1dab-4a5d-95c8-a82a51d93182	a08704bc-58cf-44ea-879b-237338ef8dfe	5	\N	2025-03-22 01:24:18.55915+00
643108f6-3946-436b-8cb4-96fb415ac41e	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	a2c87177-1dab-4a5d-95c8-a82a51d93182	60e70d67-a52f-4e96-bae8-48703aee1d6a	5	\N	2025-03-22 01:24:18.55915+00
2a3155ed-964f-40ce-aac0-e55b57625e1c	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	a2c87177-1dab-4a5d-95c8-a82a51d93182	d32e50c2-2e36-40d1-b1f2-d052f3eb82db	5	\N	2025-03-22 01:24:18.55915+00
f6c27977-1acd-4b86-86e4-6eeacca9ec47	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	a2c87177-1dab-4a5d-95c8-a82a51d93182	f4705eda-0421-4e7c-ad90-c3adb6db3ed0	5	\N	2025-03-22 01:24:18.55915+00
4993a4a5-9698-495a-86bf-dc4626105e7b	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	a2c87177-1dab-4a5d-95c8-a82a51d93182	f7781b8d-e9db-4119-bfb8-51c81c4def04	5	\N	2025-03-22 01:24:18.55915+00
ab01569d-0805-4414-9b4b-f290d9f79cf5	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	2b8472f2-a485-424a-b157-0c50297373a5	a08704bc-58cf-44ea-879b-237338ef8dfe	4	\N	2025-03-22 01:24:34.778909+00
e99d7ff2-92fe-4d3e-ad6d-90de77d0c983	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	2b8472f2-a485-424a-b157-0c50297373a5	60e70d67-a52f-4e96-bae8-48703aee1d6a	3	\N	2025-03-22 01:24:34.778909+00
362bd536-cde3-4d34-b932-c1476a3d3a21	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	2b8472f2-a485-424a-b157-0c50297373a5	d32e50c2-2e36-40d1-b1f2-d052f3eb82db	3	\N	2025-03-22 01:24:34.778909+00
0212de0b-c86a-472d-88d5-3fecda12a2f4	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	2b8472f2-a485-424a-b157-0c50297373a5	f4705eda-0421-4e7c-ad90-c3adb6db3ed0	5	\N	2025-03-22 01:24:34.778909+00
1f23796e-681c-4c4f-8d85-a40835325237	adb68a7f-e446-49c2-8692-b1c1c18b9459	1ea9abe7-01c3-4458-8083-816efc03cc09	2b8472f2-a485-424a-b157-0c50297373a5	f7781b8d-e9db-4119-bfb8-51c81c4def04	2	\N	2025-03-22 01:24:34.778909+00
2a086bc5-4477-4b15-a7b0-2b2b7de72488	adb68a7f-e446-49c2-8692-b1c1c18b9459	d212fcf8-5238-4d12-a3bb-ab22bcbab295	a2c87177-1dab-4a5d-95c8-a82a51d93182	a08704bc-58cf-44ea-879b-237338ef8dfe	1	\N	2025-03-22 01:31:24.677546+00
1d6c528c-7cf4-4e5c-a0c6-466f7596dae5	adb68a7f-e446-49c2-8692-b1c1c18b9459	d212fcf8-5238-4d12-a3bb-ab22bcbab295	a2c87177-1dab-4a5d-95c8-a82a51d93182	60e70d67-a52f-4e96-bae8-48703aee1d6a	2	\N	2025-03-22 01:31:24.677546+00
8cd0850e-b2e3-47c5-99a3-efaa587c50e9	adb68a7f-e446-49c2-8692-b1c1c18b9459	d212fcf8-5238-4d12-a3bb-ab22bcbab295	a2c87177-1dab-4a5d-95c8-a82a51d93182	d32e50c2-2e36-40d1-b1f2-d052f3eb82db	5	\N	2025-03-22 01:31:24.677546+00
c71c6f3b-c8fc-405b-aea5-2215f37b19db	adb68a7f-e446-49c2-8692-b1c1c18b9459	d212fcf8-5238-4d12-a3bb-ab22bcbab295	a2c87177-1dab-4a5d-95c8-a82a51d93182	f4705eda-0421-4e7c-ad90-c3adb6db3ed0	5	\N	2025-03-22 01:31:24.677546+00
ffab469a-547c-4792-b578-805bf18a3a98	adb68a7f-e446-49c2-8692-b1c1c18b9459	d212fcf8-5238-4d12-a3bb-ab22bcbab295	a2c87177-1dab-4a5d-95c8-a82a51d93182	f7781b8d-e9db-4119-bfb8-51c81c4def04	5	\N	2025-03-22 01:31:24.677546+00
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: supabase_admin
--

COPY public.teams (id, hackathon_id, name, project_name, members, created_at) FROM stdin;
9e39a7e8-37f8-4d54-bd40-44fd4c4cf8e9	e451e127-234c-4bd9-b34b-3da84ba4d2ef	Team three	Some project name	{dama," fadas"," fasfads",fadfakfda," adsf"}	2025-03-21 19:03:23.780387+00
9962937d-b36a-4be7-9e9c-5deba6aaf4b5	e451e127-234c-4bd9-b34b-3da84ba4d2ef	Another team	Some project name	{"Dalmas ogembo"," Gloria"," Frank"," Mumbi"," Dan"," member 6"}	2025-03-21 18:26:46.546151+00
c8ab35a2-fd1d-4755-bc5f-82e1e59af0ba	e451e127-234c-4bd9-b34b-3da84ba4d2ef	Add team	team project	{some," emdsf"}	2025-03-21 19:08:02.375214+00
9417953b-5740-471a-8d2e-bb6f289036eb	e451e127-234c-4bd9-b34b-3da84ba4d2ef	team 4	Project 4	{Dante," etc"}	2025-03-21 23:16:26.940123+00
1efae932-3330-4f6f-b64f-a0863ac94f15	adb68a7f-e446-49c2-8692-b1c1c18b9459	Vehicle Shield Insurance	Vehicle Shield Insurance	{one}	2025-03-22 00:49:26.67613+00
1ea9abe7-01c3-4458-8083-816efc03cc09	adb68a7f-e446-49c2-8692-b1c1c18b9459	FVKRY PRVNTA	FVKRY PRVNTA	{one}	2025-03-22 00:49:40.403762+00
d212fcf8-5238-4d12-a3bb-ab22bcbab295	adb68a7f-e446-49c2-8692-b1c1c18b9459	Ace	Ace	{Ace}	2025-03-22 00:49:48.378738+00
8657bc5c-1b11-4c13-a3d7-2dea87f506f3	adb68a7f-e446-49c2-8692-b1c1c18b9459	LocaMula	LocaMula	{LocaMula}	2025-03-22 00:49:56.529216+00
7168ca78-1e5c-4922-88d0-0f2901d37991	adb68a7f-e446-49c2-8692-b1c1c18b9459	ImaraHub	ImaraHub	{ImaraHub}	2025-03-22 00:50:05.129461+00
2d177ec2-6af3-42f9-9d6a-046c6948559c	adb68a7f-e446-49c2-8692-b1c1c18b9459	Cre-Own	Cre-Own	{Cre-Own}	2025-03-22 00:50:13.393689+00
f7903f36-6864-47d6-9eaf-6a02a2b12050	adb68a7f-e446-49c2-8692-b1c1c18b9459	ElimuChain	ElimuChain	{ElimuChain}	2025-03-22 00:50:20.275+00
f85573a8-7ba0-464b-83cb-27dcfb557ba0	adb68a7f-e446-49c2-8692-b1c1c18b9459	TrustCertify	TrustCertify	{TrustCertify}	2025-03-22 00:50:31.057878+00
5c711233-1d11-40dc-8338-d51854d02718	adb68a7f-e446-49c2-8692-b1c1c18b9459	P2P Money Market	P2P Money Market	{"P2P Money Market"}	2025-03-22 00:50:39.857003+00
2ec829da-3f69-40c1-9fae-a82cce1c71fc	adb68a7f-e446-49c2-8692-b1c1c18b9459	Predix	Predix	{Predix}	2025-03-22 00:50:52.255723+00
ff05bc1b-df6f-490e-993e-8dfebe31a8a3	adb68a7f-e446-49c2-8692-b1c1c18b9459	Gluco Trackr	Gluco Trackr	{"Gluco Trackr"}	2025-03-22 00:50:59.687877+00
21e3b7f4-ef77-411e-9a26-aa94a395db80	adb68a7f-e446-49c2-8692-b1c1c18b9459	MilkNet	MilkNet	{MilkNet}	2025-03-22 00:51:10.689675+00
2742ed13-90d9-4db7-8dd2-7cd4c68cf744	adb68a7f-e446-49c2-8692-b1c1c18b9459	Delivery Management System	Delivery Management System	{"Delivery Management System"}	2025-03-22 00:51:18.504963+00
693ccdca-e20a-49c5-980f-89ffab00879e	adb68a7f-e446-49c2-8692-b1c1c18b9459	Token Estate Hub	Token Estate Hub	{"Token Estate Hub"}	2025-03-22 00:51:26.952652+00
5a11a23c-e185-48b8-ad51-a5f2bffeeba8	adb68a7f-e446-49c2-8692-b1c1c18b9459	Shabz	Shabz	{Shabz}	2025-03-22 00:51:34.068203+00
0ded6c41-bf89-4e0e-bded-2161c9f968fc	adb68a7f-e446-49c2-8692-b1c1c18b9459	HeritageChain	HeritageChain	{HeritageChain}	2025-03-22 00:51:41.917812+00
32264b52-1a71-49d4-ace3-6a31b57f62b1	adb68a7f-e446-49c2-8692-b1c1c18b9459	Block Creative	Block Creative	{"Block Creative"}	2025-03-22 00:51:49.785323+00
a027eddc-0250-4dd2-93b6-c2cb62b86d10	adb68a7f-e446-49c2-8692-b1c1c18b9459	PropChain	PropChain	{PropChain}	2025-03-22 00:51:57.633439+00
5a65b0f8-4638-4a20-9a97-9652699b949c	adb68a7f-e446-49c2-8692-b1c1c18b9459	DVS	DVS	{DVS}	2025-03-22 00:52:04.798247+00
e2842c86-b371-42f3-ac58-6678ea1f40de	adb68a7f-e446-49c2-8692-b1c1c18b9459	SunCoin	SunCoin	{SunCoin}	2025-03-22 00:52:12.866012+00
d2896825-b2be-4671-8e0d-147c4436712c	adb68a7f-e446-49c2-8692-b1c1c18b9459	PhysioChain	PhysioChain	{PhysioChain}	2025-03-22 00:52:20.530292+00
6a9010bc-bece-479c-8d6b-5ee76650f813	adb68a7f-e446-49c2-8692-b1c1c18b9459	semaAI	semaAI	{semaAI}	2025-03-22 00:52:28.917019+00
e8b046e5-d42c-4cdf-80a6-7cc9f3f05284	adb68a7f-e446-49c2-8692-b1c1c18b9459	Pool Lens	Pool Lens	{"Pool Lens"}	2025-03-22 00:52:36.045438+00
e605f1ff-822b-48a8-a87e-76c8e2335bff	adb68a7f-e446-49c2-8692-b1c1c18b9459	Fantasia	Fantasia	{Fantasia}	2025-03-22 00:52:43.434814+00
47a7086f-e2f7-434d-a707-384790d32dba	adb68a7f-e446-49c2-8692-b1c1c18b9459	Afya	Afya	{Afya}	2025-03-22 00:52:49.677259+00
5dd3087b-b97a-4c97-b11b-762f891f1c10	adb68a7f-e446-49c2-8692-b1c1c18b9459	IoT Device Tracking	IoT Device Tracking	{"IoT Device Tracking"}	2025-03-22 00:52:57.210461+00
a9752cf4-c98e-4e8a-869c-43b27d6f2dee	adb68a7f-e446-49c2-8692-b1c1c18b9459	KuzaDevs	KuzaDevs	{KuzaDevs}	2025-03-22 00:53:05.243918+00
42abc0cf-1ba6-4ffd-85af-fea012a00cf4	adb68a7f-e446-49c2-8692-b1c1c18b9459	Insights-Edge	Insights-Edge	{Insights-Edge}	2025-03-22 00:53:11.909422+00
4facee19-4b5d-4ec1-ad90-493b973f8849	adb68a7f-e446-49c2-8692-b1c1c18b9459	Kotech	Kotech	{Kotech}	2025-03-22 00:53:19.126235+00
fed7cc80-417e-427b-931f-038b3df187da	adb68a7f-e446-49c2-8692-b1c1c18b9459	Neo	Neo	{Neo}	2025-03-22 00:53:25.90684+00
\.


--
-- Data for Name: messages_2025_03_20; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_03_20 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_03_21; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_03_21 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_03_22; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_03_22 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_03_23; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_03_23 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_03_24; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_03_24 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: messages_2025_03_25; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_03_25 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-03-21 15:33:49
20211116045059	2025-03-21 15:33:49
20211116050929	2025-03-21 15:33:49
20211116051442	2025-03-21 15:33:49
20211116212300	2025-03-21 15:33:49
20211116213355	2025-03-21 15:33:49
20211116213934	2025-03-21 15:33:49
20211116214523	2025-03-21 15:33:49
20211122062447	2025-03-21 15:33:49
20211124070109	2025-03-21 15:33:49
20211202204204	2025-03-21 15:33:49
20211202204605	2025-03-21 15:33:49
20211210212804	2025-03-21 15:33:49
20211228014915	2025-03-21 15:33:49
20220107221237	2025-03-21 15:33:49
20220228202821	2025-03-21 15:33:49
20220312004840	2025-03-21 15:33:49
20220603231003	2025-03-21 15:33:49
20220603232444	2025-03-21 15:33:49
20220615214548	2025-03-21 15:33:49
20220712093339	2025-03-21 15:33:49
20220908172859	2025-03-21 15:33:49
20220916233421	2025-03-21 15:33:49
20230119133233	2025-03-21 15:33:49
20230128025114	2025-03-21 15:33:49
20230128025212	2025-03-21 15:33:49
20230227211149	2025-03-21 15:33:49
20230228184745	2025-03-21 15:33:49
20230308225145	2025-03-21 15:33:49
20230328144023	2025-03-21 15:33:49
20231018144023	2025-03-21 15:33:49
20231204144023	2025-03-21 15:33:49
20231204144024	2025-03-21 15:33:49
20231204144025	2025-03-21 15:33:49
20240108234812	2025-03-21 15:33:49
20240109165339	2025-03-21 15:33:49
20240227174441	2025-03-21 15:33:49
20240311171622	2025-03-21 15:33:49
20240321100241	2025-03-21 15:33:49
20240401105812	2025-03-21 15:33:49
20240418121054	2025-03-21 15:33:49
20240523004032	2025-03-21 15:33:49
20240618124746	2025-03-21 15:33:49
20240801235015	2025-03-21 15:33:49
20240805133720	2025-03-21 15:33:49
20240827160934	2025-03-21 15:33:49
20240919163303	2025-03-21 15:33:49
20240919163305	2025-03-21 15:33:49
20241019105805	2025-03-21 15:33:49
20241030150047	2025-03-21 15:33:49
20241108114728	2025-03-21 15:33:49
20241121104152	2025-03-21 15:33:49
20241130184212	2025-03-21 15:33:49
20241220035512	2025-03-21 15:33:49
20241220123912	2025-03-21 15:33:49
20241224161212	2025-03-21 15:33:49
20250107150512	2025-03-21 15:33:49
20250110162412	2025-03-21 15:33:49
20250123174212	2025-03-21 15:33:49
20250128220012	2025-03-21 15:33:49
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
597	662e4ede-06c8-11f0-ac34-dae9c4d2a7d5	public.hackathon_judges	{"(hackathon_id,eq,26aae630-6c51-4706-a5bf-546557c76117)"}	{"aal": "aal1", "amr": [{"method": "password", "timestamp": 1742601935}], "aud": "authenticated", "exp": 1742612585, "iat": 1742608985, "sub": "a2c87177-1dab-4a5d-95c8-a82a51d93182", "role": "authenticated", "email": "cshamaldas@gmail.com", "phone": "", "session_id": "70b07300-aa49-4216-9ab6-fc8432770c20", "app_metadata": {"provider": "email", "providers": ["email"]}, "is_anonymous": false, "user_metadata": {"sub": "a2c87177-1dab-4a5d-95c8-a82a51d93182", "email": "cshamaldas@gmail.com", "confirm": false, "email_verified": true, "phone_verified": false}}	2025-03-22 02:50:22.603234
599	865db078-06c8-11f0-9ca4-dae9c4d2a7d5	public.hackathon_judges	{"(hackathon_id,eq,adb68a7f-e446-49c2-8692-b1c1c18b9459)"}	{"aal": "aal1", "amr": [{"method": "password", "timestamp": 1742608532}], "aud": "authenticated", "exp": 1742612132, "iat": 1742608532, "sub": "a3c364db-6d44-41a8-ba83-7949acc8eca2", "role": "authenticated", "email": "dalmasogembo@gmail.com", "phone": "", "session_id": "68b63c1a-f05b-40c0-92c5-5461a26425f6", "app_metadata": {"provider": "email", "providers": ["email"]}, "is_anonymous": false, "user_metadata": {"sub": "a3c364db-6d44-41a8-ba83-7949acc8eca2", "email": "dalmasogembo@gmail.com", "email_verified": true, "phone_verified": false}}	2025-03-22 02:51:16.600416
598	865d68b6-06c8-11f0-bb38-dae9c4d2a7d5	public.scores	{"(hackathon_id,eq,adb68a7f-e446-49c2-8692-b1c1c18b9459)"}	{"aal": "aal1", "amr": [{"method": "password", "timestamp": 1742608532}], "aud": "authenticated", "exp": 1742612132, "iat": 1742608532, "sub": "a3c364db-6d44-41a8-ba83-7949acc8eca2", "role": "authenticated", "email": "dalmasogembo@gmail.com", "phone": "", "session_id": "68b63c1a-f05b-40c0-92c5-5461a26425f6", "app_metadata": {"provider": "email", "providers": ["email"]}, "is_anonymous": false, "user_metadata": {"sub": "a3c364db-6d44-41a8-ba83-7949acc8eca2", "email": "dalmasogembo@gmail.com", "email_verified": true, "phone_verified": false}}	2025-03-22 02:51:16.598738
596	662dc0f4-06c8-11f0-975c-dae9c4d2a7d5	public.scores	{"(hackathon_id,eq,26aae630-6c51-4706-a5bf-546557c76117)"}	{"aal": "aal1", "amr": [{"method": "password", "timestamp": 1742601935}], "aud": "authenticated", "exp": 1742612585, "iat": 1742608985, "sub": "a2c87177-1dab-4a5d-95c8-a82a51d93182", "role": "authenticated", "email": "cshamaldas@gmail.com", "phone": "", "session_id": "70b07300-aa49-4216-9ab6-fc8432770c20", "app_metadata": {"provider": "email", "providers": ["email"]}, "is_anonymous": false, "user_metadata": {"sub": "a2c87177-1dab-4a5d-95c8-a82a51d93182", "email": "cshamaldas@gmail.com", "confirm": false, "email_verified": true, "phone_verified": false}}	2025-03-22 02:50:22.600148
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-03-21 15:33:41.504347
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-03-21 15:33:41.506779
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-03-21 15:33:41.507811
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-03-21 15:33:41.51443
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-03-21 15:33:41.524775
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-03-21 15:33:41.52652
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-03-21 15:33:41.528894
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-03-21 15:33:41.531116
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-03-21 15:33:41.532345
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-03-21 15:33:41.533681
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-03-21 15:33:41.535481
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-03-21 15:33:41.537856
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-03-21 15:33:41.53993
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-03-21 15:33:41.541896
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-03-21 15:33:41.543408
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-03-21 15:33:41.555777
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-03-21 15:33:41.557546
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-03-21 15:33:41.558609
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-03-21 15:33:41.560286
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-03-21 15:33:41.563061
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-03-21 15:33:41.564795
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-03-21 15:33:41.568356
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-03-21 15:33:41.58028
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-03-21 15:33:41.588184
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-03-21 15:33:41.590315
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-03-21 15:33:41.591831
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-03-21 15:33:41.593381
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-03-21 15:33:41.603603
28	object-bucket-name-sorting	8f385d71c72f7b9f6388e22f6e393e3b78bf8617	2025-03-21 15:33:41.607808
29	create-prefixes	8416491709bbd2b9f849405d5a9584b4f78509fb	2025-03-21 15:33:41.609965
30	update-object-levels	f5899485e3c9d05891d177787d10c8cb47bae08a	2025-03-21 15:33:41.611786
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-03-21 15:33:41.61491
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-03-21 15:33:41.618369
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-03-21 15:33:41.621596
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-03-21 15:33:41.622139
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-03-21 15:33:41.624659
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--

COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
initial	2025-03-21 15:33:28.627479+00
20210809183423_update_grants	2025-03-21 15:33:28.627479+00
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 80, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 599, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1, false);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: hackathon_judges hackathon_judges_hackathon_id_judge_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.hackathon_judges
    ADD CONSTRAINT hackathon_judges_hackathon_id_judge_id_key UNIQUE (hackathon_id, judge_id);


--
-- Name: hackathon_judges hackathon_judges_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.hackathon_judges
    ADD CONSTRAINT hackathon_judges_pkey PRIMARY KEY (id);


--
-- Name: hackathons hackathons_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.hackathons
    ADD CONSTRAINT hackathons_pkey PRIMARY KEY (id);


--
-- Name: judging_criteria judging_criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.judging_criteria
    ADD CONSTRAINT judging_criteria_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_email_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_email_key UNIQUE (email);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: scores scores_hackathon_id_team_id_judge_id_criteria_id_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_hackathon_id_team_id_judge_id_criteria_id_key UNIQUE (hackathon_id, team_id, judge_id, criteria_id);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_03_20 messages_2025_03_20_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_03_20
    ADD CONSTRAINT messages_2025_03_20_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_03_21 messages_2025_03_21_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_03_21
    ADD CONSTRAINT messages_2025_03_21_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_03_22 messages_2025_03_22_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_03_22
    ADD CONSTRAINT messages_2025_03_22_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_03_23 messages_2025_03_23_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_03_23
    ADD CONSTRAINT messages_2025_03_23_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_03_24 messages_2025_03_24_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_03_24
    ADD CONSTRAINT messages_2025_03_24_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_03_25 messages_2025_03_25_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_03_25
    ADD CONSTRAINT messages_2025_03_25_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: extensions_tenant_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE INDEX extensions_tenant_external_id_index ON _realtime.extensions USING btree (tenant_external_id);


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_unique ON storage.objects USING btree (name COLLATE "C", bucket_id);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: messages_2025_03_20_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_03_20_pkey;


--
-- Name: messages_2025_03_21_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_03_21_pkey;


--
-- Name: messages_2025_03_22_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_03_22_pkey;


--
-- Name: messages_2025_03_23_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_03_23_pkey;


--
-- Name: messages_2025_03_24_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_03_24_pkey;


--
-- Name: messages_2025_03_25_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_03_25_pkey;


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN ((new.name <> old.name)) EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: hackathon_judges hackathon_judges_hackathon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.hackathon_judges
    ADD CONSTRAINT hackathon_judges_hackathon_id_fkey FOREIGN KEY (hackathon_id) REFERENCES public.hackathons(id) ON DELETE CASCADE;


--
-- Name: hackathon_judges hackathon_judges_judge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.hackathon_judges
    ADD CONSTRAINT hackathon_judges_judge_id_fkey FOREIGN KEY (judge_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: judging_criteria judging_criteria_hackathon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.judging_criteria
    ADD CONSTRAINT judging_criteria_hackathon_id_fkey FOREIGN KEY (hackathon_id) REFERENCES public.hackathons(id) ON DELETE CASCADE;


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: scores scores_criteria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_criteria_id_fkey FOREIGN KEY (criteria_id) REFERENCES public.judging_criteria(id) ON DELETE CASCADE;


--
-- Name: scores scores_hackathon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_hackathon_id_fkey FOREIGN KEY (hackathon_id) REFERENCES public.hackathons(id) ON DELETE CASCADE;


--
-- Name: scores scores_judge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_judge_id_fkey FOREIGN KEY (judge_id) REFERENCES public.profiles(id) ON DELETE CASCADE;


--
-- Name: scores scores_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE CASCADE;


--
-- Name: teams teams_hackathon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_hackathon_id_fkey FOREIGN KEY (hackathon_id) REFERENCES public.hackathons(id) ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: hackathon_judges Admins can manage hackathon_judges; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Admins can manage hackathon_judges" ON public.hackathon_judges USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: profiles Allow public profile creation during signup; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Allow public profile creation during signup" ON public.profiles FOR INSERT WITH CHECK (true);


--
-- Name: judging_criteria Criteria are viewable by everyone; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Criteria are viewable by everyone" ON public.judging_criteria FOR SELECT USING (true);


--
-- Name: hackathons Hackathons are viewable by everyone; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Hackathons are viewable by everyone" ON public.hackathons FOR SELECT USING (true);


--
-- Name: scores Judges can insert their own scores; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Judges can insert their own scores" ON public.scores FOR INSERT WITH CHECK ((auth.uid() = judge_id));


--
-- Name: scores Judges can update their own scores; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Judges can update their own scores" ON public.scores FOR UPDATE USING ((auth.uid() = judge_id));


--
-- Name: hackathon_judges Judges can view their own hackathon assignments; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Judges can view their own hackathon assignments" ON public.hackathon_judges FOR SELECT USING ((judge_id = auth.uid()));


--
-- Name: judging_criteria Only admins can delete criteria; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can delete criteria" ON public.judging_criteria FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: hackathons Only admins can delete hackathons; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can delete hackathons" ON public.hackathons FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: scores Only admins can delete scores; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can delete scores" ON public.scores FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: teams Only admins can delete teams; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can delete teams" ON public.teams FOR DELETE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: judging_criteria Only admins can insert criteria; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can insert criteria" ON public.judging_criteria FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: hackathons Only admins can insert hackathons; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can insert hackathons" ON public.hackathons FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: teams Only admins can insert teams; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can insert teams" ON public.teams FOR INSERT WITH CHECK ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: judging_criteria Only admins can update criteria; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can update criteria" ON public.judging_criteria FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: hackathons Only admins can update hackathons; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can update hackathons" ON public.hackathons FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: teams Only admins can update teams; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Only admins can update teams" ON public.teams FOR UPDATE USING ((EXISTS ( SELECT 1
   FROM public.profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));


--
-- Name: profiles Public profiles are viewable by everyone; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Public profiles are viewable by everyone" ON public.profiles FOR SELECT USING (true);


--
-- Name: scores Scores are viewable by everyone; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Scores are viewable by everyone" ON public.scores FOR SELECT USING (true);


--
-- Name: teams Teams are viewable by everyone; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Teams are viewable by everyone" ON public.teams FOR SELECT USING (true);


--
-- Name: profiles Users can update their own profile; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Users can update their own profile" ON public.profiles FOR UPDATE USING ((auth.uid() = id));


--
-- Name: profiles Users can view their own profile; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Users can view their own profile" ON public.profiles FOR SELECT TO authenticated USING ((auth.uid() = id));


--
-- Name: hackathon_judges; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.hackathon_judges ENABLE ROW LEVEL SECURITY;

--
-- Name: hackathons; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.hackathons ENABLE ROW LEVEL SECURITY;

--
-- Name: judging_criteria; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.judging_criteria ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: scores; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.scores ENABLE ROW LEVEL SECURITY;

--
-- Name: teams; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.teams ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- Name: supabase_realtime hackathon_judges; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.hackathon_judges;


--
-- Name: supabase_realtime hackathons; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.hackathons;


--
-- Name: supabase_realtime judging_criteria; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.judging_criteria;


--
-- Name: supabase_realtime profiles; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.profiles;


--
-- Name: supabase_realtime scores; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.scores;


--
-- Name: supabase_realtime teams; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.teams;


--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO postgres;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE hackathon_judges; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.hackathon_judges TO postgres;
GRANT ALL ON TABLE public.hackathon_judges TO anon;
GRANT ALL ON TABLE public.hackathon_judges TO authenticated;
GRANT ALL ON TABLE public.hackathon_judges TO service_role;


--
-- Name: TABLE hackathons; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.hackathons TO postgres;
GRANT ALL ON TABLE public.hackathons TO anon;
GRANT ALL ON TABLE public.hackathons TO authenticated;
GRANT ALL ON TABLE public.hackathons TO service_role;


--
-- Name: TABLE judging_criteria; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.judging_criteria TO postgres;
GRANT ALL ON TABLE public.judging_criteria TO anon;
GRANT ALL ON TABLE public.judging_criteria TO authenticated;
GRANT ALL ON TABLE public.judging_criteria TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.profiles TO postgres;
GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE scores; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.scores TO postgres;
GRANT ALL ON TABLE public.scores TO anon;
GRANT ALL ON TABLE public.scores TO authenticated;
GRANT ALL ON TABLE public.scores TO service_role;


--
-- Name: TABLE teams; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.teams TO postgres;
GRANT ALL ON TABLE public.teams TO anon;
GRANT ALL ON TABLE public.teams TO authenticated;
GRANT ALL ON TABLE public.teams TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2025_03_20; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_03_20 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_03_20 TO dashboard_user;


--
-- Name: TABLE messages_2025_03_21; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_03_21 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_03_21 TO dashboard_user;


--
-- Name: TABLE messages_2025_03_22; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_03_22 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_03_22 TO dashboard_user;


--
-- Name: TABLE messages_2025_03_23; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_03_23 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_03_23 TO dashboard_user;


--
-- Name: TABLE messages_2025_03_24; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_03_24 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_03_24 TO dashboard_user;


--
-- Name: TABLE messages_2025_03_25; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_03_25 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_03_25 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

