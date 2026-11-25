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

object indicadorObjetivo {
    method position() = game.at(0, 7)
    method image() = partida.nivelActual().objetivo().imagenDeProgreso()
}

object indicadorNivel {
    method position() = game.at(0, 8)
    method image() = partida.nivelActual().imagenIndicadorNivel()
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
    method continuar()

    method mostrar() {
        game.clear()
        game.addVisual(self)
        
        keyboard.enter().onPressDo({ self.continuar() })
        atajoVolverAlMenu.habilitar()
    }
}

object pantallaNivelSuperado inherits PantallaDeResultado {
    override method image() = partida.nivelActual().imagenGanar()

    override method continuar() {
        partida.continuarTrasGanar()
    }
}

object pantallaNivelPerdido inherits PantallaDeResultado {
    override method image() = partida.nivelActual().imagenPerder()

    override method continuar() {
        partida.reintentarNivel()
    }
}