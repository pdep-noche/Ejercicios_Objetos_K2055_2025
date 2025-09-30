
object ash {
	
	const pokebola = []
	
	method esGroso() = pokebola.all({unPokemon => unPokemon.nivel() > 100})

 	method pokemonPreferido() = pokebola.max({unPokemon => unPokemon.potenciaAtaqueMasPotente()})
 	
 	method pockemonesPulenta() = pokebola.filter({unPokemon => unPokemon.esPulenta()})
}

object charizard {
	
	var property ataque = lanzallamas
	
	method nivel() = ataque.potencia()
	
	method aprender(unAtaque) {
		ataque = unAtaque
	}
	
	method potenciaAtaqueMasPotente() = self.nivel()
	
	method esPulenta() = false
}

object pikachu {
	
	const property ataques = #{agilidad, trueno, colaDeHierro}
	
	method nivel(){
		return ataques.sum({unAtaque => unAtaque.potencia()})
	}	
	
	method aprender(unAtaque) {
		ataques.add(unAtaque)
	}
	
	method potenciaAtaqueMasPotente() = self.ataqueMasPotente().potencia()
	
	method ataqueMasPotente() = ataques.max({unAtaque => unAtaque.potencia()})
	
	method esPulenta() = ataques.size()  > 2
	
}

object psyduck {
	
	
	method nivel() = 0
	method aprender(_) {
		
	}
	
	method potenciaAtaqueMasPotente() = 0
	
	method esPulenta() = false
	
}

object blastoise {
	
	var property ataquePrincipal = hidrobomba
	var property ataqueReserva = rayoDeHielo
	
	method nivel() = ataquePrincipal.potencia() + ataqueReserva.potencia()

	method aprender(unAtaque) {
		ataqueReserva = ataquePrincipal
		ataquePrincipal = unAtaque
	} 
	
	method potenciaAtaqueMasPotente() = ataquePrincipal.potencia().max(ataqueReserva.potencia())
	
	method esPulenta() = false
}

object hidrobomba {
	var property potencia = 8
}

object rayoDeHielo {
	var property potencia = 1
}

object agilidad {
	var property potencia = 8
}

object trueno {
	var property potencia = 7
}

object colaDeHierro {
	var property potencia = 10
}
object lanzallamas {
	var property potencia = 5 
	
}
