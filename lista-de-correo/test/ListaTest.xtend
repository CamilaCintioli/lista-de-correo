import org.junit.Test
import org.junit.Assert
import org.junit.Before

class ListaTest {
	var Lista listaAbierta
	var Lista listaCerrada
	var Usuario usuario
	
	@Before
	def void init() {
		listaAbierta = new Lista
		listaCerrada = new Lista => [
			formaSuscripcion = new Cerrada
		]
	}
	
	@Test
	def lista_abierta_suscribe_a_usuario_y_lo_agrega() {
		listaAbierta.suscribir(usuario)
		Assert.assertTrue(listaAbierta.tiene(usuario))
	}
	
	@Test
	def lista_cerrada_suscribe_a_usuario_y_queda_en_pendiete() {
		listaCerrada.suscribir(usuario)
		Assert.assertTrue(listaCerrada.tienePendiente(usuario))
	}
}