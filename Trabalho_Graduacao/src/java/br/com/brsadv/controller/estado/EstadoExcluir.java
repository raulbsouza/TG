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

@WebServlet(name = "EstadoExcluir", urlPatterns = {"/EstadoExcluir"})
public class EstadoExcluir extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        int idEstado = Integer.parseInt(request.getParameter("idEstado"));
        String mensagem = null;
        try {
            GenericDAO dao = new EstadoDAO();
            if(dao.excluir(idEstado)){
               response.getWriter().write("1");
           }else{
               response.getWriter().write("0");
           }
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao excluir Estado! Erro: " + ex.getMessage());
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
