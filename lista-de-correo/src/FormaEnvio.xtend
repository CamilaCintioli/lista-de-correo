
interface FormaEnvio {	
	def void enviar(Lista lista, Mail mail)
}

class Libre implements FormaEnvio {
	
	override enviar(Lista lista, Mail mail) {
		lista.enviarMailASuscriptores(mail)
	}
	
}