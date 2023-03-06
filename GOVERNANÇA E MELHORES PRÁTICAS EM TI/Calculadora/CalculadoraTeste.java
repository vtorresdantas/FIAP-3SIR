import static org.junit.Assert.assertEquals;

import org.junit.Test;

//classe de teste da calculadora digital
public class CalculadoraTeste {

	@Test
	public void somar1Com3() {
		// iniciação de variáveis de controle do teste
		int varInput1 = 1;
		int varInput2 = 3;
		int varResultadoEsperado = 4;

		// testar a função
		Calculadora calc = new Calculadora();
		int varResultConta = calc.somar(varInput1, varInput2);

		// validação da aplicação
		assertEquals(varResultadoEsperado, varResultConta, 0);

	}

	@Test
	public void subtrair2Com1() {
		// iniciação de variáveis de controle do teste
		int varInput1 = 2;
		int varInput2 = 1;
		int varResultadoEsperado = 1;

		// testar a função
		Calculadora calc = new Calculadora();
		int varResultConta = calc.subtrair(varInput1, varInput2);

		// validação da aplicação
		assertEquals(varResultadoEsperado, varResultConta, 0);

	}

	@Test
	public void multiplicar2com2() {
		// iniciação de variáveis de controle do teste
		int varInput1 = 2;
		int varInput2 = 2;
		int varResultadoEsperado = 4;

		// testar a função
		Calculadora calc = new Calculadora();
		int varResultConta = calc.multiplicar(varInput1, varInput2);

		// validação da aplicação
		assertEquals(varResultadoEsperado, varResultConta, 0);

	}

	@Test
	public void dividir50com10() {
		// iniciação de variáveis de controle do teste
		int varInput1 = 50;
		int varInput2 = 10;
		int varResultadoEsperado = 5;

		// testar a função
		Calculadora calc = new Calculadora();
		int varResultConta = calc.dividir(varInput1, varInput2);

		// validação da aplicação
		assertEquals(varResultadoEsperado, varResultConta, 0);

	}
	
	
	

}
