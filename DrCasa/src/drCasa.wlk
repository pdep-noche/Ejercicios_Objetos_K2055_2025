class Persona {
	
	var property temperatura
	var property cantCelulas
	const property enfermedades = []
	
	method contraer(enfermedad) {
		enfermedades.add(enfermedad)
	}
	
	method incrementarTemperatura(cant) {
		temperatura = 45.min(temperatura + cant)
	}
	
	
	method disminuirCelulas(cant) {
		cantCelulas = 0.max(cantCelulas - cant)
	}
	
	method vivirUnDia() {
		enfermedades.forEach({unaEnf => unaEnf.afectarA(self)})
	}
	
	method estaEnComa() = temperatura == 45 || cantCelulas < 1000000
	
	method tieneEnfermedad(unaEnfermedad) = enfermedades.contains(unaEnfermedad)
	
	method cantCelulasAmenazadasEnAgresivas() {
		return self.enfermedadesAgresivas().sum({unaEnf => unaEnf.cantCelulas()})
	}
	
	method enfermedadesAgresivas() = enfermedades.filter({unaEnf => unaEnf.esAgresiva(self)})
	
	method enfermedadQueMasCelulasAfecte() {
		return enfermedades.max({unaEnf => unaEnf.cantCelulas()})
	}
	
	method tomar(dosis) {
		enfermedades.forEach({unaEnf => unaEnf.atenuar(dosis * 15)})
		enfermedades.removeAllSuchThat({unaEnf => unaEnf.estaCurada()})
	}
	
	method diminuirTodaLaTemp() {
		temperatura = 0
	}
}

class Medico inherits Persona {
	var property dosis
	
	method atenderA(unaPersona) {
		unaPersona.tomar(dosis)
	}
	
	override method contraer(unaEnfermedad) {
		super(unaEnfermedad)
		self.atenderA(self)
	}
}

class JefeDepartamento inherits Medico {
	
	const property subordinados = []
	
	override method atenderA(unaPersona) {
		subordinados.anyOne().atenderA(unaPersona)
	}
	
}
class Enfermedad {
	
	var property cantCelulas
	method afectarA(unaPersona)
	method esAgresiva(unaPersona)
	method atenuar(cant) {
		cantCelulas = 0.max(cantCelulas - cant)
	}
	
	method estaCurada() = cantCelulas == 0
}

class Infecciosa inherits Enfermedad {
	
	override method afectarA(unaPersona) {
		unaPersona.incrementarTemperatura(cantCelulas/1000)
	}
	
	method reproducir() {
		cantCelulas *= 2
	}
	
	override method esAgresiva(unaPersona) {
		return cantCelulas > unaPersona.cantCelulas() *0.001
	}
}

class Autoinmune inherits Enfermedad {
	var cantDias = 0
	override method afectarA(unaPersona) {
		cantDias+= 1
		unaPersona.disminuirCelulas(cantCelulas)
	}
	
	override method esAgresiva(unaPersona) = cantDias > 30
}

object hipotermia {
	
	method afectarA(unaPersona){
		unaPersona.diminuirTodaLaTemp()
	}
	
	method atenuar(_){
		
	}
	
	method esAgresiva() = true
	
}