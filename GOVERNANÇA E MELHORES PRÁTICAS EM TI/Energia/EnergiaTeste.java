import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

//classe de teste da calculadora de energia digital
public class EnergiaTeste {

	@Test
	public void massa10Velocidade2() {
		// iniciação de variáveis de controle do teste
		double massa = 10;
		double velocidade = 2;
		double joules = 196;

		// testar a função
		Energia energia = new Energia();
		double resultado = energia.calculaJoules1(massa, velocidade);

		// validação da aplicação
		assertEquals(resultado, joules, 0);

	}

}
