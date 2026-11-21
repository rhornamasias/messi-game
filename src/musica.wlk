import wollok.game.*

object silencio {
    method played() = false
    method stop() {}
}

object reproductorMusical {
    var musicaDeFondo = silencio
    var musicaFinal = silencio

    method iniciarMusicaFondo() {
        self.reproducirFondo("musicaFondo.mp3")
    }

    method iniciarMusicaDeNivel(nivel) {
        self.reproducirFondo(nivel.musica())
    }

    method reproducirFondo(archivo) {
        self.detenerTodo()
        const musica = game.sound(archivo)
        musica.shouldLoop(true)
        musica.volume(0.3)
        musicaDeFondo = musica
        game.schedule(500, { musica.play() })
    }

    method detenerTodo() {
        self.detener(musicaFinal)
        self.detener(musicaDeFondo)
    }

    method detener(sonido) {
        if (sonido.played()) { sonido.stop() }
    }

    method reproducirVictoria() {
        self.reproducirFinal("musicaVictoria.mp3")
    }

    method reproducirDerrota() {
        self.reproducirFinal("musicaDerrota.mp3")
    }

    method reproducirFinal(archivo) {
        self.detenerTodo()
        musicaFinal = game.sound(archivo)
        musicaFinal.play()
    }

    method reiniciar() {
        self.iniciarMusicaFondo()
    }
}