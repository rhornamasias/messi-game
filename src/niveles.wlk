import estados.*
import recolectables.*
import objetivos.*

class Nivel {
    const property numero
    const property imagenMessi
    const property musica
    const property imagenPresentacion
    const property imagenIndicadorNivel
    const property imagenGanar
    const property imagenPerder
    const property objetivo

    method crisis()
    method estable()
    method gloria()
}

object nivel1 inherits Nivel(
    numero = 1,
    imagenMessi = "messi_nivel1.png",
    musica = "musica_nivel1.mp3",
    imagenPresentacion = "presentacion_nivel1.png",
    imagenIndicadorNivel = "hud_nivel1.png",
    imagenGanar = "pantallaVictoria_nivel1.png",
    imagenPerder = "pantallaDerrota_nivel1.png",
    objetivo = new ObjetivoLlenarBarra()
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 300, 
        velocidadCaida = 300, 
        itemsPosibles = [ gol1, asistencia, tarjetaRoja, lesion, lesion, critica, copaAmericaPerdida, copaAmericaPerdida ]
    )

    override method estable() = new EstadoEmocional(
        tiempoCooldown = 125, 
        velocidadCaida = 500, 
        itemsPosibles = [ gol1, gol1, asistencia, camisetaDiecinueve, tarjetaRoja, lesion, critica, copaAmericaPerdida ]
    )

    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 55,
        velocidadCaida = 800,
        itemsPosibles = [ medallaJuegosOlimpicos, gol1, gol1, asistencia, camisetaDiecinueve, tarjetaRoja, lesion, critica ]
    )
}

object nivel2 inherits Nivel(
    numero = 2,
    imagenMessi = "messi_nivel2.png",
    musica = "musica_nivel2.mp3",
    imagenPresentacion = "presentacion_nivel2.png",
    imagenIndicadorNivel = "hud_nivel2.png",
    imagenGanar = "pantallaVictoria_nivel2.png", 
    imagenPerder = "pantallaDerrota_nivel2.png",
    objetivo = new ObjetivoLlenarBarra()
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 335,
        velocidadCaida = 260,
        itemsPosibles = [ gol2, maradonaDt, critica, critica, lesion, tarjetaRoja, copaMundialPerdida, lesion ] 
    )
    
    override method estable() = new EstadoEmocional(
        tiempoCooldown = 145, 
        velocidadCaida = 430, 
        itemsPosibles = [ gol2, capitan, asistencia, camisetaDiez, critica, critica, lesion, copaMundialPerdida, tarjetaRoja ] 
    )
    
    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 70, 
        velocidadCaida = 700, 
        itemsPosibles = [ maradonaDt, gol2, capitan, camisetaDiez, asistencia, critica, critica, lesion, copaMundialPerdida ] 
    )
}

object nivel3 inherits Nivel(
    numero = 3,
    imagenMessi = "messi_nivel3.png",
    musica = "musica_nivel3.mp3",
    imagenPresentacion = "presentacion_nivel3.png",
    imagenIndicadorNivel = "hud_nivel3.png",
    imagenGanar = "pantallaVictoria_nivel3.png",
    imagenPerder = "pantallaDerrota_nivel3.png",
    objetivo = new ObjetivoLlenarBarra()
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 365,
        velocidadCaida = 200,
        itemsPosibles = [ gol3, asistencia, critica, critica, copaMundialPerdida, copaMundialPerdida]
    )

    override method estable() = new EstadoEmocional(
        tiempoCooldown = 175,
        velocidadCaida = 370,
        itemsPosibles = [ gol3, gol3, asistencia, capitan, camisetaDiez, critica, critica, copaMundialPerdida, copaMundialPerdida, lesion ]
    )

    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 90,
        velocidadCaida = 600,
        itemsPosibles = [ fuleco, gol3, gol3, asistencia, capitan, camisetaDiez, critica, critica, lesion, copaMundialPerdida ]
    )
}
object nivel4 inherits Nivel(
    numero = 4,
    imagenMessi = "messi_nivel4.png",
    musica = "musica_nivel4.mp3",
    imagenPresentacion = "presentacion_nivel4.png",
    imagenIndicadorNivel = "hud_nivel4.png",
    imagenGanar = "pantallaVictoria_nivel4.png",
    imagenPerder = "pantallaDerrota_nivel4.png",
    objetivo = new ObjetivoLlenarBarra()
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 405,
        velocidadCaida = 150,
        itemsPosibles = [ gol4, scaloni, sampaoli, sampaoli, copaAmericaPerdida, copaAmericaCentenarioPerdida, critica, tarjetaRoja, lesion, lesion, copaAmericaCentenarioPerdida ]
    )

    override method estable() = new EstadoEmocional(
        tiempoCooldown = 205,
        velocidadCaida = 310,
        itemsPosibles = [ gol4, scaloni, camisetaDiez, sampaoli, copaAmericaPerdida,copaAmericaCentenarioPerdida, critica, lesion, sampaoli, tarjetaRoja, tarjetaRoja ]
    )

    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 105,
        velocidadCaida = 500,
        itemsPosibles = [ scaloni, gol4, gol4, camisetaDiez, capitan, copaAmericaPerdida, copaAmericaCentenarioPerdida, sampaoli, critica, copaAmericaCentenarioPerdida ]
    )
}

object nivel5 inherits Nivel(
    numero = 5,
    imagenMessi = "messi_nivel5.png",
    musica = "musica_nivel5.mp3",
    imagenPresentacion = "presentacion_nivel5.png",
    imagenIndicadorNivel = "hud_nivel5.png",
    imagenGanar = "pantallaVictoria_nivel5.png",
    imagenPerder = "pantallaDerrota_nivel5.png",
    objetivo = new ObjetivoJuntarCopas(cantidad = 3)
) {
    override method crisis() = new EstadoEmocional(
        tiempoCooldown = 455,
        velocidadCaida = 110,
        itemsPosibles = [ gol5, scaloni, asistencia, sancorSeguros, sancorSeguros, critica, critica, chiquiTapia, chiquiTapia, tarjetaRoja, lesion ]
    )

    override method estable() = new EstadoEmocional(
        tiempoCooldown = 245,
        velocidadCaida = 240,
        itemsPosibles = [ gol5, scaloni, finalissima, tarjetaRoja, critica, chiquiTapia, lesion, lesion, tarjetaRoja, sancorSeguros ]
    )

    override method gloria() = new EstadoEmocional(
        tiempoCooldown = 135,
        velocidadCaida = 350,
        itemsPosibles = [ copaMundial, gol5, gol5, finalissima, copaAmerica, scaloni, critica, chiquiTapia, chiquiTapia, sancorSeguros ]
    )
}