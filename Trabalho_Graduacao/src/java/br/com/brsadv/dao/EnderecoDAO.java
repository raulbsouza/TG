/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.brsadv.dao;

import br.com.brsadv.model.Cidade;
import br.com.brsadv.model.Endereco;
import br.com.brsadv.model.Estado;
import br.com.brsadv.utils.SingleConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Raul
 */
public class EnderecoDAO implements GenericDAO{
    private Connection conexao;

    public EnderecoDAO() throws Exception {
        conexao = SingleConnection.getConnection();
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Endereco oEndereco = (Endereco) objeto;
        Boolean retorno = false;
        if (oEndereco.getIdendereco()== 0) {
            retorno = this.inserir(oEndereco);
        } else {
            retorno = this.alterar(oEndereco);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Endereco oEndereco = (Endereco) objeto;
        PreparedStatement stmt = null;
        String sql = "insert into enderecos(estado,cidade,rua,numero) values (?,?,?,?)";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oEndereco.getEstado().getIdEstado());
            stmt.setInt(2, oEndereco.getCidade().getIdCidade());
            stmt.setString(3, oEndereco.getRua());
            stmt.setInt(4, oEndereco.getNumero());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            try {
                System.out.println("Problemas ao cadastrar a Endereço Erro: " + ex.getMessage());
                ex.printStackTrace();
                conexao.rollback();
            } catch (SQLException e) {
                System.out.println("Erro: " + e.getMessage());
                e.printStackTrace();
            }
            return false;
        }
    }

    @Override
    public Boolean alterar(Object objeto) {
        Endereco oEndereco = (Endereco) objeto;
        PreparedStatement stmt = null;
        String sql = "update enderecos set estado = ?,cidade=?,rua=?, numero=? where idendereco=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oEndereco.getEstado().getIdEstado());
            stmt.setInt(2, oEndereco.getCidade().getIdCidade());
            stmt.setString(3, oEndereco.getRua());
            stmt.setInt(4, oEndereco.getNumero());
            stmt.setInt(5, oEndereco.getIdendereco());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            try {
                System.out.println("Problemas ao alterar a Endereço Erro: " + ex.getMessage());
                ex.printStackTrace();
                conexao.rollback();
            } catch (SQLException e) {
                System.out.println("Erro: " + e.getMessage());
                e.printStackTrace();
            }
            return false;
        }
    }

    @Override
    public Boolean excluir(int numero) {
        int idEndereco = numero;
        PreparedStatement stmt = null;
         String sql = "delete from enderecos where idendereco=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idEndereco);
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir a Endereço! Erro: " + ex.getMessage());
            try {
                conexao.rollback();
            } catch (SQLException e) {
                System.out.println("Erro rollback " + e.getMessage());
                e.printStackTrace();
            }
            return false;
        }
    }

    @Override
    public Object carregar(int numero) {
        int idEndereco = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Endereco oEndereco = null;
        String sql = "select * from enderecos where idendereco=?";
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idEndereco);
            rs=stmt.executeQuery();
            while (rs.next()){
                oEndereco = new Endereco();
                oEndereco.setIdendereco(rs.getInt("idendereco"));
                oEndereco.setRua(rs.getString("rua"));
                oEndereco.setNumero(rs.getInt("numero"));
                
                EstadoDAO oEstadoDAO = new EstadoDAO();
                oEndereco.setEstado((Estado) oEstadoDAO.carregar(rs.getInt("estado")));
                
                CidadeDAO oCidadeDAO = new CidadeDAO();
                oEndereco.setCidade((Cidade) oCidadeDAO.carregar(rs.getInt("cidade")));
            }
            return oEndereco;
        }catch (Exception ex){
            System.out.println("Problemas ao carregar Endereço! Erro: "+ex.getMessage());
            return false;
        }
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "Select*from enderecos order by estado";
        try{
            stmt = conexao.prepareStatement(sql);
            rs=stmt.executeQuery();
            while(rs.next()){
                Endereco oEndereco = new Endereco();
                oEndereco.setIdendereco(rs.getInt("idendereco"));
                oEndereco.setRua(rs.getString("rua"));
                oEndereco.setNumero(rs.getInt("numero"));
                
                EstadoDAO oEstadoDAO = null;
                try{
                    oEstadoDAO = new EstadoDAO();
                } catch(Exception ex){
                    System.out.println("Erro buscar estado "+ex.getMessage());
                    ex.printStackTrace();
                }
                oEndereco.setEstado((Estado) oEstadoDAO.carregar(rs.getInt("estado")));
                
                CidadeDAO oCidadeDAO = null;
                try{
                    oCidadeDAO = new CidadeDAO();
                } catch(Exception ex){
                    System.out.println("Erro buscar cidade "+ex.getMessage());
                    ex.printStackTrace();
                }
                oEndereco.setCidade((Cidade) oCidadeDAO.carregar(rs.getInt("cidade")));
                
                
                resultado.add(oEndereco);
            }
        }catch (SQLException ex){
            System.out.println("Problemas ao listar Endereço! Erro: "+ex.getMessage());
        }
        return resultado;
    }
}
