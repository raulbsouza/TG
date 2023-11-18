/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.brsadv.model;

/**
 *
 * @author Aluno
 */
public class Cidade {
    
    private int idCidade;
    private String nomeCidade;
    private Estado estado;

    public Cidade(int idCidade, String nomeCidade, Estado estado, Integer cep) {
        this.idCidade = idCidade;
        this.nomeCidade = nomeCidade;
        this.estado = estado;
    }
    
    public Cidade(){
        this.idCidade = 0;
        this.nomeCidade ="";
        this.estado = new Estado();
    }

    public int getIdCidade() {
        return idCidade;
    }

    public void setIdCidade(int idCidade) {
        this.idCidade = idCidade;
    }

    public String getNomeCidade() {
        return nomeCidade;
    }

    public void setNomeCidade(String nomeCidade) {
        this.nomeCidade = nomeCidade;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    
}

    