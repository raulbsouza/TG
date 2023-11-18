<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<div class="tabelas">
    <div class="card_table">
        <h2>Áreas</h2>
        <div class="tabela-listar">
            <table class="largura100">
                <thead >                        
                    <tr>
                        <th align="left">Nome</th>
                        <th align="rigth">Descrição</th>
                        <th align="rigth"></th>
                        <th align="rigth"></th>
                    </tr>
                </thead>                                 
                <tbody >
                    <c:forEach var="area" items="${area}">                    
                        <tr class="borda-top">
                            <th align="left" >${area.nomearea}</td>
                            <td align="left">${area.desc}</td>
                            <td>
                                <div class="col">
                                    <a href="#" id="deletar" title="Excluir" onclick="deletar(${area.idarea})">
                                        <button class="bt-amarelo">Excluir</button>
                                    </a>
                                </div>
                            </td>
                            <td>
                                <div class="col">
                                    <a href="${pageContext.request.contextPath}/AreaCarregar?idarea=${area.idarea}">
                                        <button class=" bt-amarelo"/>Alterar</button>
                                    </a>
                                </div>
                            </td>
                        </tr>                
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div align="center" class="col">        
            <a href="${pageContext.request.contextPath}/AreaNovo">
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
            confirmButtonText: 'Excluir Area',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/AreaExcluir',
                    data: {
                        idarea: id
                    },
                    success:
                            function (data) {
                                if (data == 1) {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'success',
                                        title: 'Sucesso',
                                        text: 'Area excluido com sucesso!',
                                        showConfirmButton: false,
                                        timer: 2000
                                    })
                                } else {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'error',
                                        title: 'ERRO',
                                        text: 'Não foi possivel excluir o Area',
                                        showConfimButton: false,
                                        timer: 2000
                                    })
                                }
                                setTimeout(function () {
                                    window.location.href = "${pageContext.request.contextPath}/AreaListar";
                                }, 1500);
                            }
                });
            }
            ;
        });
    }
</script>

<%@ include file="/footer-neutro.jsp" %>        
