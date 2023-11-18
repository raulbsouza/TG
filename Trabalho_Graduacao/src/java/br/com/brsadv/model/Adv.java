
package br.com.brsadv.model;

import br.com.brsadv.utils.Conversao;
import java.text.ParseException;
import java.util.Date;

public class Adv extends Pessoa{
    private int idAdv;
    private String permiteLogin;
    private String situacao;
    private Area area;
    private String oab;
    private String sobre;
    private String insta;
    private String linkedin;
    private String facebook;

   public Adv(int idAdv, String permiteLogin, String situacao, Area area, String oab, String sobre, String insta, String linkedin, String facebook, int idPessoa, String cpfCnpj, String nome, Date dataNascimento, Cidade cidade, String login, String senha, String foto) {
        super(idPessoa, cpfCnpj, nome, dataNascimento, cidade, login, senha, foto);
        this.idAdv = idAdv;
        this.permiteLogin = permiteLogin;
        this.situacao = situacao;
        this.area = area;
        this.oab = oab;
        this.sobre = sobre;
        this.insta = insta;
        this.linkedin = linkedin;
        this.facebook = facebook;
    }
   public static Adv advogadoVazio() throws ParseException {
        Cidade oCidade = new Cidade();
        Date dataNascimento = Conversao.dataAtual();
        Adv oAdvogados = new Adv(0, "S", "A", new Area(), "", "", "", "", "", 0, "", "", dataNascimento, oCidade, "", "", null);
        return oAdvogados;
    }

    public int getIdAdv() {
        return idAdv;
    }

    public void setIdAdv(int idAdv) {
        this.idAdv = idAdv;
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

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public String getOab() {
        return oab;
    }

    public void setOab(String oab) {
        this.oab = oab;
    }

    public String getSobre() {
        return sobre;
    }

    public void setSobre(String sobre) {
        this.sobre = sobre;
    }

    public String getInsta() {
        return insta;
    }

    public void setInsta(String insta) {
        this.insta = insta;
    }

    public String getLinkedin() {
        return linkedin;
    }

    public void setLinkedin(String linkedin) {
        this.linkedin = linkedin;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

 

}
