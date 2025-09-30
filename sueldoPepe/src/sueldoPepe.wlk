/** First Wollok example */
object pepe {
	
	var property categoria
	var property bonoResultado
	var property bonoPresentismo
	var property cantFaltas
	
	method sueldo() {
		return categoria.neto() + bonoResultado.monto(categoria.neto()) + bonoPresentismo.monto(cantFaltas)
	}
}


object gerente {
	var  property neto = 10000
}

object cadete {
	var property neto = 15000
}

object bonoPorcentaje {
	
	method monto(neto)=  neto * 0.1
}


object bonoFijo {
	
	method monto(_) =  800
	
}

object bonoNulo {
	
	method monto(_) = 0
	
}

object bonoDependeFaltas {
	method monto(faltas) {
		
		if(faltas == 0) {
			return 1000
		}
		
		if (faltas == 1) {
			return 500
		}
		
		return 0
	}
}

