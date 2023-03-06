
public class Energia {

	// atributo para receber os resultados dos cálculos
	double joules;
	double massa;
	double velocidade;

	public double calculaJoules1(double massa, double velocidade) {
		return (massa * 9.8) * velocidade;
	}

	public double calculaJoules2(double massa, double velocidade) {
		return (massa * 9.8) * (velocidade * 0.305);
	}

	public double calculaJoules3(double massa, double velocidade) {
		return (massa * 9.8 /100) *  velocidade;
	}

	public double calculaJoules4(double massa, double velocidade) {
		return (massa * 9.8 /100) * (velocidade * 0.305);
	}

}
