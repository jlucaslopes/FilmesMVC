package br.com.fiap.model;

import javax.validation.constraints.Size;

public class FilmeModel {

	private long id;
	private String nome;
	private String sinopse;
	private String genero;
	private String dataLancamento;
	private String produtora;


	
	public FilmeModel() {
		super();
	}

	public FilmeModel(long id, String nome, String sinopse, String genero, String dataLancamento, String produtora) {
		super();
		this.id = id;
		this.nome = nome;
		this.sinopse = sinopse;
		this.genero = genero;
		this.dataLancamento = dataLancamento;
		this.produtora = produtora;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Size(min = 1, max = 100, message = "O nome deve conter entre 1 e 100 caracteres")
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Size(min = 30, message = "A sinopse deve conter no mínimo 30 caracteres")
	public String getSinopse() {
		return sinopse;
	}

	public void setSinopse(String sinopse) {
		this.sinopse = sinopse;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	@Size(min = 0, message = "Informe uma data")
	public String getDataLancamento() {
		return dataLancamento;
	}

	public void setDataLancamento(String dataLancamento) {
		this.dataLancamento = dataLancamento;
	}

	@Size(min = 1, message = "Informe uma produtora")
	public String getProdutora() {
		return produtora;
	}

	public void setProdutora(String produtora) {
		this.produtora = produtora;
	}

}
