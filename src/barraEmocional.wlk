import wollok.game.*
import messi.*
import partida.*

object barraEmocional {
    const porcentajeInicial = 0.5
    const umbralGloria = 0.65
    const umbralCrisis = 0.35
    const pasoDeAnimacion = 0.02
    const position = game.at(5, 7)
    var porcentaje = porcentajeInicial
    var porcentajeMostrado = porcentajeInicial

    method position() = position

    method porcentaje() = porcentaje

    method porcentajeMostrado() = porcentajeMostrado

    method reiniciar() { 
        porcentaje = porcentajeInicial
        porcentajeMostrado = porcentajeInicial
    }


    method animar(){
        if(porcentajeMostrado < porcentaje) {
            porcentajeMostrado = porcentaje.min(porcentajeMostrado + pasoDeAnimacion)
        } else if (porcentajeMostrado > porcentaje) {
            porcentajeMostrado = porcentaje.max(porcentajeMostrado - pasoDeAnimacion)
        }
    }

    method modificarPorcentaje(cantidad) {
        porcentaje = 0.max(1.min(porcentaje + cantidad))
        self.chequearEstado()
    }

    method estaEnMaximo() = porcentaje >= 1.0
    method estaEnMinimo() = porcentaje <= 0.0
    method estaEnGloria() = porcentaje >= umbralGloria
    method estaEnCrisis() = porcentaje <= umbralCrisis

    method image() = "barraEmocional.png"

    method chequearEstado() {
        const nivel = partida.nivelActual()
        if (self.estaEnMinimo()) { partida.perder() }
        else if (self.estaEnGloria()) { messi.cambiarEstado(nivel.gloria()) }
        else if (self.estaEnCrisis()) { messi.cambiarEstado(nivel.crisis()) }
        else { messi.cambiarEstado(nivel.estable()) }
    }
}

object indicadorBarra {
    const pasos = 20
 
    method position() = game.at(4, 8)

    method image() = "indicador_" + (barraEmocional.porcentajeMostrado() * pasos).round().toString() + ".png"
}