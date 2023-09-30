/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.brsadv.controller.advogados;

import br.com.brsadv.dao.AdvDAO;
import br.com.brsadv.model.Adv;
import br.com.brsadv.model.Area;
import br.com.brsadv.model.Cidade;
import br.com.brsadv.model.Endereco;
import br.com.brsadv.model.Estado;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raul
 */
@WebServlet(name = "AdvCadastrar", urlPatterns = {"/AdvCadastrar"})
public class AdvCadastrar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        int area = Integer.parseInt(request.getParameter("area"));
        String mesagem = null;
        try {
            Adv oAdv = new Adv();
            oAdv.setIdadv(Integer.parseInt(request.getParameter("idadv")));
            oAdv.setSobre(request.getParameter("sobre"));
            oAdv.setOab(request.getParameter("oab"));
            oAdv.setNome(request.getParameter("nome"));
            oAdv.setInsta(request.getParameter("insta"));
            oAdv.setLinkedin(request.getParameter("linkedin"));
            oAdv.setFacebook(request.getParameter("facebook"));
            oAdv.setImagemadv(request.getParameter("imagemadv"));

//            oAdv.setEndereco(new Endereco(endereco,(new Estado(0,"","")),(new Cidade(0,"",(new Estado(0,"","")),0)),"",0));

            oAdv.setArea(new Area(area, "", ""));

            AdvDAO dao = new AdvDAO();

            if (dao.cadastrar(oAdv)) {
                response.getWriter().write("1");
            } else {
                response.getWriter().write("0");
            }
        } catch (Exception e) {
            System.out.println("Problemas no servlet ao Cadastrar Advogado! Erro: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
