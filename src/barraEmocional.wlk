import wollok.game.*
import messi.*
import partida.*

object barraEmocional {
    const porcentajeInicial = 0.5
    const umbralGloria = 0.65
    const umbralCrisis = 0.35
    const ancho = 5
    const position = game.at(5, 7)
    var porcentaje = porcentajeInicial

    method position() = position

    method ancho() = ancho

    method porcentaje() = porcentaje

    method reiniciar() { porcentaje = porcentajeInicial }

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
        else if (self.estaEnMaximo()) { partida.ganar() }
        else if (self.estaEnGloria()) { messi.cambiarEstado(nivel.gloria()) }
        else if (self.estaEnCrisis()) { messi.cambiarEstado(nivel.crisis()) }
        else { messi.cambiarEstado(nivel.estable()) }
    }
}

object indicadorBarra {
    method image() = "indicador.png"
    
    method xActual() = barraEmocional.position().x() + (barraEmocional.porcentaje() * barraEmocional.ancho())
    method position() = game.at(self.xActual().truncate(0), 8)
}