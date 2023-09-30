package br.com.brsadv.model;

public class Adv {

    private int idadv;
    private String nome;
    private Area area;
    private String oab;
    private Endereco endereco;
    private String sobre;
    private String insta;
    private String linkedin;
    private String facebook;
    private String imagemadv;

    public Adv(int idadv, String nome, Area area, String oab, Endereco endereco, String sobre, String insta, String linkedin, String facebook, String imagemadv) {
        this.idadv = idadv;
        this.nome = nome;
        this.area = area;
        this.oab = oab;
        this.endereco = endereco;
        this.sobre = sobre;
        this.insta = insta;
        this.linkedin = linkedin;
        this.facebook = facebook;
        this.imagemadv = imagemadv;
    }

    
    
    public Adv() {
        this.idadv = 0;
        this.nome = "";
        this.area = new Area();
        this.oab = "";
        this.endereco = new Endereco();
        this.sobre = "";
        this.insta = "";
        this.linkedin = "";
        this.facebook = "";
    }

    public int getIdadv() {
        return idadv;
    }

    public void setIdadv(int idadv) {
        this.idadv = idadv;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
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

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public String getSobre() {
        return sobre;
    }

    public void setSobre(String sobre) {
        this.sobre = sobre;
    }

    public String getImagemadv() {
        return imagemadv;
    }

    public void setImagemadv(String imagemadv) {
        this.imagemadv = imagemadv;
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