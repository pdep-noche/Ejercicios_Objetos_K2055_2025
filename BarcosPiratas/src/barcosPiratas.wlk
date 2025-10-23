class Barco {
	var property mision
	const property tripulantes = []
	
	method piratasUtilesParaMision() {
		return tripulantes.filter({tri=> mision.esUtil(tri)})
	}	
}

class Mision {
	method esUtil(tripulante) {
		return tripulante.esIntrepido() && self.cumpleCondicion(tripulante)
	}
	
	method cumpleCondicion(tripulante)
}

object convertirEnLeyenda inherits Mision {
	override method cumpleCondicion(tripulante) {
		return tripulante.cantItems() > 10
	}
}

object busquedaTesoro inherits Mision {
	override method cumpleCondicion(tripulante) {
		return tripulante.tiene("brujula") ||  tripulante.tiene("botellaGrogXD")
	}
	
}

class Saqueo  inherits Mision {
	var property objetivo
	var property cantMaxMonedas
	
	override method cumpleCondicion(tripulante) {
		return tripulante.cantMonedas() <= cantMaxMonedas		
	}
	
	
}


class Pirata{
	const property items = []
	var property edad
	var property temenMorir
	var property cantMonedas
	
	method tiene(unItem) = items.contains(unItem)
	
	method esIntrepido() = edad < 40 && !temenMorir
	
	method cantItems() = items.size()
	
	
}	