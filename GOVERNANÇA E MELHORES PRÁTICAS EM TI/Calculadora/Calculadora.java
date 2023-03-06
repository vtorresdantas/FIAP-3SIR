//calculadora aritmética de inteiros
public class Calculadora {

	// atributo para receber os resultados dos cálculos
	int valorResultante = 0;
	int variavel1;
	int variavel2;

	public int somar(int variavel1, int variavel2) {
		return variavel1 + variavel2;
	}

	public int subtrair(int variavel1, int variavel2) {
		return variavel1 - variavel2;
	}

	public int dividir(int variavel1, int variavel2) {
		return variavel1 / variavel2;
	}

	public int multiplicar(int variavel1, int variavel2) {
		return variavel1 * variavel2;
	}
	
}
