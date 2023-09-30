package br.com.brsadv.model;

public class Area {

    private int idarea;
    private String nomearea;
    private String desc;

    public Area(int idarea, String nomearea, String desc) {
        this.idarea = idarea;
        this.nomearea = nomearea;
        this.desc = desc;
    }

    public Area() {
        this.idarea = 0;
        this.nomearea = "";
        this.desc = "";
    }

    public int getIdarea() {
        return idarea;
    }

    public void setIdarea(int idarea) {
        this.idarea = idarea;
    }

    public String getNomearea() {
        return nomearea;
    }

    public void setNomearea(String nomearea) {
        this.nomearea = nomearea;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

}
