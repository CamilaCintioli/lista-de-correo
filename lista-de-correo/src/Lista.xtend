import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Lista {
	var FormaSuscripcion formaSuscripcion = new Abierta
	var FormaEnvio formaEnvio = new Libre
	var GMailSender mailSender 
	val List<Usuario> suscriptores = newArrayList
	
	def suscribir(Usuario usuario) {
		formaSuscripcion.suscribir(this, usuario)
	}
	
	def tiene(Usuario usuario) {
		suscriptores.contains(usuario)
	}
	
	def tienePendiente(Usuario usuario) {
		formaSuscripcion.tienePendienteAl(usuario)
	}
	
	def enviar(Mail mail) {
		formaEnvio.enviar(this, mail)
	}
	
	def enviarMailASuscriptores(Mail mail) {
		suscriptores
			.filter[usuario | usuario != mail.remitente]
			.forEach[usuario | 
				mailSender.sendMail(usuario.mail, mail.asunto, mail.mensaje)
			]
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
 @Accessors
class Usuario {
	String mail	
}