<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp"/>

<div class="tabelas">
    <div class="card_table"><h2>Estados</h2>
    <div>
        <table id="datatable" class="">
            <thead>
                <tr>
                    <th align="left">ID</th>
                    <th align="left">Nome</th>
                    <th align="left">Sigla</th>
                    <th align="rigth"></th>
                    <th align="rigth"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="estado" items="${estados}">
                    <tr>
                        <td align="left">${estado.idEstado}</td>
                        <td align="left">${estado.nomeEstado}</td>
                        <td align="left">${estado.siglaEstado}</td>
                        <td align="center">
                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/EstadoExcluir?idEstado=${estado.idEstado}">Excluir</a>
                        </td>
                        <td align="center">
                            <a  class="btn btn-success" href="${pageContext.request.contextPath}/EstadoCarregar?idEstado=${estado.idEstado}">Alterar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div align="center">
        <a class="btn btn-success" href="${pageContext.request.contextPath}/EstadoNovo">Novo</a>
        <a class="btn btn-secondary" href="index.jsp">Voltar à Páginca Inicial</a>
    </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        console.log('entrei ready');
        $('#datatable').DataTable({
            "oLanguage": {
                "sProcessing": "Processando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "Nenhum registro encontrado.",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                "sInfoFiltered": "",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "Primeiro",
                    "sPrevious": "Anterior",
                    "sNext": "Seguinte",
                    "sLast": "Ultimo"
                }
            }
        });
    });
</script>

<%@ include file="/footer-neutro.jsp" %>
