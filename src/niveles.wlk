import estados.*
import recolectables.*
import objetivos.*

class Nivel {
    const property numero
    const property imagenMessi
    const property musica
    const property imagenPresentacion
    const property imagenGanar
    const property imagenPerder
    const property objetivo

    method crisis()
    method estable()
    method gloria()
}

object nivel1 inherits Nivel(
    numero = 1,
    imagenMessi = "messi.png",
    musica = "musicaFondo.mp3",
    imagenPresentacion = "presentacion_nivel1.png",
    imagenGanar = "pantallaGanar.png",
    imagenPerder = "pantallaPerder.png",
    objetivo = new ObjetivoLlenarBarra()
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 300, 
        velocidadCaida = 300, 
        itemsPosibles = [ gol, finalPerdida, critica ]
    )

    override method estable() = new EstadoEmocional(
        tiempoCooldown = 120, 
        velocidadCaida = 500, 
        itemsPosibles = [ copaAmerica, gol, critica ]
    )

    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 50,
        velocidadCaida = 800,
        itemsPosibles = [ copaMundial, gol, camisetaDiez, critica ]
    )
}

object nivel2 inherits Nivel(
    numero = 2,
    imagenMessi = "messi.png",
    musica = "musicaFondo.mp3",
    imagenPresentacion = "presentacion_nivel2.png",
    imagenGanar = "pantallaGanar.png", 
    imagenPerder = "pantallaPerder.png",
    objetivo = new ObjetivoLlenarBarra()
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 330,
        velocidadCaida = 260,
        itemsPosibles = [ gol, finalPerdida, critica, critica ] 
    )
    
    override method estable() = new EstadoEmocional(
        tiempoCooldown = 140, 
        velocidadCaida = 420, 
        itemsPosibles = [ copaAmerica, gol, critica, tarjetaRoja ] 
    )
    
    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 60, 
        velocidadCaida = 700, 
        itemsPosibles = [ finalPerdida, gol, camisetaDiez, critica, tarjetaRoja ] 
    )
}

object nivel3 inherits Nivel(
    numero = 3,
    imagenMessi = "messi.png",
    musica = "musicaFondo.mp3",
    imagenPresentacion = "presentacion_nivel3.png",
     imagenGanar = "pantallaGanar.png",
    imagenPerder = "pantallaPerder.png",
    objetivo = new ObjetivoLlenarBarra()
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 360,
        velocidadCaida = 200,
        itemsPosibles = [ gol, finalPerdida, critica, tarjetaRoja, finalPerdida ]
    )

    override method estable() = new EstadoEmocional(
        tiempoCooldown = 170,
        velocidadCaida = 360,
        itemsPosibles = [ copaAmerica, gol, critica, tarjetaRoja, finalPerdida ]
    )

    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 80,
        velocidadCaida = 600,
        itemsPosibles = [ copaMundial, gol, camisetaDiez, critica, tarjetaRoja ]
    )
}
object nivel4 inherits Nivel(
    numero = 4,
    imagenMessi = "messi_dificil.png",
    musica = "musicaFondo.mp3",
    imagenPresentacion = "presentacion_nivel4.png",
    imagenGanar = "pantallaGanar.png",
    imagenPerder = "pantallaPerder.png",
    objetivo = new ObjetivoLlenarBarra()
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 400,
        velocidadCaida = 150,
        itemsPosibles = [ sancorSeguros, sancorSeguros, finalPerdida, critica, gol, camisetaDiez ]
    )

    override method estable() = new EstadoEmocional(
        tiempoCooldown = 200,
        velocidadCaida = 300,
        itemsPosibles = [ tarjetaRoja, critica, finalPerdida, gol ]
    )

    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 100,
        velocidadCaida = 500,
        itemsPosibles = [ copaAmerica, gol, tarjetaRoja, critica, finalPerdida ]
    )
}

object nivel5 inherits Nivel(
    numero = 5,
    imagenMessi = "messi_dificil.png",
    musica = "musicaFondo.mp3",
    imagenPresentacion = "presentacion_nivel5.png",
    imagenGanar = "pantallaGanar.png",
    imagenPerder = "pantallaPerder.png",
    objetivo = new ObjetivoJuntarCopas(cantidad = 5)
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 450,
        velocidadCaida = 120,
        itemsPosibles = [ sancorSeguros, sancorSeguros, finalPerdida, critica, gol, camisetaDiez ]
    )

    override method estable() = new EstadoEmocional(
        tiempoCooldown = 230,
        velocidadCaida = 250,
        itemsPosibles = [ tarjetaRoja, critica, finalPerdida, finalPerdida, gol ]
    )

    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 120,
        velocidadCaida = 420,
        itemsPosibles = [ copaMundial, gol, tarjetaRoja, critica, finalPerdida ]
    )
}