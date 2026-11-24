import barraEmocional.*

class ObjetivoLlenarBarra {
    method reiniciar() {}

    method recolectado(recolectable) {}

    method seCumplio() = barraEmocional.estaEnMaximo()

    method tieneIndicador() = false
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

    method tieneIndicador() = true

    method imagenDeProgreso() = "hud_copas_" + copas.toString() + ".png"
}
