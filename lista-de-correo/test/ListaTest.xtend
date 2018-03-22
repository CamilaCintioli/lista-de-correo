import org.junit.Test
import org.junit.Assert

class ListaTest {
	var listaAbierta = new ListaAbierta
	var usuario = new Usuario
	
	@Test
	def lista_abierta_suscribe_a_usuario_y_lo_agrega() {
		listaAbierta.suscribir(usuario)
		Assert.assertTrue(listaAbierta.tiene(usuario))
	}
	
}