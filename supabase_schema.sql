create table if not exists public.dotin_app_state (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.dotin_app_state enable row level security;

drop policy if exists "dotin_app_state_public_read" on public.dotin_app_state;
create policy "dotin_app_state_public_read"
on public.dotin_app_state
for select
to anon
using (true);

drop policy if exists "dotin_app_state_public_write" on public.dotin_app_state;
create policy "dotin_app_state_public_write"
on public.dotin_app_state
for insert
to anon
with check (true);

drop policy if exists "dotin_app_state_public_update" on public.dotin_app_state;
create policy "dotin_app_state_public_update"
on public.dotin_app_state
for update
to anon
using (true)
with check (true);
