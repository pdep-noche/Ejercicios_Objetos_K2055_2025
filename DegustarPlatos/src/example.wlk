class Plato {
	const property baseCalorias = 100
	var property cocinero
	method cantDeCalorias() = 3 * self.cantidadDeAzucar() +  baseCalorias
	
	method cantidadDeAzucar()	
	
	method estaBienDecorada()
}

class Entrada inherits Plato {
	override method cantidadDeAzucar() = 0
	
	override method estaBienDecorada() = true
}

class Principal inherits Plato {
	var cantidadDeAzucar
	var estaBienDecorada
	override method cantidadDeAzucar() = cantidadDeAzucar
	
	override method estaBienDecorada() = estaBienDecorada
	
	}
	
class Postre inherits Plato {
	var property cantDeColores
	override method cantidadDeAzucar() = 120
	override method estaBienDecorada()  = cantDeColores > 3
	
}

class Cocinero {
	var property especialidad
	
	method calificacionDe(plato) = especialidad.degustar(plato)
	
	method cocinar() = especialidad.cocinar(self)
	
}

class Repostero {
	
	var property dulceDeseado
	method degustar(unPlato) = 10.min(5*unPlato.cantidadDeAzucar()/dulceDeseado)
	method cocinar(unCocinero) = new Postre(cocinero =unCocinero, cantDeColores = dulceDeseado/50 )
}

class Chef {
	var property cantCaloriasDeseadas
	
	method degustar(unPlato) {
		if (self.platoCumpleExpectativas(unPlato)){
			return 10
		}
		return self.calificacionNoCumpleExpectativas(unPlato)
	}
	
	method cocinar(unCocinero) = new Principal(cocinero = unCocinero, cantidadDeAzucar = cantCaloriasDeseadas, estaBienDecorada = true) 
	
	method platoCumpleExpectativas(unPlato) = unPlato.estaBienDecorado() && unPlato.cantDeCalorias() <= cantCaloriasDeseadas
	
	method calificacionNoCumpleExpectativas(_) = 0
}
	
class GardeManger inherits Chef {
	override method calificacionNoCumpleExpectativas(unPlato) =  unPlato.cantDeCalorias()/100.min(6)
	
	override method cocinar(unCocinero) = new Entrada(cocinero = unCocinero)
}
	
	
class Torneo {
	const property catadores = []
	const property platosParticipantes = []
	
	
	method participarEnTorneo(cocinero) {
		platosParticipantes.add(cocinero.cocinar())
	}
	
	method ganador() {
		self.validarHayPlatos()
		return self.platoConMayorCalificacion().cocinero()
	}
	
	method validarHayPlatos() {
		if (platosParticipantes.isEmpty()) {
			throw new DomainException(message = "No hay participantes")
		}
	}
	
	method platoConMayorCalificacion() {
		return platosParticipantes.max({unPlato => self.calificacionTotal(unPlato)})
		
	}
	
	
	method calificacionTotal(unPlato) {
		return catadores.sum({unCatador => unCatador.califacionDe(unPlato)})
	}
}

