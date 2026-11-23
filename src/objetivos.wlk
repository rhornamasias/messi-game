import barraEmocional.*

class ObjetivoLlenarBarra {
    method reiniciar() {}

    method recolectado(recolectable) {}

    method seCumplio() = barraEmocional.estaEnMaximo()

    method textoDeProgreso() = ""
}

class ObjetivoJuntarCopas {
    const cantidad
    var copas = 0

    method reiniciar() {
        copas = 0
    }

    method recolectado(recolectable) {
        if (recolectable.esCopaDelMundo()) {
            copas += 1
        }
    }

    method seCumplio() = copas >= cantidad

    method textoDeProgreso() = "Copas: " + copas.toString() + "/" + cantidad.toString()
}
