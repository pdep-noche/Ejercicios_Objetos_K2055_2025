/** First Wollok example */
object andy {

	const property librosLeidos = [harryPotter, seniorAnillos, elPrincipito, juegosDelHambre, venasAbierntasAmericaLatina, rayuela]
	
	
}
object harryPotter {
	var property lectores = 10500156
	method valoracion() = lectores / 1000000
}

object seniorAnillos {
	
	var property paginas = 450
	
	method valoracion() = paginas/ 45
}

object elPrincipito {
	method valoracion() = 50 
}

object juegosDelHambre {
	
	var property votosPositos = 1600200 
	var property votosNegativos = 300600
	
	method coeficiente() = votosPositos - votosNegativos
	
	
	method valoracion(){
		if (self.coeficiente()  > 0) {
			return self.coeficiente() / 100000
		}
		return 0
		}
 }
 
 object venasAbierntasAmericaLatina {
	var property anioPublicacion = 1971
	
	method valoracion() = self.cantDeAnios()/3
	
	method cantDeAnios() = 2025 - 1971
}


object rayuela {
	
	const  titulo = "Rayuela"
	method valoracion() = self.cantLetras() * 2
	
	method cantLetras() = titulo.size()
}
