# Messi Game

![Pantalla de inicio de Messi Game](assets/pantallaMenu_normal.png)

Juego de tipo arcade en pixel art hecho con **Wollok Game**. Controlás a Messi y atrapás objetos que caen para subir (o bajar) su **barra emocional**. Si llega al 100% ganás; si llega a 0% perdés.

🎮 **Jugar online:** [https://rhornamasias.github.io/messi-game/]

## Participantes

- Rodrigo Horna
- Ivan Ignacio Schneider
- Ramiro Segovia
- Jeremias Boutet 

**Institución:** Universidad Tecnológica Nacional, Facultad Regional Buenos Aires (UTN FRBA). Materia: Paradigmas de Programación.

## Cómo se juega

Messi se mueve de izquierda a derecha en la parte baja de la pantalla, mientras desde arriba caen objetos. Cada uno que atrapás modifica la barra emocional:

| Tipo | Ejemplos | Efecto |
|------|----------|--------|
| Buenos | Gol, Copa América, Camiseta 10, Copa del Mundo | Suben la barra |
| Malos | Tarjeta roja, Crítica, Final perdida, Sancor Seguros | Bajan la barra |

La barra empieza en 50% y su valor cambia el estado emocional de Messi, que a su vez cambia el modo de juego:

- **Gloria** (barra alta): Messi se mueve más rápido y los objetos caen más lento.
- **Estable** (barra media).
- **Crisis** (barra baja): Messi se mueve más lento, los objetos caen más rápido y predominan los objetos malos.

Hay dos dificultades (Normal y Difícil), que modifican los umbrales, las velocidades y los objetos que caen.

### Controles

| Tecla | Acción |
|-------|--------|
| ← / → | Mover a Messi |
| 1 / 2 | Elegir dificultad (en el menú) |
| Enter | Iniciar el juego |
| M | Volver al menú |

## Cómo ejecutarlo localmente

1. Instalá [Wollok](https://www.wollok.org/) (extensión de VS Code o Wollok IDE).
2. Clonás este repositorio: `git clone https://github.com/rhornamasias/messi-game.git`
3. Abrí la carpeta y ejecutá `code.wpgm`.
4. Para correr los tests: `tests/juego.wtest`.

## Diseño

El código aplica los conceptos del paradigma de objetos:

- **Polimorfismo:** Messi atrapa cualquier recolectable sin saber cuál es; cada uno define su efecto y su sonido. Las dificultades también responden a los mismos mensajes (`crisis`, `estable`, `gloria`).
- **Delegación:** la barra emocional decide el estado de Messi, y el estado define la velocidad de caída, el cooldown y qué objetos aparecen.
- **Encapsulamiento:** cada objeto protege su estado y expone solo mensajes del dominio. La barra emocional guarda su porcentaje internamente y solo se modifica con `modificarPorcentaje` (y `reiniciar`), que lo mantiene entre 0% y 100% y actualiza el estado de Messi. Messi controla su propia posición: solo se mueve con `moverseALaIzquierda` y `moverseALaDerecha`, que respetan los bordes del tablero y el cooldown. 

## Licencia

El código se distribuye bajo licencia MIT (ver [LICENSE](LICENSE)). Las imágenes, la música y los sonidos pueden tener derechos de terceros.