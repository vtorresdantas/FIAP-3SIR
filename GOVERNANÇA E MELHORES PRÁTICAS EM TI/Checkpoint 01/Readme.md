# Checkpoint 1

## 1° Desafio
Crie um projeto JAVA com a classe CodigoPessoaFisica fornecida a seguir.
Essa Classe fornecida possui um método chamado validaCPF, que serve para avaliar se número
de CPF informado está correto, retornando true se sim e false, se não for válido.
Crie uma Classe JUNIT de testes com os métodos para validar se o método validaCPF está
funcionando em caso positivo (cpf informado é correto) e em caso negativo (cpf informado é
incorreto).
Crie também um teste na mesma classe JUNIT, o qual aciona o método
removeCaracteresEspeciais, o qual deve receber um CPF com “.” e “-“ e, retornar só os
números (a implementação desse método está no fonte a seguir, junto com o método
validaCPF).
Em um documento Word ou em editor equivalente, coloque os textos dos códigos fontes das
JUNITs Test Cases e cole junto as imagens dos resultados da execução das JUNIT Cases.
Ao final, gere um PDF e entregue na área de Entrega de Trabalhos que foi aberta pelo
professor com o nome Checkpoint-Junit.
OBS: Não altere a Classe de Objetos que foi fornecida (a ser testada). Seu foco é criar, executar
os testes e observar se a Classe fornecida funciona ou não. Como o programa fonte não tem
main(), não tente rodar a Classe fornecida diretamente – rode as JUNITs! 

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class CodigoPessoaFisicaTest {

	@Test
	public void testeValidaCPFInvalido() {
		String valorCpf = "11144477705";
		Boolean digitoReal = null;

		CodigoPessoaFisica cdg = new CodigoPessoaFisica();
		Boolean digitoEsperado = false;
		digitoReal = cdg.validaCPF(valorCpf);
		assertEquals(digitoEsperado, digitoReal);
	}

	@Test
	public void testeValidaCPFValido() {
		String valorCpf = "37064170817";
		Boolean digitoReal = null;

		CodigoPessoaFisica cdg = new CodigoPessoaFisica();
		Boolean digitoEsperado = true;
		digitoReal = cdg.validaCPF(valorCpf);
		assertEquals(digitoEsperado, digitoReal);
	}

	@Test
	public void formataCPF() {
		String valorCpf = "362.598.688-47";
		String cpfEsperado = "36259868847";

		CodigoPessoaFisica cdg = new CodigoPessoaFisica();
		String cpfReal = cdg.removeCaracteresEspeciais(valorCpf);
		assertEquals(cpfReal, cpfEsperado);
	}

}


## 2° Desafio

Crie uma Classe ValidadoraAcesso com um método que contenha uma lista (array) de CPFs
autorizados a acessar um sistema e que verifique se um CPF que foi validado, tem permissão
de acesso ao sistema. Esse método vai receber um CPF a validar e você decidirá o que esse
método vai retornar, avaliando o retorno em testes com JUNIT.
Crie em seguida um programa que formata e retorna uma mensagem, informando “Seu CPF é
inválido para acesso ao sistema” ou seu “Seu CPF é válido para acesso ao sistema”. Esse
programa deve ser implementado em um Método de uma Classe chamada LogCPF.
FAÇA AS JUNITS PARA TESTAR CADA FUNÇÃO ISOLADAMENTE (TESTE UNITÁRIO). Você não vai
fazer teste integrado de sistema com JUNIT; ao invés disso, simule CPFs válidos e inválidos em
cada JUNIT TEST CASE.
Por fim, crie uma SUITE de teste que rode juntas as Classes e Métodos de testes. 
