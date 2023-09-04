<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Despesas</h1>
    <p class="mb-4">Planilha de Registros</p>

    <a class="btn btn-success mb-4" href="${pageContext.request.contextPath}/DespesaNovo">
        <i class="fas fa-sticky-note"></i>
        <strong>Novo</strong>
    </a>

    <div class="card shadow">
        <div class="card-body">
            <table id="datatable" class="display">
                <thead>
                    <tr>
                        <td align="rigth" >ID</td>
                        <td align="left" >Descrição</td>
                        <td align="center" >Data</td>
                        <td align="rigth" >ValorDespesa</td>
                        <td align="rigth" >ValorPago</td>
                        <td align="center" >Excluir</td>
                        <td align="center" >Alterar</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="despesas" items="${despesas}">
                        <tr>
                            <td align="rigth">${despesas.idDespesa}</td>
                            <td align="left">${despesas.descricao}</td>
                            <td align="left"><fmt:formatDate pattern="dd/MM/yyyy" value="${despesas.dataDocumento}"/></td>
                            <td align="rigth"><fmt:formatNumber value="${despesas.valorDespesa}" type="currency"/></td>
                            <td align="rigth"><fmt:formatNumber value="${despesas.valorPago}" type="currency"/></td>
                            <td>
                                <a class="btn btn-danger" href="#" id="deletar" title="Excluir" onclick="deletar(${despesas.idDespesa})">
                                    Excluir
                                </a>
                            </td>
                            <td align="center">
                                <a class="btn btn-success" href="${pageContext.request.contextPath}/DespesaCarregar?idDespesa=${despesas.idDespesa}">
                                    Alterar
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        console.log('entrei ready');
        $('#datatable').DataTable({
            "oLanguage": {
                "sProcessing": "Processando...",
                "sLengthMenu": "Mostrar _MENU_ resgistros",
                "sZeroRecords": "Nenhum registro encontrado.",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                "sInfoFiltered": "",
                "sInfoPostFix": "",
                "sSearch": "Buscar: ",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "Primeiro",
                    "sPrevious": "Anteior",
                    "sNext": "Seguinte",
                    "sLast": "Último"
                }
            }
        });
    });
    function deletar(codigo) {
        var id = codigo;
        console.log(codigo);
        Swal.fire({
            title: 'Você tem certeza?',
            text: "Você não poderá recuperar depois!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sim, apague a despesa!',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/DespesaExcluir',
                    data: {
                        idDespesa: id
                    },
                    success:
                            function (data) {
                                if (data == 1) {
                                    Swal.fire({
                                        position: 'top-end',
                                        icon: 'success',
                                        title: 'Sucesso',
                                        text: 'Despesa excluída com sucesso!',
                                        showConfirmButton: false,
                                        timer: 2000
                                    })
                                } else {
                                    Swal.fire({
                                        position: 'top-end',
                                        icon: 'error',
                                        title: 'ERRO',
                                        text: 'Não foi possivel excluir a despesa',
                                        showConfimButton: false,
                                        timer: 2000
                                    })
                                }
                                window.location.href = "${pageContext.request.contextPath}/DespesaListar";
                            }
                });
            }
            ;
        });
    }
</script>

<%@include file="/footer.jsp" %>