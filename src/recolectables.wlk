import wollok.game.*
import barraEmocional.*
import partida.*

class Recolectable {
    var position = game.origin()
    const property image
    const impacto

    method position() = position
    method position(nuevaPosicion) { position = nuevaPosicion }
    
    method iniciarCaida(velocidad) {
        game.onTick(velocidad, self.nombreDeCaida(), { self.caer() })
    }

    method nombreDeCaida() = "caer_" + self.identity().toString()

    method caer() {
        position = position.down(1)
        if (position.y() < 0) {
            self.alCaerAlPiso()
            self.desaparecerSeguro()
        }
    }

    method esAtrapadoPor(personaje) {
        self.reproducirSonido()
        self.aplicarEfecto()
        self.desaparecerSeguro()
        partida.recolectado(self)
    }

    method desaparecerSeguro() {
        if (game.hasVisual(self)) {
            game.removeVisual(self)
            game.removeTickEvent(self.nombreDeCaida())
        }
    }

    method reproducirSonido() {
        game.sound(self.sonido()).play()
    }

    method sonido()

    method aplicarEfecto() {
        barraEmocional.modificarPorcentaje(impacto)
    }

    method esCopaDelMundo() = false

    method alCaerAlPiso() {}
}

class RecolectableMalo inherits Recolectable {
    override method sonido() = "sonidoMalo.mp3"
}

class RecolectableBueno inherits Recolectable {
    override method sonido() = "sonidoBueno.mp3"

    method penalidadPorCaer() = -0.01

    override method alCaerAlPiso() {
        barraEmocional.modificarPorcentaje(self.penalidadPorCaer())
    }
}

class RecolectableCopaDelMundo inherits RecolectableBueno {
    override method esCopaDelMundo() = true
}

const sancorSeguros = { => new RecolectableMalo(impacto = -1.0, image = "sancorSeguros.png") }
const tarjetaRoja = { => new RecolectableMalo(impacto = -0.05, image = "tarjetaRoja.png") }
const finalPerdida = { => new RecolectableMalo(impacto = -0.25, image = "finalPerdida.png") }
const gol = { => new RecolectableBueno(impacto = 0.05, image = "gol.png") }
const critica = { => new RecolectableMalo(impacto = -0.1, image = "critica.png") }
const copaMundial = { => new RecolectableCopaDelMundo(impacto = 0.25, image = "copaMundial.png") }
const copaAmerica = { => new RecolectableBueno(impacto = 0.1, image = "copaAmerica.png") }
const camisetaDiez = { => new RecolectableBueno(impacto = 0.07, image = "camisetaDiez.png") }