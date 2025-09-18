object galvan {
	var sueldo = 15000
	
	method sueldo() = sueldo

}
object baigorria {
	var cantidadEmpanadasVendidas = 100
	var montoPorEmpanada = 15
	
	method venderEmpanada() {
	cantidadEmpanadasVendidas = cantidadEmpanadasVendidas + 1
	}
	
	method sueldo() = cantidadEmpanadasVendidas * montoPorEmpanada
}

object negocio {
	var disponible= 50000
	method pagarA( empleado) {
		disponible -=  empleado.sueldo();
	}
	method disponible() = disponible
}

