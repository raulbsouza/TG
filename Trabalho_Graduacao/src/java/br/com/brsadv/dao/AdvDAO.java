package br.com.brsadv.dao;

import br.com.brsadv.model.Adv;
import br.com.brsadv.model.Area;
import br.com.brsadv.model.Cidade;
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
        Boolean retorno = false;
        try {
            Adv oAdv = (Adv) objeto;
            if (oAdv.getIdAdv() == 0) { //inserção
                //verifica se já existe pessoa com este CPF cadastrada.
                int idAdv = this.verificarCpf(oAdv.getCpfCnpj());
                if (idAdv == 0) {
                    //se não encontrou insere
                    retorno = this.inserir(oAdv);
                } else {
                    //se encontrou administrador com o cpf altera
                    oAdv.setIdAdv(idAdv);
                    retorno = this.alterar(oAdv);
                }
            } else {
                retorno = this.alterar(oAdv);
            }
        } catch (Exception ex) {
            System.out.println("Problemas ao incluir Adv! Erro " + ex.getMessage());
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        Adv oAdv = (Adv) objeto;
        PreparedStatement stmt = null;
        String sql = "insert into adv(idpessoa , situacao, permitelogin,area,oab,sobre,insta,linkedin,facebook) values (?,?,?,?,?,?,?,?,?)";
        try {
            PessoaDAO oPessoaDAO = new PessoaDAO();
            //manda informações para o cadastrar de pessoa.
            int idPessoa = oPessoaDAO.cadastrar(oAdv);
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idPessoa);
            stmt.setString(2, "A");
            stmt.setString(3, oAdv.getPermiteLogin());
            stmt.setInt(4, oAdv.getArea().getIdarea());
            stmt.setString(5, oAdv.getOab());
            stmt.setString(6, oAdv.getSobre());
            stmt.setString(7, oAdv.getInsta());
            stmt.setString(8, oAdv.getLinkedin());
            stmt.setString(9, oAdv.getFacebook());
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
        String sql = "update adv set permitelogin = ?,area = ?,oab = ?,sobre = ?,insta = ?,linkedin = ?,facebook = ? where idadv=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, oAdv.getPermiteLogin());
            stmt.setInt(2, oAdv.getArea().getIdarea());
            stmt.setString(3, oAdv.getOab());
            stmt.setString(4, oAdv.getSobre());
            stmt.setString(5, oAdv.getInsta());
            stmt.setString(6, oAdv.getLinkedin());
            stmt.setString(7, oAdv.getFacebook());
            stmt.setInt(8, oAdv.getIdAdv());
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
        PreparedStatement stmt = null;
        try {
            //carrega dados de administrador
            AdvDAO oAdvDAO = new AdvDAO();
            Adv oAdv = (Adv) oAdvDAO.carregar(numero);
            String situacao = "A";//verifica e troca a situação do administrador
            if (oAdv.getSituacao().equals(situacao)) {
                situacao = "I";
            } else {
                situacao = "A";
            }

            String sql = "update adv set situacao=? where idadv=?";
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, situacao);
            stmt.setInt(2, oAdv.getIdAdv());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception e) {
            try {
                System.out.println("Problemas ao excluir Adv!Erro: " + e.getMessage());
                e.printStackTrace();
                conexao.rollback();
            } catch (SQLException ex) {
                System.out.println("Problemas ao executar rollback" + ex.getMessage());
                ex.printStackTrace();
            }
            return false;
        }
    }

    @Override
    public Object carregar(int numero) {
        int idAdv = numero;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Adv oAdv = null;
        String sql = "Select * from adv c, pessoa p "
                + "where c.idpessoa = p.idpessoa and c.idadv=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, idAdv);
            rs = stmt.executeQuery();
            while (rs.next()) {
                //Busca a cidade
                Cidade oCidade = null;
                try {
                    CidadeDAO oCidadeDAO = new CidadeDAO();
                    oCidade = (Cidade) oCidadeDAO.carregar(rs.getInt("idcidade"));
                } catch (Exception ex) {
                    System.out.println("Problemas ao carregar cidade!Erro:" + ex.getMessage());
                }
                Area oArea = null;
                try {
                    AreaDAO oAreaDAO = new AreaDAO();
                    oArea = (Area) oAreaDAO.carregar(rs.getInt("area"));
                } catch (Exception ex) {
                    System.out.println("Problemas ao carregar área! Erro:" + ex.getMessage());
                }
                oAdv = new Adv(rs.getInt("idAdv"),
                        rs.getString("permitelogin"),
                        rs.getString("situacao"),
                        oArea,
                        rs.getString("oab"),
                        rs.getString("sobre"),
                        rs.getString("insta"),
                        rs.getString("linkedin"),
                        rs.getString("facebook"),
                        rs.getInt("idpessoa"),
                        rs.getString("cpfcnpj"),
                        rs.getString("nome"),
                        rs.getDate("datanascimento"),
                        oCidade,
                        rs.getString("login"),
                        rs.getString("senha"),
                        rs.getString("foto"));
            }
        } catch (SQLException e) {
            System.out.println("Problemas ao carregar ADV!Erro: " + e.getMessage());
            e.printStackTrace();
        }
        return oAdv;
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql= "Select p.*, c.idadv, c.situacao, c.permitelogin, c.area, c.oab, c.sobre, c.insta, c.linkedin, c.facebook "
                + "from adv c, pessoa p "
                + "where c.idpessoa = p.idpessoa order by idPessoa";
        try{
            stmt = conexao.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()){
                Cidade oCidade = null;//busca cidade
                try{
                   CidadeDAO oCidadeDAO = new CidadeDAO();
                   oCidade = (Cidade) oCidadeDAO.carregar(rs.getInt("idcidade"));
                }catch(Exception ex){
                   System.out.println("Problemas ao carregar usuario!Erro:"+ex.getMessage());
                }
                Area oArea = null;
                try{
                   AreaDAO oAreaDAO = new AreaDAO();
                   oArea = (Area) oAreaDAO.carregar(rs.getInt("area"));
                }catch(Exception ex){
                   System.out.println("Problemas ao carregar usuario!Erro:"+ex.getMessage());
                }
               Adv oAdv = new Adv(rs.getInt("idAdv"),
                        rs.getString("permitelogin"),
                        rs.getString("situacao"),
                        oArea,
                        rs.getString("oab"),
                        rs.getString("sobre"),
                        rs.getString("insta"),
                        rs.getString("linkedin"),
                        rs.getString("facebook"),
                        rs.getInt("idpessoa"),
                        rs.getString("cpfcnpj"),
                        rs.getString("nome"),
                        rs.getDate("datanascimento"),
                        oCidade,
                        rs.getString("login"),
                        rs.getString("senha"),
                        rs.getString("foto"));
                resultado.add(oAdv);
            }
        }catch(SQLException ex){
            System.out.println("Problemas ao listar Adv! Erro "+ex.getMessage());
        }
        return resultado;
    }

    public int verificarCpf(String cpf) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int idAdv = 0;
        String sql = "Select c.* from adv c, pessoa p "
                + "where c.idpessoa = p.idPessoa and p.cpfcnpj=?;";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, cpf);
            rs = stmt.executeQuery();
            while (rs.next()) {
                idAdv = rs.getInt("idAdv");
            }
            return idAdv;
        } catch (SQLException ex) {
            System.out.println("Problemas ai carregar adv! Erro: " + ex.getMessage());
            return idAdv;
        }
    }
}
