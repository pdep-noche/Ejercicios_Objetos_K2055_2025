class Cliente {
	var property tipoCliente
	var property salario
	
	method cuantoPagaraPara(montoCuenta) {
		return montoCuenta + tipoCliente.propinaDe(montoCuenta, self)
	}
}

object comun {
	method propinaDe(monto, _) = monto * 0.1
}

class Comedido {
	var property montoMax
	
	method propinaDe(monto, _) = montoMax.min(monto * 0.2)
}

object amarrete {
	method propinaDe(monto, _) = 0
}

object segunSalario {
	method propinaDe(_, cliente) = cliente.salario() * 0.01
}


