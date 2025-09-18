object pepita {
	
	var energia = 100
	
	method energia() {
		return energia
	}
	
	method vola(metros){
		energia = energia - metros
	}
	
	method comer(cantGramos){
		energia = energia + (cantGramos *2)
	}
}
