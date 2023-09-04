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

@WebServlet(name = "EstadoListar", urlPatterns = {"/EstadoListar"})
public class EstadoListar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        try{
        
            GenericDAO dao = new EstadoDAO();
            request.setAttribute("estados", dao.listar());
            request.getRequestDispatcher("/cadastros/estado/estado.jsp").forward(request, response);
        
        }catch (Exception ex){
        
            System.out.println("Problemas no Servlet ao listar" +" Estados! Erro: "+ex.getMessage());
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
