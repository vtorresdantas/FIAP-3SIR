
public class MensagemBoasVindas {

	private String mensagem;

	// Construtor

	public MensagemBoasVindas(String mens) {
		this.mensagem = mens;
	}

	// exibição de mensagem de abertura
	public String exibirMensAbertura() {
		String mensAbertura;
		mensAbertura = "Ola! Seja bem vindo a sua calculadora pessoal,";
		System.out.println(mensAbertura);
		return mensAbertura;
	}

	// exibição de mensagem de complementar
	public String exibirMensComplemento() {
		String mensComplemento = this.mensagem + "!" + "Confira os resultados dos testes no painel do JUnit";
		System.out.println(this.mensagem + "!");
		System.out.println("Confira os resultados dos testes no painel do JUnit");
		return mensComplemento;
	}

}
