
package br.com.brsadv.model;

public class Endereco {
    int idendereco;
    Estado estado;
    Cidade cidade;
    String rua;
    int numero;

    public Endereco() {
        this.idendereco = 0;
        this.rua ="";
        this.numero = 0;
        this.estado = new Estado();
        this.cidade = new Cidade();
    }

    public Endereco(int idendereco, Estado estado, Cidade cidade, String rua, int numero) {
        this.idendereco = idendereco;
        this.estado = estado;
        this.cidade = cidade;
        this.rua = rua;
        this.numero = numero;
    }
    

    public int getIdendereco() {
        return idendereco;
    }

    public void setIdendereco(int idendereco) {
        this.idendereco = idendereco;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
    
}
