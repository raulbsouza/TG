package br.com.brsadv.controller.estado;

import br.com.brsadv.dao.EstadoDAO;
import br.com.brsadv.dao.GenericDAO;
import br.com.brsadv.model.Estado;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EstadoCadastrar", urlPatterns = {"/EstadoCadastrar"})
public class EstadoCadastrar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html/charset=iso8859-1");
        int idEstado = Integer.parseInt(request.getParameter("idestado"));
        String nomeEstado = request.getParameter("nomeestado");
        String siglaEstado = request.getParameter("siglaestado");
        String mensagem = null;
        
        Estado oEstado = new Estado();
        oEstado.setIdEstado(idEstado);
        oEstado.setNomeEstado(nomeEstado);
        oEstado.setSiglaEstado(siglaEstado);
        try {
            GenericDAO dao = new EstadoDAO();
            if (dao.cadastrar(oEstado)){
                mensagem = "Estado cadastado com Sucesso!";
            }
            else{
                mensagem = "Problemas ao cadastar Estado. Verifique os dados informados e tente novamente";
            }
            request.setAttribute("mensagem", mensagem);
            response.sendRedirect("EstadoListar");
        }catch (Exception ex){
            System.out.println("Problemas no Servlet ao cadastrar Estado! Erro: "+ex.getMessage());
            
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
