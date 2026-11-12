# ComunicaCole - Vercel + Supabase (Opción 2)
App privada, sin menciones a Meta AI. Link limpio tipo: tu-colegio.vercel.app

## Qué incluye esta versión
- 12 grados con secciones A / B (Básico, Bachillerato, Perito Contador)
- Familias por grado/sección, importar CSV / Excel guardado como CSV, exportar CSV
- Mensaje masivo por grado/sección o individual a una familia
- WhatsApp + Correo (wa.me y mailto)
- Adjuntos: HASTA 5 archivos por mensaje, cada uno max 10 MB, total max 20 MB
  Tipos permitidos: PDF, Word .docx, Excel .xlsx, texto .txt, fotos .jpg/.png
  NO solo PDF. Cada archivo genera un link de descarga para el padre.
- Historial con estado: Enviado / Entregado / Leído / No recibido (manual)
- Ciclo 2026-2027, termina 31 dic 2027, reinicia 1 ene 2028
- Datos del colegio + firma automática en cada mensaje

## PASO A PASO VERCEL + SUPABASE

### 1. Supabase - crear proyecto
1. Entra a supabase.com > New Project. Un proyecto POR COLEGIO.
2. En SQL Editor, pega y ejecuta el archivo supabase.sql que viene en esta carpeta.
   Eso crea las tablas: colegios, grados, familias, mensajes, y el bucket de Storage `adjuntos`.
3. En Settings > API copia: Project URL y anon key.

### 2. Vercel - subir
1. Entra a vercel.com > Add New > Project > sube esta carpeta (o conéctala a GitHub).
2. En Environment Variables agrega:
   SUPABASE_URL = tu Project URL
   SUPABASE_KEY = tu anon key
3. Deploy. Te da tu link: tu-colegio.vercel.app

### 3. Probar que se comparte
1. Abre el link en celular, carga 1 familia de prueba.
2. Abre el mismo link en compu. Debe aparecer la misma familia.
3. Si no aparece, revisa las llaves en Vercel > Settings > Environment Variables > Redeploy.

### 4. Archivos adjuntos - cómo funcionan
- En modo local (sin Supabase): el archivo queda en el navegador y al enviar se indica que hay que adjuntarlo manualmente al abrir WhatsApp/correo.
- Con Supabase conectado: sube el archivo a Storage bucket `adjuntos` (público, solo lectura por link).
  La app genera un link por archivo: https://TU-PROYECTO.supabase.co/storage/v1/object/public/adjuntos/archivo.pdf
  Ese link es el que le llega al padre en el mensaje. El padre toca y descarga.
- Límite recomendado: 5 archivos por mensaje, 10 MB cada uno, 20 MB total.

## Archivos en esta carpeta
- index.html = toda la app en un solo archivo
- supabase.sql = tablas + bucket + políticas
- vercel.json = configuración de Vercel
- README.md = este archivo

## Venderlo
- Creación: Q2,500 una sola vez
- Servicio anual: Q1,500 / año
- Total primer año: Q4,000
- A partir del segundo año: solo Q1,500
