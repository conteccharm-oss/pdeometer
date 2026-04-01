-- =============================================
-- CONTEC 챌린지 - Supabase 테이블 생성 SQL
-- Supabase SQL Editor에서 전체 복사 후 Run
-- =============================================

-- 1. 걸음 수 기록
create table if not exists steps (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  year_month text not null,
  steps integer default 0,
  updated_at timestamp default now(),
  unique(name, year_month)
);

-- 2. 카풀 기록 (관리자 승인 필요)
create table if not exists carpools (
  id uuid default gen_random_uuid() primary key,
  year_month text not null,
  driver text not null,
  passenger text not null,
  origin text,
  destination text,
  image_url text,
  status text default 'pending',  -- pending / approved / rejected
  created_at timestamp default now()
);

-- 3. 식판 인증 (관리자 승인 필요)
create table if not exists meal_certs (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  year_month text not null,
  image_url text,
  status text default 'pending',  -- pending / approved / rejected
  created_at timestamp default now()
);

-- 4. 우주 퀴즈 릴레이
create table if not exists quiz_relay (
  id uuid default gen_random_uuid() primary key,
  year_month text not null,
  question text not null,
  answer text not null,
  hint text,
  created_by text not null,
  created_at timestamp default now(),
  is_active boolean default true
);

-- 5. 퀴즈 참여 기록 (탈락/생존)
create table if not exists quiz_attempts (
  id uuid default gen_random_uuid() primary key,
  year_month text not null,
  name text not null,
  quiz_id uuid references quiz_relay(id),
  is_correct boolean not null,
  eliminated_at timestamp,
  survival_order integer,
  created_at timestamp default now()
);

-- =============================================
-- Storage 버킷 생성 (인증샷 업로드용)
-- =============================================
-- Supabase > Storage > New bucket 에서 직접 생성하세요:
-- 버킷 이름: challenge-images
-- Public: ON
