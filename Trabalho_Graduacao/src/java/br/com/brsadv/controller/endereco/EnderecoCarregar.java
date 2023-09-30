/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.brsadv.controller.endereco;

import br.com.brsadv.dao.CidadeDAO;
import br.com.brsadv.dao.EnderecoDAO;
import br.com.brsadv.dao.EstadoDAO;
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
@WebServlet(name = "EnderecoCarregar", urlPatterns = {"/EnderecoCarregar"})
public class EnderecoCarregar extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        try {
            int idEndereco = Integer.parseInt(request.getParameter("idendereco"));
            EnderecoDAO oEnderecoDAO = new EnderecoDAO();
            request.setAttribute("endereco", oEnderecoDAO.carregar(idEndereco));
            EstadoDAO oEstadoDAO = new EstadoDAO();
            request.setAttribute("estados", oEstadoDAO.listar());
            CidadeDAO oCidadeDAO = new CidadeDAO();
            request.setAttribute("cidade", oCidadeDAO.listar());
            request.getRequestDispatcher("/cadastros/enderecos/enderecosCadastrar.jsp").forward(request, response);
        } catch (Exception ex){
            System.out.println("Erro carregar endereço "+ex.getMessage());
            ex.printStackTrace();
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