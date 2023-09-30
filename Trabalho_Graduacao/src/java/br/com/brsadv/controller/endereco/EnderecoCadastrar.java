package br.com.brsadv.controller.endereco;

import br.com.brsadv.dao.CidadeDAO;
import br.com.brsadv.dao.EnderecoDAO;
import br.com.brsadv.dao.GenericDAO;
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
 * @author Aluno
 */
@WebServlet(name = "EnderecoCadastrar", urlPatterns = {"/EnderecoCadastrar"})
public class EnderecoCadastrar extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        
        int idEndereco = Integer.parseInt(request.getParameter("idendereco"));
        int estado = Integer.parseInt(request.getParameter("estado"));
        int cidade = Integer.parseInt(request.getParameter("cidade"));
        String rua = request.getParameter("rua");
        int numero = Integer.parseInt(request.getParameter("numero"));
        String mensagem = null;

        try{
            Endereco oEndereco = new Endereco();
            oEndereco.setIdendereco(idEndereco);
            oEndereco.setNumero(numero);
            oEndereco.setRua(rua);
            oEndereco.setCidade(new Cidade(cidade,"",(new Estado(estado,"","")),0));
            oEndereco.setEstado(new Estado(estado,"",""));
            
            GenericDAO dao = new EnderecoDAO();
            if (dao.cadastrar(oEndereco)) {
                response.getWriter().write("1");
            } else {
                response.getWriter().write("0");
            }
        } catch (Exception ex){
             System.out.println("Problemas no Servlet ao cadastrar Endereço! Erro: " + ex.getMessage());
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