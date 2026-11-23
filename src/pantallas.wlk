import wollok.game.*
import partida.*
import niveles.*
import musica.*

object atajoVolverAlMenu {
    method habilitar() {
        keyboard.m().onPressDo({ self.volver() })
    }

    method volver() {
        game.clear()
        reproductorMusical.reiniciar()
        pantallaMenu.mostrar()
    }
}

object indicadorVolverAlMenu {
    method position() = game.at(8, 1)
    method text() = "Presioná M para volver al menú"
}

object indicadorAccion {
    var property text = ""
    method position() = game.at(8, 2)
}

object indicadorObjetivo {
    method position() = game.at(0, 7)
    method text() = partida.nivelActual().objetivo().textoDeProgreso()
}

object indicadorNivel {
    method position() = game.at(0, 8)
    method text() = "Nivel " + partida.nivelActual().numero().toString()
}

object pantallaMenu {
    method position() = game.at(0, 0)
    method image() = "pantallaMenu.png"

    method mostrar() {
        game.addVisual(self)
        keyboard.enter().onPressDo({ partida.empezar() })
        keyboard.num1().onPressDo({ partida.empezarEn(nivel1) })
        keyboard.num2().onPressDo({ partida.empezarEn(nivel2) })
        keyboard.num3().onPressDo({ partida.empezarEn(nivel3) })
        keyboard.num4().onPressDo({ partida.empezarEn(nivel4) })
        keyboard.num5().onPressDo({ partida.empezarEn(nivel5) })
        keyboard.i().onPressDo({ pantallaInstrucciones.mostrar() })
    }
}
object pantallaInstrucciones {
    method position() = game.at(0, 0)
    method image() = "pantallaInstrucciones.png"

    method mostrar() {
        game.clear()
        game.addVisual(self)

        keyboard.m().onPressDo({ self.volverAlMenu() })
    }

    method volverAlMenu() {
        game.clear()
        pantallaMenu.mostrar()
    }
}

object pantallaPresentacion{
    method position() = game.at(0, 0)
    method image() = partida.nivelActual().imagenPresentacion()

    method mostrar() {
        game.clear()
        game.addVisual(self)

        keyboard.enter().onPressDo({ partida.iniciarNivel() })
        atajoVolverAlMenu.habilitar()
    }
}

class PantallaDeResultado {
    method position() = game.at(0, 0)

    method image()
    method textoDeAccion()
    method continuar()

    method mostrarAtajoAlMenu() = true

    method mostrar() {
        game.clear()
        game.addVisual(self)
        
        indicadorAccion.text(self.textoDeAccion())
        game.addVisual(indicadorAccion)
        if (self.mostrarAtajoAlMenu()) {
            game.addVisual(indicadorVolverAlMenu)
        }

        keyboard.enter().onPressDo({ self.continuar() })
        atajoVolverAlMenu.habilitar()
    }
}

object pantallaNivelSuperado inherits PantallaDeResultado {
    override method image() = partida.nivelActual().imagenGanar()

    override method textoDeAccion() {
        return if (partida.esUltimoNivel()) "¡Completaste el juego! Enter para volver al menú" else "¡Nivel superado! Presioná Enter para el siguiente nivel"
    }

    override method mostrarAtajoAlMenu() = not partida.esUltimoNivel()

    override method continuar() {
        partida.continuarTrasGanar()
    }
}

object pantallaNivelPerdido inherits PantallaDeResultado {
    override method image() = partida.nivelActual().imagenPerder()

    override method textoDeAccion() = "Presioná Enter para reintentar el nivel"

    override method continuar() {
        partida.reintentarNivel()
    }
}