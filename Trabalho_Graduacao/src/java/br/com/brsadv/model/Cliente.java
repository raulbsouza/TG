package br.com.brsadv.model;

import br.com.brsadv.utils.Conversao;
import java.text.ParseException;
import java.util.Date;

public class Cliente extends Pessoa {

    private int idCliente;
    private String permiteLogin;
    private String situacao;

    public Cliente(int idCliente , String permiteLogin, String situacao, int idPessoa, String cpfCnpj, String nome, Date dataNascimento, Cidade cidade, String login, String senha, String foto) {
        super(idPessoa, cpfCnpj, nome, dataNascimento, cidade, login, senha, foto);
        this.idCliente = idCliente;
        this.permiteLogin = permiteLogin;
        this.situacao = situacao;
    }
    public static Cliente clienteVazio() throws ParseException{
        Cidade oCidade = new Cidade();
        Date dataNascimento = Conversao.dataAtual();
        Cliente oCliente = new Cliente(0,"S","A",0,"","",dataNascimento,oCidade,"","",null);
        return oCliente;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getPermiteLogin() {
        return permiteLogin;
    }

    public void setPermiteLogin(String permiteLogin) {
        this.permiteLogin = permiteLogin;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

}