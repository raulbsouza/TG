package br.com.brsadv.controller.cidade;

import br.com.brsadv.dao.CidadeDAO;
import br.com.brsadv.dao.GenericDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CidadeExcluir", urlPatterns = {"/CidadeExcluir"})
public class CidadeExcluir extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        int idCidade = Integer.parseInt(request.getParameter("idCidade"));
        String mensagem = null;
        try {
            GenericDAO dao = new CidadeDAO();
            if (dao.excluir(idCidade)) {
                mensagem = "Cidade excluido com Sucesso!";
            } else {
                mensagem = "Problemas ao excluir Cidade";
            }
            request.setAttribute("mensagem", mensagem);            
            response.sendRedirect("CidadeListar");
        } catch (Exception ex) {
            System.out.println("Problemas no Servelet ao excluir Cidade! Erro: "+ ex.getMessage());
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
