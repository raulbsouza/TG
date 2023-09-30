package br.com.brsadv.controller.area;

import br.com.brsadv.dao.AreaDAO;
import br.com.brsadv.dao.GenericDAO;
import br.com.brsadv.model.Area;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AreaCadastrar", urlPatterns = {"/AreaCadastrar"})
public class AreaCadastrar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html/charset=iso8859-1");
        int idarea = Integer.parseInt(request.getParameter("idarea"));
        String nomearea = request.getParameter("nomearea");
        String desc = request.getParameter("desc");
        String mensagem = null;

        Area oArea = new Area();
        oArea.setIdarea(idarea);
        oArea.setNomearea(nomearea);
        oArea.setDesc(desc);
        try {
            GenericDAO dao = new AreaDAO();
            if (dao.cadastrar(oArea)) {
                response.getWriter().write("1");
            } else {
                response.getWriter().write("0");
            }
        } catch (Exception ex) {
            System.out.println("Problemas no Servlet ao cadastrar Area! Erro: " + ex.getMessage());

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
