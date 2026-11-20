import wollok.game.*
import messi.*
import barraEmocional.*
import gestionDeNiveles.*
import estados.*
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

object indicadorDificultad {
    method position() = game.at(8, 0) 
    method text() = gestionDeNivel.dificultadActual().textoMenu()
}

object pantallaMenu {
    method position() = game.at(0, 0)
    method image() = gestionDeNivel.dificultadActual().imagenMenu()

    method mostrar() {
        game.addVisual(self)
        game.addVisual(indicadorDificultad)
        
        keyboard.num1().onPressDo({
            gestionDeNivel.cambiarDificultad(normal)
        })
        
        keyboard.num2().onPressDo({
            gestionDeNivel.cambiarDificultad(dificil)
        })

        keyboard.enter().onPressDo({ self.iniciarJuego() })
    }

    method iniciarJuego() {
        game.clear()
        game.boardGround("board.png")

        
        barraEmocional.reiniciar()
        messi.reiniciar()

        game.addVisual(messi)
        game.addVisual(barraEmocional)
        game.addVisual(indicadorBarra)

        keyboard.left().onPressDo({ messi.moverseALaIzquierda() })
        keyboard.right().onPressDo({ messi.moverseALaDerecha() })

        game.onCollideDo(messi, { objeto => messi.atraparRecolectable(objeto) })
        gestionDeNivel.iniciarCaidaDeRecolectables()
        atajoVolverAlMenu.habilitar()
    }
}

class PantallaFinal {
    const property image

    method position() = game.at(0, 0)

    method mostrar() {
        game.clear()
        game.addVisual(self)
        game.addVisual(indicadorVolverAlMenu)
        atajoVolverAlMenu.habilitar()
    }
}
const pantallaPerder = new PantallaFinal(image = "pantallaPerder.png")

const pantallaGanar = new PantallaFinal(image = "pantallaGanar.png")