import lugares.*


class Vendedor {
	const property certificaciones = #{}
	
	method agregarCertificacion(certificacion) {
		certificaciones.add(certificacion)
	}
	
	method puedeTrabajarEn(ciudad)
	
	method esVersatil() {
		return certificaciones.size() >= 3 and 
			certificaciones.any({ certificacion => certificacion.esSobreProducto() }) and 
			certificaciones.any({ certificacion => not certificacion.esSobreProducto() }) 
	}
		
	method esFirme() {
		return self.puntajeCertificaciones() >= 30
	}
	
	method puntajeCertificaciones() {
		return certificaciones.sum({certificacion => certificacion.puntaje()})
	}
	
	method esInfluyente() {
		return false
	}
	
	method esGenerico() {
		return certificaciones.any({ certificacion => not certificacion.esSobreProducto() })
	}
	
}



class VendedorFijo inherits Vendedor {
	var property ciudadResidencia = null
	
	override method puedeTrabajarEn(ciudad) {
		return ciudadResidencia == ciudad
	}
}

class Viajante inherits Vendedor {
	var property provinciasHabilitadas = #{}
	
	override method puedeTrabajarEn(ciudad) {
		return provinciasHabilitadas.contains( ciudad.estaEnProvincia() )
	}
	
	override method esInfluyente() {
		return provinciasHabilitadas.sum({provincia => provincia.poblacion()}) >= 10000000
	}
}

class Corresponsal inherits Vendedor {
	var property ciudadadesSucursales = #{}
	
	override method puedeTrabajarEn(ciudad) {
		return ciudadadesSucursales.any({sucursal => sucursal==ciudad})
	}
	
	override method esInfluyente() {
		return ciudadadesSucursales.size()>=5 or self.provincias().size()>=3
	}
	
	method provincias() {
		return ciudadadesSucursales.map({sucursal => sucursal.estaEnProvincia()}).asSet()
	}
}



class Certificacion {
	var property puntaje = 0
	var property esSobreProducto = false
}


