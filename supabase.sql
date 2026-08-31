-- BAV PHÚ YÊN - DATABASE ĐỒNG BỘ NHIỀU THIẾT BỊ
-- Chạy toàn bộ file này trong Supabase SQL Editor.

create table if not exists public.bav_app_state (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.bav_app_state enable row level security;

-- Bản HTML dùng anon key và hiện tại chưa chuyển hệ thống đăng nhập sang
-- Supabase Auth. Vì vậy policy dưới đây cho phép website đọc/ghi kho dữ liệu.
-- Nếu triển khai chính thức, nên chuyển sang Supabase Auth + RLS theo vai trò.
drop policy if exists "bav_app_state_select" on public.bav_app_state;
drop policy if exists "bav_app_state_insert" on public.bav_app_state;
drop policy if exists "bav_app_state_update" on public.bav_app_state;

create policy "bav_app_state_select"
on public.bav_app_state for select
to anon, authenticated
using (true);

create policy "bav_app_state_insert"
on public.bav_app_state for insert
to anon, authenticated
with check (true);

create policy "bav_app_state_update"
on public.bav_app_state for update
to anon, authenticated
using (true)
with check (true);

-- Cho phép Realtime phát sự kiện INSERT/UPDATE tới các thiết bị đang mở website.
alter table public.bav_app_state replica identity full;

-- Supabase thường đã có publication này. Nếu chưa có, bỏ comment dòng dưới và chạy.
-- alter publication supabase_realtime add table public.bav_app_state;
