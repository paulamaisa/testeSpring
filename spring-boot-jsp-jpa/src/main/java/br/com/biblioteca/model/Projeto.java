package br.com.biblioteca.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

@Entity(name = "projeto")
public class Projeto implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;
	@NotNull
	private String nome;
	//@Column(name = "data_inicio")
	private Date dataInicio;
	private Date dataPrevisaoFim;
	private Date dataFim;
	private String descricao;
	
	@Enumerated
	@NotNull
	private TipoDeStatus status;
	private Float orcamento; 
	
	@Enumerated
	@NotNull
	private TipoDeRisco risco;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="idgerente")
	private Pessoa pessoa;
	
	public Date getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}
	public Date getDataPrevisaoFim() {
		return dataPrevisaoFim;
	}
	public void setDataPrevisaoFim(Date dataPrevisaoFim) {
		this.dataPrevisaoFim = dataPrevisaoFim;
	}
	public Date getDataFim() {
		return dataFim;
	}
	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Float getOrcamento() {
		return orcamento;
	}
	public void setOrcamento(Float orcamento) {
		this.orcamento = orcamento;
	}
	
	public TipoDeStatus getStatus() {
		return status;
	}
	public void setStatus(TipoDeStatus status) {
		this.status = status;
	}
	
	public TipoDeRisco getRisco() {
		return risco;
	}
	public void setRisco(TipoDeRisco risco) {
		this.risco = risco;
	}
	
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
}