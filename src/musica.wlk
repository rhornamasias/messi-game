import wollok.game.*
import partida.*

object silencio {
    method played() = false
    method stop() {}
}

object reproductorMusical {
    var musicaDeFondo = silencio

    method iniciarMusicaFondo() {
        self.reproducirFondo("musicaFondo.mp3")
    }

    method iniciarMusicaDeNivel(nivel) {
        self.reproducirFondo(nivel.musica())
    }

    method iniciarMusicaDePresentacion() {
        self.reproducirFondo("musica_Presentacion.mp3")
    }

    method reproducirFondo(archivo) {
        self.detenerTodo()
        const musica = game.sound(archivo)
        musica.shouldLoop(true)
        musica.volume(0.3)
        musicaDeFondo = musica
        game.schedule(500, { if (musicaDeFondo == musica) { musica.play() } })
    }

    method detenerTodo() {
        self.detener(musicaDeFondo)
    }

    method detener(sonido) {
        if (sonido.played()) { sonido.stop() }
    }

    method reproducirVictoria() {
        if(partida.esUltimoNivel()){
            self.reproducirFondo("musicaVictoria_final.mp3")
        } else {
            self.reproducirFondo("musicaVictoria.mp3")
        }
    }

    method reproducirDerrota() {
        self.reproducirFondo("musicaDerrota.mp3")
    }

    method reiniciar() {
        self.iniciarMusicaFondo()
    }
}