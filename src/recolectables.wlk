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

    method penalidadPorCaer() = -0.02

    method sonidoAlCaer() = "sonidoBuenoPerdido.mp3"

    override method alCaerAlPiso() {
        game.sound(self.sonidoAlCaer()).play()
        barraEmocional.modificarPorcentaje(self.penalidadPorCaer())
    }
}

class RecolectableCopaDelMundo inherits RecolectableBueno {
    override method esCopaDelMundo() = true
}

const gol1 = { => new RecolectableBueno(impacto = 0.05, image = "gol_nivel1.png") }
const gol2 = { => new RecolectableBueno(impacto = 0.05, image = "gol_nivel2.png") }
const gol3 = { => new RecolectableBueno(impacto = 0.05, image = "gol_nivel3.png") }
const gol4 = { => new RecolectableBueno(impacto = 0.05, image = "gol_nivel4.png") }
const gol5 = { => new RecolectableBueno(impacto = 0.05, image = "gol_nivel5.png") }
const asistencia = { => new RecolectableBueno(impacto = 0.05, image = "asistencia.png") }
const copaAmerica = { => new RecolectableBueno(impacto = 0.1, image = "copaAmerica.png") }
const camisetaDiez = { => new RecolectableBueno(impacto = 0.07, image = "camisetaDiez.png") }
const camisetaDiecinueve = { => new RecolectableBueno(impacto = 0.05, image = "camisetaDiecinueve.png") }
const fuleco = { => new RecolectableBueno(impacto = 0.05, image = "fuleco.png") }
const capitan = { => new RecolectableBueno(impacto = 0.07, image = "capitan.png") }
const medallaJuegosOlimpicos = { => new RecolectableBueno(impacto = 0.08, image = "medalla_jjoo.png") }
const maradonaDt = { => new RecolectableBueno(impacto = 0.1, image = "maradonaDt.png") }
const scaloni = { => new RecolectableBueno(impacto = 0.1, image = "scaloni.png") }
const finalissima = { => new RecolectableBueno(impacto = 0.08, image = "finalissima.png") }
const critica = { => new RecolectableMalo(impacto = -0.1, image = "critica.png") }
const lesion = { => new RecolectableMalo(impacto = -0.1, image = "lesion.png") }
const sampaoli = { => new RecolectableMalo(impacto = -0.1, image = "sampaoli.png") }
const chiquiTapia = { => new RecolectableMalo(impacto = -0.15, image = "chiquiTapia.png") }
const copaAmericaPerdida = { => new RecolectableMalo(impacto = -0.1, image = "copaAmerica_perdida.png") }
const copaAmericaCentenarioPerdida = { => new RecolectableMalo(impacto = -0.15, image = "copaAmericaCentenario_perdida.png") }
const copaMundialPerdida = { => new RecolectableMalo(impacto = -0.18, image = "copaMundial_perdida.png") }
const sancorSeguros = { => new RecolectableMalo(impacto = -1.0, image = "sancorSeguros.png") }
const tarjetaRoja = { => new RecolectableMalo(impacto = -0.05, image = "tarjetaRoja.png") }
const copaMundial = { => new RecolectableCopaDelMundo(impacto = 0.18, image = "copaMundial.png") }