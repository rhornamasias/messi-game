import wollok.game.*
import messi.*
import barraEmocional.*
import niveles.*
import pantallas.*
import musica.*

object partida{
    const niveles = [ nivel1, nivel2, nivel3, nivel4, nivel5 ]
    var property nivelActual = nivel1
    
    method niveles() = niveles

    method esUltimoNivel() = nivelActual == niveles.last()

    method empezar() {
        self.empezarEn(niveles.first())        
    }

    method empezarEn(nivel) {
        nivelActual = nivel
        self.presentarNivel()
    }

    method presentarNivel(){
        pantallaPresentacion.mostrar()
    }

    method reintentarNivel() {
        self.iniciarNivel()
    }

    method avanzarDeNivel() {
        nivelActual = niveles.get(nivelActual.numero())
        self.presentarNivel()
    }

    method iniciarNivel() {
        game.clear()
        game.boardGround("board.png")

        barraEmocional.reiniciar()
        messi.reiniciar()
        nivelActual.objetivo().reiniciar()

        game.addVisual(messi)
        game.addVisual(barraEmocional)
        game.addVisual(indicadorBarra)
        game.addVisual(indicadorNivel)
        if(nivelActual.objetivo().tieneIndicador()) {
            game.addVisual(indicadorObjetivo)
        }

        keyboard.left().onPressDo({ messi.moverseALaIzquierda() })
        keyboard.right().onPressDo({ messi.moverseALaDerecha() })

        game.onCollideDo(messi, { objeto => messi.atraparRecolectable(objeto) })
        game.onTick(1500, "generadorObjetos", { self.generarObjeto() })
        atajoVolverAlMenu.habilitar()

        reproductorMusical.iniciarMusicaDeNivel(nivelActual)
    }

    method recolectado(recolectable){
        const objetivo = nivelActual.objetivo()
        objetivo.recolectado(recolectable)
        if (objetivo.seCumplio()) {
            self.ganar()
        }
    }

    method generarObjeto() {
        const generadorDeItem = messi.estadoEmocional().itemsPosibles().anyOne()
        const nuevoItem = generadorDeItem.apply()
        const xAleatoria = (0 .. game.width() - 1).anyOne()

        nuevoItem.position(game.at(xAleatoria, game.height() - 1))
        game.addVisual(nuevoItem)
        nuevoItem.iniciarCaida(messi.estadoEmocional().velocidadCaida())
    }

    method ganar() {
        pantallaNivelSuperado.mostrar()
        reproductorMusical.reproducirVictoria()
    }

    method perder() {
        pantallaNivelPerdido.mostrar()
        reproductorMusical.reproducirDerrota()
    }

    method continuarTrasGanar() {
        if(self.esUltimoNivel()) {
            atajoVolverAlMenu.volver()
        } else {
            self.avanzarDeNivel()
        }
    }
}