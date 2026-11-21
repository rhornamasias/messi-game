import wollok.game.*
import niveles.*
import partida.*

object messi {
    const posicionInicial = game.at(8, 0)
    var position = posicionInicial
    var estadoEmocional = nivel1.estable()
    var enCooldown = false

    method position() = position

    method image() = partida.nivelActual().imagenMessi()

    method estadoEmocional() = estadoEmocional

    method cambiarEstado(nuevoEstado) {
        estadoEmocional = nuevoEstado
    }

    method reiniciar() {
        position = posicionInicial
        estadoEmocional = partida.nivelActual().estable()
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