package br.com.brsadv.dao;

import br.com.brsadv.model.Adv;
import br.com.brsadv.model.Area;
import br.com.brsadv.model.Endereco;
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
public class AdvDAO implements GenericDAO {

    private Connection conexao;

    public AdvDAO() throws Exception {
        conexao = SingleConnection.getConnection();
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        Adv oAdv = (Adv) objeto;
        Boolean retorno = false;
        if (oAdv.getIdadv() == 0) {
            retorno = this.inserir(oAdv);
        } else {
            retorno = this.alterar(oAdv);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Adv oAdv = (Adv) objeto;
        PreparedStatement stmt = null;
        String sql = "insert into advogados(nome,area,oab,sobre,insta,linkedin,facebook,imagemadv) values (?,?,?,?,?,?,?,?)";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oAdv.getNome());
            stmt.setInt(2, oAdv.getArea().getIdarea());
            stmt.setString(3, oAdv.getOab());
//            stmt.setInt(4, oAdv.getEndereco().getIdendereco());
            stmt.setString(4, oAdv.getSobre());
            stmt.setString(5, oAdv.getInsta());
            stmt.setString(6, oAdv.getLinkedin());
            stmt.setString(7, oAdv.getFacebook());
            stmt.setString(8, oAdv.getImagemadv());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            try {
                System.out.println("Problemas ao cadastrar a Advogado Erro: " + ex.getMessage());
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
        Adv oAdv = (Adv) objeto;
        PreparedStatement stmt = null;
        String sql = "update advogados set nome = ?,area = ?,oab = ?,sobre = ?,insta = ?,linkedin = ?,facebook = ?, imagemadv=? where idadv=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oAdv.getIdadv());
            stmt.setInt(2, oAdv.getArea().getIdarea());
            stmt.setString(3, oAdv.getOab());
            stmt.setString(4, oAdv.getSobre());
            stmt.setString(5, oAdv.getInsta());
            stmt.setString(6, oAdv.getLinkedin());
            stmt.setString(7, oAdv.getFacebook());
            stmt.setString(8, oAdv.getImagemadv());
            stmt.setInt(9, oAdv.getIdadv());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            try {
                System.out.println("Problemas ao alteraroa Advogado Erro: " + ex.getMessage());
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
        int idadv = numero;
        PreparedStatement stmt = null;
        String sql = "delete from advogados where idadv=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idadv);
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            System.out.println("Problemas ao excluir Advogado! Erro: " + ex.getMessage());
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
        int idadv = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Adv oAdv = null;
        String sql = "select * from advogados where idadv=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idadv);
            rs = stmt.executeQuery();
            while (rs.next()) {
                oAdv = new Adv();
                oAdv.setIdadv(rs.getInt("idadv"));
                oAdv.setNome(rs.getString("nome"));
                oAdv.setOab(rs.getString("oab"));
                oAdv.setSobre(rs.getString("sobre"));
                oAdv.setInsta(rs.getString("insta"));
                oAdv.setLinkedin(rs.getString("linkedin"));
                oAdv.setFacebook(rs.getString("facebook"));
                oAdv.setImagemadv(rs.getString("imagemadv"));

                AreaDAO oAreaDAO = new AreaDAO();
                oAdv.setArea((Area) oAreaDAO.carregar(rs.getInt("area")));
//
//                EnderecoDAO oEnderecoDAO = new EnderecoDAO();
//                oAdv.setEndereco((Endereco) oEnderecoDAO.carregar(rs.getInt("idendereco")));
            }
            return oAdv;
        } catch (Exception ex) {
            System.out.println("Problemas ao carregar Advogado! Erro: " + ex.getMessage());
            return false;
        }
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "Select*from advogados order by area";
        try {
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Adv oAdv = new Adv();
                oAdv.setIdadv(rs.getInt("idadv"));
                oAdv.setNome(rs.getString("nome"));
                oAdv.setOab(rs.getString("oab"));
                oAdv.setSobre(rs.getString("sobre"));
                oAdv.setInsta(rs.getString("insta"));
                oAdv.setLinkedin(rs.getString("linkedin"));
                oAdv.setFacebook(rs.getString("facebook"));
                oAdv.setImagemadv(rs.getString("imagemadv"));

                AreaDAO oAreaDAO = null;
                try {
                    oAreaDAO = new AreaDAO();
                } catch (Exception ex) {
                    System.out.println("Erro buscar area " + ex.getMessage());
                    ex.printStackTrace();
                }
                oAdv.setArea((Area) oAreaDAO.carregar(rs.getInt("area")));

                EnderecoDAO oEnderecoDAO = null;
                try {
                    oEnderecoDAO = new EnderecoDAO();
                } catch (Exception ex) {
                    System.out.println("Erro buscar endereco " + ex.getMessage());
                    ex.printStackTrace();
                }
                oAdv.setEndereco((Endereco) oEnderecoDAO.carregar(rs.getInt("endereco")));

                resultado.add(oAdv);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar Advogados! Erro: " + ex.getMessage());
        }
        return resultado;
    }
}
