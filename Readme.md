Desarrollado por:
Dheimid Solis.
Yeremy Vergara.
Diego Martinez.

# Instrucciones para ejecutar la página web con base de datos

1. Para poder ejecutar esta página, primeramente se debe crear una base de datos en base al archivo SQL que se encuentra dentro de la carpeta `backend` (se puede importar con MySQL Workbench).

2. Una vez creada la base de datos, se debe ejecutar desde la terminal de Visual Studio Code el comando: npm init -y
para poder comunicarnos con el backend.

3. Posteriomente, se deben instalar los archivos necesarios, como Node.JS para poder seguir con los pasos.

4. Se debe abrir la terminal desde la ruta del backend, donde estará nuestro server, y ejecutar el comando: node server.js

5. Esto mostrará un link que, al presionarlo, nos llevará a la página creada.

6. Si quieres acceder a datos específicos, debes acceder al ThunderClient, color el link que se te ha dado, y agregar:
    A) /api/Object (para ver los objetos)
    B) /api/Sprite (para ver las imagenes)
    C) /api/Type (para ver los tipos de objetos)
---

### Requisitos previos

- Tener instalado Node.js
- Tener MySQL y MySQL Workbench
- Tener Visual Studio Code
- Tener Thunder Client instalado (opcional, pero recomendado para probar las rutas)

---

Con eso, la página queda funcionando y conectada a la base de datos.