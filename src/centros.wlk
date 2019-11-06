import lugares.*
import vendedores.*

class Centro {
	const property ciudad = null
	var property vendedores = #{}
	
	method agregarVendedor(vendedor) {
		if (not vendedores.contains(vendedor)) {
			vendedores.add(vendedor)
		} else {
			self.error("El vendedor ya está agregado al centro")
		}
	}
	
	method vendedorEstrella() {
		return vendedores.max({ vendedor => vendedor.puntajeCertificaciones() })
	}
	
	method puedeCubrirCiudad(ciudadUna) { //pongo ciudadUna porque ciudad ya lo tengo como atributo
		vendedores.any({ vendedor => vendedor.puedeTrabajarEn(ciudadUna) })
	}
	
	method vendedoresGenericos() {
		return vendedores.filter({ vendedor => vendedor.esGenerico() })
	}
	
	method esRobusto() {
		return self.vendedoresFirmes().size()>=3
	}
	
	method vendedoresFirmes() {
		return vendedores.filter({ vendedor => vendedor.esFirme() })
	}
	
	method esRobusto2() {
		return vendedores.count({ vendedor => vendedor.esFirme() }) >= 3
	}
	
	method repartirCertificacion(certificacion) {
		vendedores.forEach({ vendedor => vendedor.agregarCertificacion(certificacion) })
	}
}
