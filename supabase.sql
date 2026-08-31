-- BAV PHÚ YÊN - BẬT REALTIME CHO KHO DỮ LIỆU CHUNG
-- Chạy sau supabase.sql nếu Realtime chưa phát thay đổi tới các thiết bị.

grant select, insert, update on public.bav_app_state to anon, authenticated;
alter table public.bav_app_state replica identity full;

do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'bav_app_state'
  ) then
    execute 'alter publication supabase_realtime add table public.bav_app_state';
  end if;
end $$;
