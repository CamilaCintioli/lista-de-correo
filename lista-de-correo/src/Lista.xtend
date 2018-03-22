import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Lista {
	var FormaSuscripcion formaSuscripcion = new Abierta
	val suscriptores = newArrayList
	
	def suscribir(Usuario usuario) {
		formaSuscripcion.suscribir(this, usuario)
	}
	
	def tiene(Usuario usuario) {
		suscriptores.contains(usuario)
	}
	
	def tienePendiente(Usuario usuario) {
		formaSuscripcion.tienePendienteAl(usuario)
	}
	
}

interface FormaSuscripcion {
	def void suscribir(Lista lista, Usuario usuario)
	
	def Boolean tienePendienteAl(Usuario usuario)
}

class Abierta implements FormaSuscripcion {
	override suscribir(Lista lista, Usuario usuario) {
		lista.suscriptores.add(usuario)
	}
	
	override tienePendienteAl(Usuario usuario) {
		false
	}
	
}

class Cerrada implements FormaSuscripcion {
	val pendientes = newArrayList
	
	override suscribir(Lista lista, Usuario usuario) {
		pendientes.add(usuario)
	}
	
	override tienePendienteAl(Usuario usuario) {
		pendientes.contains(usuario)
	}
	
}

/**
 * Representa a un usuario de la lista de correo. 
 */
class Usuario {
	
}