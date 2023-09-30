package br.com.brsadv.dao;

import br.com.brsadv.model.Cidade;
import br.com.brsadv.model.Estado;
import br.com.brsadv.utils.SingleConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CidadeDAO implements GenericDAO {

    private Connection conexao;

    public CidadeDAO() throws Exception {
        conexao = SingleConnection.getConnection();
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Cidade oCidade = (Cidade) objeto;
        Boolean retorno = false;
        if (oCidade.getIdCidade() == 0) {
            retorno = this.inserir(oCidade);
        } else {
            retorno = this.alterar(oCidade);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Cidade oCidade = (Cidade) objeto;
        PreparedStatement stmt = null;
        String sql = "insert into cidade(nomecidade,idestado,cep) values (?,?,?)";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oCidade.getNomeCidade());
            stmt.setInt(2, oCidade.getEstado().getIdEstado());
            stmt.setInt(3, oCidade.getCep());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            try {
                System.out.println("Problemas ao cadastrar a Cidade Erro: " + ex.getMessage());
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
        Cidade oCidade = (Cidade) objeto;
        PreparedStatement stmt = null;
        String sql = "update cidade set nomecidade = ?,idestado=?,cep=? where idcidade=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oCidade.getNomeCidade());
            stmt.setInt(2, oCidade.getEstado().getIdEstado());
            stmt.setInt(3, oCidade.getCep());
            stmt.setInt(4, oCidade.getIdCidade());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            try {
                System.out.println("Problemas ao alterar a Cidade Erro: " + ex.getMessage());
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
        int idCidade = numero;
        PreparedStatement stmt = null;
         String sql = "delete from cidade where idcidade=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idCidade);
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir a Cidade! Erro: " + ex.getMessage());
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
        int idCidade = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Cidade oCidade = null;
        String sql = "select * from cidade where idcidade=?";
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idCidade);
            rs=stmt.executeQuery();
            while (rs.next()){
                oCidade = new Cidade();
                oCidade.setIdCidade(rs.getInt("idCidade"));
                oCidade.setNomeCidade(rs.getString("nomecidade"));
                oCidade.setCep(rs.getInt("cep"));
                
                EstadoDAO oEstadoDAO = new EstadoDAO();
                oCidade.setEstado((Estado) oEstadoDAO.carregar(rs.getInt("idestado")));
            }
            return oCidade;
        }catch (Exception ex){
            System.out.println("Problemas ao carregar Cidade! Erro: "+ex.getMessage());
            return false;
        }
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "Select*from cidade order by idcidade";
        try{
            stmt = conexao.prepareStatement(sql);
            rs=stmt.executeQuery();
            while(rs.next()){
                Cidade oCidade = new Cidade();
                oCidade.setIdCidade(rs.getInt("idCidade"));
                oCidade.setNomeCidade(rs.getString("nomecidade"));
                oCidade.setCep(rs.getInt("cep"));
                
                EstadoDAO oEstadoDAO = null;
                try{
                    oEstadoDAO = new EstadoDAO();
                } catch(Exception ex){
                    System.out.println("Erro buscar estado "+ex.getMessage());
                    ex.printStackTrace();
                }
                oCidade.setEstado((Estado) oEstadoDAO.carregar(rs.getInt("idestado")));
                resultado.add(oCidade);
            }
        }catch (SQLException ex){
            System.out.println("Problemas ao listar Cidade! Erro: "+ex.getMessage());
        }
        return resultado;
    }

}
