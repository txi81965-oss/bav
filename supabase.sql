create table if not exists public.bav_app_data (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.bav_app_data enable row level security;

-- Cho phép website tĩnh đọc/ghi dữ liệu dùng chung.
-- Lưu ý: phiên bản này dùng cơ chế đăng nhập riêng của ứng dụng, chưa phải Supabase Auth.
drop policy if exists "bav_app_data_select" on public.bav_app_data;
drop policy if exists "bav_app_data_insert" on public.bav_app_data;
drop policy if exists "bav_app_data_update" on public.bav_app_data;

create policy "bav_app_data_select" on public.bav_app_data
for select to anon, authenticated using (true);

create policy "bav_app_data_insert" on public.bav_app_data
for insert to anon, authenticated with check (true);

create policy "bav_app_data_update" on public.bav_app_data
for update to anon, authenticated using (true) with check (true);

-- Bật Realtime cho bảng để các máy đang mở website nhận thay đổi gần như ngay lập tức.
alter publication supabase_realtime add table public.bav_app_data;
