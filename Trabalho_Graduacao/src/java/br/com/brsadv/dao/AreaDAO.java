package br.com.brsadv.dao;

import br.com.brsadv.model.Area;
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


public class AreaDAO implements GenericDAO{
    private Connection conexao;

    public AreaDAO() throws Exception {
        conexao = SingleConnection.getConnection();
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Area oArea = (Area) objeto;
        Boolean retorno = false;
        if (oArea.getIdarea()== 0) {
            retorno = this.inserir(oArea);
        } else {
            retorno = this.alterar(oArea);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Area oArea = (Area) objeto;
        PreparedStatement stmt = null;
        String sql = "insert into areas(nomearea,descricao) values (?,?)";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oArea.getNomearea());
            stmt.setString(2, oArea.getDesc());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            try {
                System.out.println("Problemas ao cadastrar a Area Erro: " + ex.getMessage());
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
        Area oArea = (Area) objeto;
        PreparedStatement stmt = null;
        String sql = "update areas set nomearea = ?,descricao=? where idarea=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oArea.getNomearea());
            stmt.setString(2, oArea.getDesc());
            stmt.setInt(3, oArea.getIdarea());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            try {
                System.out.println("Problemas ao alterar a Area Erro: " + ex.getMessage());
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
        int idArea = numero;
        PreparedStatement stmt = null;
         String sql = "delete from areas where idarea=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idArea);
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir a Area! Erro: " + ex.getMessage());
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
        int idArea = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Area oArea = null;
        String sql = "select * from areas where idarea=?";
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idArea);
            rs=stmt.executeQuery();
            while (rs.next()){
                oArea = new Area();
                oArea.setIdarea(rs.getInt("idarea"));
                oArea.setNomearea(rs.getString("nomearea"));
                oArea.setDesc(rs.getString("descricao"));
            }
            return oArea;
        }catch (Exception ex){
            System.out.println("Problemas ao carregar Area! Erro: "+ex.getMessage());
            return false;
        }
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "Select*from areas order by nomearea";
        try{
            stmt = conexao.prepareStatement(sql);
            rs=stmt.executeQuery();
            while(rs.next()){
                Area oArea = new Area();
                oArea.setIdarea(rs.getInt("idarea"));
                oArea.setNomearea(rs.getString("nomearea"));
                oArea.setDesc(rs.getString("descricao"));
                resultado.add(oArea);
            }
        }catch (SQLException ex){
            System.out.println("Problemas ao listar Area! Erro: "+ex.getMessage());
        }
        return resultado;
    }
}


