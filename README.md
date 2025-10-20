# VetApp

Proyecto iOS de ejemplo para una veterinaria. Flujo implementado:

1. Lista de especies (5 principales)
2. Al seleccionar una especie → lista de 5 razas
3. Al seleccionar una raza → mascotas registradas (lista)
4. Al seleccionar una mascota → detalle con 7 datos

Cómo ejecutar

- Abrir `VetApp/VetApp.xcodeproj` o `VetApp/VetApp.xcworkspace` en Xcode.
- Asegúrate de que la target `VetApp` incluye los archivos de `ListaMascotas` (si los añadiste manualmente desde Finder).
- Ejecuta en un simulador o dispositivo.

Notas

- Datos de ejemplo se encuentran en `ListaMascotas/Resources/lista_data.json`.
- Añade imágenes a `ListaMascotas/Resources/Assets.xcassets` y referencia `imageName` en JSON.
- Si quieres usar SSH para git, configura tu clave pública en GitHub.
