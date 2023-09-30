
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<div class="tabelas">
    <div class="card_table">
        <h2>Estados</h2>
        <div class="tabela-listar">
            <table class="largura100">
                <thead >                        
                    <tr>
                        <th align="left">ID</th>
                        <th align="left">Nome</th>
                        <th align="left">Sigla</th>
                        <th align="rigth"></th>
                        <th align="rigth"></th>
                    </tr>
                </thead>                                 
                <tbody >
                    <c:forEach var="estado" items="${estados}">                    
                        <tr class="borda-top">
                            <td align="left">${estado.idEstado}</td>
                            <td align="left">${estado.nomeEstado}</td>
                            <td align="left">${estado.siglaEstado}</td>
                            <td align="center" >
                                  <a href="#" id="deletar" title="Excluir" onclick="deletar(${estado.idEstado})">
                                    <button class="bt-amarelo">Excluir</button>
                                </a>
                            </td>
                            <td align="center" >
                                <a href="${pageContext.request.contextPath}/EstadoCarregar?idEstado=${estado.idEstado}">
                                    <button class=" bt-amarelo"/>Alterar</button>
                                </a>
                            </td>
                        </tr>                
                    </c:forEach>
                </tbody>

            </table>
        </div>
        <div align="center" class="col">        
            <a href="${pageContext.request.contextPath}/EstadoNovo">
                <button class="align-button bt-amarelo-down">Novo</button>
            </a>
            <a href="index.jsp" >
                <button class="align-buttopn bt-amarelo-down">Voltar à Página Inicial</button>
            </a>
        </div>        
    </div>
</div>
<script>
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
            confirmButtonText: 'Excluir Estado',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/EstadoExcluir',
                    data: {
                        idEstado: id
                    },
                    success:
                            function (data) {
                                if (data == 1) {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'success',
                                        title: 'Sucesso',
                                        text: 'Estado excluido com sucesso!',
                                        showConfirmButton: false,
                                        timer: 2000
                                    })
                                } else {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'error',
                                        title: 'ERRO',
                                        text: 'Não foi possivel excluir o estado',
                                        showConfimButton: false,
                                        timer: 2000
                                    })
                                }
                                setTimeout(function() {window.location.href = "${pageContext.request.contextPath}/EstadoListar";}, 1500);
                            }
                });
            }
            ;
        });
    }
</script>

<%@ include file="/footer-neutro.jsp" %>        
