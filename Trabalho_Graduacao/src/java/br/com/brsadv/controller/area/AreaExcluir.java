/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.brsadv.controller.area;

import br.com.brsadv.dao.AreaDAO;
import br.com.brsadv.dao.GenericDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aluno
 */
@WebServlet(name = "AreaExcluir", urlPatterns = {"/AreaExcluir"})
public class AreaExcluir extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=iso-8859-1");
        int idarea = Integer.parseInt(request.getParameter("idarea"));
        String mensagem = null;
        try {
            GenericDAO dao = new AreaDAO();
            if(dao.excluir(idarea)){
               response.getWriter().write("1");
           }else{
               response.getWriter().write("0");
           }
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao excluir Area! Erro: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
