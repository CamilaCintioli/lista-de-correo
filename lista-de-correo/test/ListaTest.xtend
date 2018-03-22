import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import static org.mockito.Mockito.*

class ListaTest {
	Lista listaAbierta
	Lista listaCerrada
	Lista listaLibre
	Usuario usuario = new Usuario
	GMailSender sender
	
	@Before
	def void init() {
		sender = mock(GMailSender)
		listaAbierta = new Lista
		listaCerrada = new Lista => [
			formaSuscripcion = new Cerrada
		]
		listaLibre = new Lista => [
			mailSender = sender
		]
	}
	
	@Test
	def lista_abierta_suscribe_a_usuario_y_lo_agrega() {
		listaAbierta.suscribir(usuario)
		assertTrue(listaAbierta.tiene(usuario))
	}
	
	@Test
	def lista_cerrada_suscribe_a_usuario_y_queda_en_pendiete() {
		listaCerrada.suscribir(usuario)
		assertTrue(listaCerrada.tienePendiente(usuario))
	}
	
	@Test
	def lista_libre_envio_mail_y_les_llega_a_todos_los_suscriptos() {
		val usuarioRemitente = new Usuario => [
			mail = "no-mail@mail.com"
		]
		val usuarioDestinatario = new Usuario => [
			mail = "mail@mail.com"
		]
		val mail = new Mail => [
			remitente = usuarioRemitente  
			asunto = "Hola"
			mensaje = "Los quiero mucho!"
		]
		listaLibre.suscribir(usuarioRemitente)
		listaLibre.suscribir(usuarioDestinatario)
		listaLibre.enviar(mail)
		verify(sender, only)
		.sendMail("mail@mail.com", "Hola", "Los quiero mucho!")
	}
}