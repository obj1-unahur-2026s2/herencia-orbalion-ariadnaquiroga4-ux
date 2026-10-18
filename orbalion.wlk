class Grupos {
    var nombre
    var energiaBase
    var entrenador
    var tecnologiasComplementarias = []
    method energiaBase() = energiaBase
    method tecnologiasActivas() {
        return tecnologiasComplementarias.map({t => t.activa()})
    }
    method energiaTotal() {
        return energiaBase + self.tecnologiasActivas().sum({t => t.valorEnergetico()})
    }
    method prestigioUniversal() {}
}
class Luminico inherits Grupos {
    var nivelRadiacion = 0
    var cristalesSolares = []
    override method energiaTotal() {
        return if(nivelRadiacion < 5000) {
            super() * 1.10
        }
    }
    override method prestigioUniversal() {
        return cristalesSolares.size() >= 3 and entrenador.eliteGalactica() and self.tecnologiasActivas().size() > 1
    }

}
class Sintetico inherits Grupos {
    var nivelProcesamiento = 0
    var cantModulosActivos = 0
    var estaCertificado = true
    method estaCertificado() = estaCertificado
    override method energiaTotal() {
        return if(cantModulosActivos > 5) {
            super() * 0.80  // *2 /10
        }
    }
    override method prestigioUniversal() {
        return estaCertificado and cantModulosActivos > 3 and tecnologiasComplementarias.all({t => t.activa()})
    }
}
class Eterico inherits Grupos {
    var nivelFluctuacion = 0
    var cantPortalesEnergeticos = 0
    override method prestigioUniversal() {
        return nivelFluctuacion > 75 and cantPortalesEnergeticos >= 2
    }
    override method energiaTotal() {
        return if(self.prestigioUniversal()) {
            super() * 1.15
        } else {
            super()
        }
    }
}
class tecnologiasComplementarias {
    var nombre
    var valorEnergetico
    var activa = true
    method activa() = activa
    method valorEnergetico() = valorEnergetico
}

class Entrenadores {
    var cantCiclosSolares = 0
    var estaEnSintoniaConEquipo = true
    var nivelPrecisionEstrategica
    var rol = EstrategaCuantico
    method rol() {
        return rol == EstrategaCuantico or rol == ArquitectoEnergia or rol == GuiaMental
    }
    method eliteGalactica() {
        return cantCiclosSolares > 10
    }
}
class EstrategaCuantico inherits Entrenadores {
    override method eliteGalactica() {
        return super() and nivelPrecisionEstrategica > 80
    }
}
class ArquitectoEnergia inherits Entrenadores {
    override method eliteGalactica() {
        return super() and estaEnSintoniaConEquipo
    }
}
class GuiaMental inherits Entrenadores {
    
}

class TecnologiasEspeciales {
    var nombre
    var valorEnergetico = 0
    var estaActiva = true
    method estaActiva() = estaActiva
}