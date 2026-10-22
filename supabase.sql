-- Run this in Supabase: SQL Editor > New query > Run

create table if not exists public.estimate_requests (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  full_name text not null check (char_length(full_name) <= 200),
  phone text not null check (char_length(phone) <= 40),
  email text check (char_length(email) <= 200),
  zip_code text not null check (char_length(zip_code) <= 10),
  property_type text,
  customer_type text,
  services text[] not null default '{}',
  description text check (char_length(description) <= 4000),
  preferred_start date,
  status text not null default 'new'
);

alter table public.estimate_requests enable row level security;

-- Visitors can only ADD requests. They cannot read, edit or delete anything.
create policy "Anyone can submit an estimate request"
  on public.estimate_requests for insert
  to anon with check (true);

grant insert on public.estimate_requests to anon;
