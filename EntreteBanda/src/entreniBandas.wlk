class Entrada {
	
	var property banda
	var property fecha
	var property precioBase = 1000
	var property precioFinal
	
	method precioAlPublico() 
	{
		return precioBase + productora.impuesto()
	}
	
	
	method nombreBanda() = banda.nombre()
}

object productora {
	var property impuesto
	const property asistentes = []
	
	method gananciaTotal() {
		return self.totalRecaudado() - self.presupuestoBandas()
	}
	
	method totalRecaudado() {
		return asistentes.sum({unAsistente => unAsistente.totalGastadoEntradas()})
	}
	
	method presupuestoBandas() {
		return self.bandas().sum({unaBanda => unaBanda.presupuesto()})
	} 
	
	method bandas() {
		const bandasAsistentes = #{}
		asistentes.forEach({unAsistente => 
			bandasAsistentes.addAll(unAsistente.bandas())
		})
		return bandasAsistentes
	}
	
	method cantEtradasVendidas() {
		return asistentes.sum({unAsistente=> unAsistente.cantEntradas()})
	}
	
	method bandaMasPopular(){
		return self.bandas().max({unaBanda => unaBanda.popularidad()})
	}
}

class Asistente {
	var property abono
	const property entradas = []
	var property dinero
	
	method comprar(entrada) {
		self.validarCompra(entrada)
		self.comprarEntrada(entrada)
	} 
	
	
	method validarCompra(entrada) {
	
	if (dinero  < entrada.precioAlPublico()) {
		throw new SaldoNegativo(message = "dinero insuficiente")
	}
	}
	
	method comprarEntrada(entrada) {
		var precioFinal = abono.precioTotal(entrada.precioAlPublico())
		dinero -= precioFinal
		entrada.precioFinal(precioFinal)
		entradas.add(entrada)		
	}
	
	method totalGastadoEntradas() {
		return entradas.sum({unaEntrada => unaEntrada.precioFinal()})
	}	
	
	method nombreBandasVistas() {
		return entradas.map({unaEntrada => unaEntrada.nombreBanda()}).asSet()
	}
	
	method bandas() {
		return entradas.map({unaEntrada => unaEntrada.banda()}).asSet()
	}
	
	method cantEntradas() = entradas.size()
}

object fan {
	method precioTotal(precio) = precio
}

class Vip {
	var property porcentajeDes
	
	method precioTotal(precio) {
		return precio - (precio* porcentajeDes/100)
		
	}
}

class SaldoNegativo inherits DomainException {}

class Banda {
	var property nombre
	var property canon = 1000000
	
	method presupuesto() = canon + self.gastoExtra()
	
	method gastoExtra() = 0 
	
	method popularidad()
	
}

class Rock inherits Banda {
	var property soloGuitarra
	
	override method gastoExtra() = 10000
	
	override method popularidad() = 100 * soloGuitarra
	
}

class Trap inherits Banda {
	
	var property tieneHielo
	
	override method popularidad() {
		if (tieneHielo) {
			return 1000
		} 
		return 0
	}
	
	override method canon() = super() * self.popularidad()
}

class Indie inherits Banda {
	var property cantInstrumentos
	override method gastoExtra()  = 500 * cantInstrumentos
	
	override method popularidad() = 3.14 * self.largoNombre()
	
	method largoNombre() = nombre.size()
}