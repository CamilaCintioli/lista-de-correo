
class ListaAbierta {
	val suscriptores = newArrayList
	
	def suscribir(Usuario usuario) {
		suscriptores.add(usuario)
	}
	
	def tiene(Usuario usuario) {
		suscriptores.contains(usuario)
	}
}

/**
 * Representa a un usuario de la lista de correo. 
 */
class Usuario {
	
}