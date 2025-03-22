# Hackathon Scoring System

A modern web application for managing hackathon judging and scoring, built with React, Vite, Mantine UI, and Supabase.

## Features

- User authentication with role-based access (Admin/Judge)
- Hackathon management
- Team registration
- Customizable judging criteria
- Real-time scoring system
- Leaderboard with live updates
- Admin dashboard for user and hackathon management

## Tech Stack

- React + TypeScript
- Vite
- Mantine UI 7.6.1
- Supabase (Authentication & Database)
- React Router DOM

## Prerequisites

- Node.js (v18 or higher)
- Yarn package manager
- Supabase account and project

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   yarn
   ```
3. Copy `.env.example` to `.env` and update with your Supabase credentials:
   ```
   VITE_SUPABASE_URL=your_supabase_url
   VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```
4. Run the development server:
   ```bash
   yarn dev
   ```

## Database Setup

The application requires several tables in Supabase:
- profiles (user profiles with roles)
- hackathons (hackathon details)
- teams (participating teams)
- judging_criteria (scoring criteria)
- scores (judge submissions)

Run the migration script in `supabase/migrations/20250321_initial_schema.sql` to set up the database schema.

## Usage

### Admin Users
- Create and manage hackathons
- Add/remove judges
- Set up judging criteria
- View overall results

### Judges
- View assigned hackathons
- Score teams based on criteria
- View personal scoring history
- Access real-time leaderboard

## Development

To start the development server:

```bash
yarn dev
```

To build for production:

```bash
yarn build
```

