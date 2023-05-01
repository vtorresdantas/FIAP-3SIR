package br.fiap.app.exemplo.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

@Entity
public class Viagem {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)

	private Long id;

	private String dtoDecolagem;
	private int estadia;
	private int assentos;
	//@Pattern(regexp = "[a-z]{4}-\\d{4}", message = "Formato de modelo inválido!")
	private String modeloNave;
	
	@NotNull
	private String primeiroComandante;
	
	@Pattern(regexp="[a-zA-Z]{3}-\\d{4}-[a-zA-Z]\\d[a-zA-Z]", message = "formato inválido!")
	private String matriculaPrimeiro;

	@NotNull
	private String segundoComandante;
	
	@Pattern(regexp="[a-zA-Z]{3}-\\d{4}-[a-zA-Z]\\d[a-zA-Z]", message = "formato inválido!")
	private String matriculaSegundo;
	
	
	private String dtoRetorno;
	
	public String getDtoRetorno() {
		return dtoRetorno;
	}

	public void setDtoRetorno(String dtoRetorno) {
		this.dtoRetorno = dtoRetorno;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDtoDecolagem() {
		return dtoDecolagem;
	}

	public void setDtoDecolagem(String dtoDecolagem) {
		this.dtoDecolagem = dtoDecolagem;
	}

	public int getEstadia() {
		return estadia;
	}

	public void setEstadia(int estadia) {
		this.estadia = estadia;
	}

	public int getAssentos() {
		return assentos;
	}

	public void setAssentos(int assentos) {
		this.assentos = assentos;
	}

	public String getModeloNave() {
		return modeloNave;
	}

	public void setModeloNave(String modeloNave) {
		this.modeloNave = modeloNave;
	}

	public String getPrimeiroComandante() {
		return primeiroComandante;
	}

	public void setPrimeiroComandante(String primeiroComandante) {
		this.primeiroComandante = primeiroComandante;
	}

	public String getMatriculaPrimeiro() {
		return matriculaPrimeiro;
	}

	public void setMatriculaPrimeiro(String matriculaPrimeiro) {
		this.matriculaPrimeiro = matriculaPrimeiro;
	}

	public String getSegundoComandante() {
		return segundoComandante;
	}

	public void setSegundoComandante(String segundoComandante) {
		this.segundoComandante = segundoComandante;
	}

	public String getMatriculaSegundo() {
		return matriculaSegundo;
	}

	public void setMatriculaSegundo(String matriculaSegundo) {
		this.matriculaSegundo = matriculaSegundo;
	}

}
