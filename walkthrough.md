# Authentication and Dashboard Walkthrough

## Overview
We have enhanced the authentication flow and dashboard integration:
1.  **Profiles Table**: Added a `profiles` table to store user roles and additional info.
2.  **Dashboard Access**: Protected the `/dashboard` route so only logged-in users can access it.
3.  **Redirects**: Login and Signup now redirect to `/dashboard` instead of home.
4.  **Logout**: Verified the "Sign Out" button in the Navbar works.
5.  **Profile Page**: Added a `/profile` page where users can update their Full Name, Username, and Website.
6.  **UI Connection**: The Dashboard now displays the user's Full Name from the `profiles` table (if set), falling back to the email.

## Database Updates
You need to apply the new schema for the `profiles` table.

### Applying Schema
Run the following SQL in your Supabase SQL Editor:

```sql
-- Create a table for public profiles
create table profiles (
  id uuid references auth.users on delete cascade not null primary key,
  updated_at timestamp with time zone,
  username text unique,
  full_name text,
  avatar_url text,
  website text,
  role text default 'user' check (role in ('user', 'admin', 'moderator'))
);

-- Set up Row Level Security (RLS)
alter table profiles enable row level security;

create policy "Public profiles are viewable by everyone." on profiles
  for select using (true);

create policy "Users can insert their own profile." on profiles
  for insert with check (auth.uid() = id);

create policy "Users can update own profile." on profiles
  for update using (auth.uid() = id);

-- Trigger for new users
create function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, full_name, avatar_url, role)
  values (new.id, new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'avatar_url', 'user');
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();
```

## Testing
1.  **Login**:
    -   Go to `/login`.
    -   Sign in.
    -   Verify you are redirected to `/dashboard`.
2.  **Dashboard**:
    -   Verify you see your email or name (if profile exists).
3.  **Profile**:
    -   Click "Profile" in the Navbar.
    -   Update your Full Name.
    -   Go back to Dashboard and verify the new name is displayed.
4.  **Logout**:
    -   Click "Sign Out" in the top right.
    -   Verify you are redirected to `/login`.
