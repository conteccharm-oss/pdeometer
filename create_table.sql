-- Supabase SQL Editor에서 실행하세요
create table health_records (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  date text not null,
  year_month text not null,
  steps integer default 0,
  exercise integer default 0,
  sleep numeric default 0,
  water integer default 0,
  updated_at timestamp default now()
);
