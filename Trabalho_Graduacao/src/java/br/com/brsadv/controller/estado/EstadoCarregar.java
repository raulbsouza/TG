package br.com.brsadv.controller.estado;

import br.com.brsadv.dao.EstadoDAO;
import br.com.brsadv.dao.GenericDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EstadoCarregar", urlPatterns = {"/EstadoCarregar"})
public class EstadoCarregar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        int idEstado = Integer.parseInt(request.getParameter("idEstado"));
        try {
            GenericDAO dao = new EstadoDAO();
            request.setAttribute("estado", dao.carregar(idEstado));
            request.getRequestDispatcher("cadastros/estado/estadoCadastrar.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Problemas na servlet carregar despesa! Erro: " + e.getMessage());
            e.printStackTrace();
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
