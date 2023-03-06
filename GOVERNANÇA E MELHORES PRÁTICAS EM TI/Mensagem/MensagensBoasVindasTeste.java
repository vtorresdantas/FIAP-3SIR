import static org.junit.Assert.assertEquals;

import java.util.Scanner;

import org.junit.Test;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class MensagemBoasVindasTeste {

	// Preparação dos testes
	String mensx = "Pedro Bo";
	MensagemBoasVindas mensUsuario = new MensagemBoasVindas(mensx);

	// Teste da mensagem de abertura
	@Test
	public void t01testeCriarMensRecepcao() {
		String mensRetorno = mensUsuario.exibirMensAbertura();
		assertEquals("Ola! Seja bem vindo a sua calculadora pessoal,", mensRetorno);

	}

	// Teste da mensagem de abertura
	@Test
	public void t02testeCriarMensRecepcao() {
		String mensRetornoEsperado = "Pedro Bo!" + "Confira os resultados dos testes no painel do JUnit";
		String mensRetornoReal = mensUsuario.exibirMensComplemento();
		assertEquals(mensRetornoEsperado, mensRetornoReal);

	}

}
