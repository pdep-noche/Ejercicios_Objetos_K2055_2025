object tom {
	var energia = 20
	var posicion = 30
	
	method puedeAtraparA(unRaton) {
		return self.velocidad() > unRaton.velocidad()
	}
	
	method velocidad() {
		return 5 + (energia/10)
	}
	
	method energia(valor){
		energia = valor
	}
	
	method energia() {
		return energia
	}
	
	method posicion()
	{
		return posicion
	}
	
	method correrA(unRaton) {
		energia -= self.consumoEnergia(unRaton)
		posicion = unRaton.posicion()
	}
	
	method consumoEnergia(unRaton) {
		return 0.5 * self.velocidad() * self.distanciaA(unRaton)
	}
	
	method distanciaA(unRaton) {
		return (posicion - unRaton.posicion()).abs()
	}
}



object jerry {
	
	var peso = 4	
	var posicion = 34
	
	method  velocidad() {
		return 10 - peso
	}
	
	method posicion() {
		return posicion
	}
}

object robotRaton {
	var posicion = 32
	
	method posicion() {
		return posicion
	}
	
	method velocidad() {
		return 8
	}
	
}