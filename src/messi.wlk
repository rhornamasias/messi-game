import wollok.game.*
import gestionDeNiveles.*
import estados.*

object messi {
    const posicionInicial = game.at(8, 0)
    var position = posicionInicial
    var estadoEmocional = normal.estable()
    var enCooldown = false

    method position() = position

    method image() = gestionDeNivel.dificultadActual().imagenMessi()

    method estadoEmocional() = estadoEmocional

    method cambiarEstado(nuevoEstado) {
        estadoEmocional = nuevoEstado
    }

    method reiniciar() {
        position = posicionInicial
        estadoEmocional = gestionDeNivel.dificultadActual().estable()
        enCooldown = false
    }

    method moverseALaIzquierda() { self.moverseHacia(-1) }

    method moverseALaDerecha() { self.moverseHacia(1) }

    method moverseHacia(desplazamiento) {
        if (! enCooldown) {
            const nuevaX = 0.max((game.width() - 1).min(position.x() + desplazamiento))
            position = game.at(nuevaX, position.y())
            self.iniciarCooldown()
        }
    }

    method iniciarCooldown() {
        enCooldown = true
        game.schedule(estadoEmocional.tiempoCooldown(), { enCooldown = false })
    }

    method atraparRecolectable(recolectable){
        recolectable.esAtrapadoPor(self)
    }
}