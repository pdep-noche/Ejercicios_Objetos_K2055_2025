
object sara {
	var peso = 55
	var vitalidad = 90 
	var temperatura = 37
	
	method leAfecta(algo) {
		algo.afectarA(self)
	}
	
	method incrementarTemperatura(cant){
		temperatura += cant
	}
	
	method modificarVitalidad(cant) {
		vitalidad += cant
	}
	
	method modificarPeso(cant) {
		peso += cant
	}
	
	method peso() {
		return peso
	}
	
	method vitalidad() {
		return vitalidad
	}
	
	method normalizate() {
		temperatura = 37
	}
	
	
}

object malaria {
	method afectarA(persona) {
		persona.incrementaTemperatura(3)
	}
}

object varicela  {
	method afectarA(persona) {
		persona.modificarVitalidad(-5)
		persona.modificarPeso(-persona.peso() * 0.1)
	}
}

object gripe {
	method afectarA(persona) {
		persona.modificarVitalidad(-persona.vitalidad() *0.2)
	}
}

object paracetamol {
	method afectarA(persona){
		if (persona.temperatura() > 37) {
			persona.normalizate()
		}
	}
}

object polen {
	var cantGramos = 10
	
	method afectarA(persona) {
		persona.modificarVitalidad(cantGramos * 0.1)
	}
}


object nuez {
	method afectarA(persona){
		persona.modificarVitalidad(persona.vitalidad() * 0.3)
	}
}


