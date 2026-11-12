-- Supabase SQL - ComunicaCole
create table if not exists colegios (id bigint generated always as identity primary key, nombre text, direccion text, telefono text, correo text, logo text, created_at timestamptz default now());
create table if not exists grados (id bigint generated always as identity primary key, colegio_id bigint references colegios(id), nombre text, seccion text check (seccion in ('A','B')), ciclo text default '2026-2027', created_at timestamptz default now());
create table if not exists familias (id bigint generated always as identity primary key, colegio_id bigint references colegios(id), grado text, seccion text, alumno text, padre1 text, correo1 text, telefono1 text, padre2 text, correo2 text, telefono2 text, created_at timestamptz default now());
create table if not exists mensajes (id bigint generated always as identity primary key, colegio_id bigint references colegios(id), fecha timestamptz default now(), asunto text, texto text, grado text, seccion text, canal text, destinatarios int, adjuntos jsonb, estado text default 'Enviado', nota text);
-- Storage bucket para adjuntos: PDF, Word, Excel, txt, fotos
insert into storage.buckets (id, name, public) values ('adjuntos','adjuntos', true) on conflict (id) do nothing;
-- Políticas simples para demo: permitir leer público y subir con anon key. En producción, ajuste con RLS por colegio.
create policy "Lectura publica adjuntos" on storage.objects for select using (bucket_id='adjuntos');
create policy "Subida adjuntos" on storage.objects for insert with check (bucket_id='adjuntos');
create policy "Borrado adjuntos" on storage.objects for delete using (bucket_id='adjuntos');
alter table colegios enable row level security; alter table grados enable row level security; alter table familias enable row level security; alter table mensajes enable row level security;
create policy "Acceso anon colegios" on colegios for all using (true) with check (true);
create policy "Acceso anon grados" on grados for all using (true) with check (true);
create policy "Acceso anon familias" on familias for all using (true) with check (true);
create policy "Acceso anon mensajes" on mensajes for all using (true) with check (true);
