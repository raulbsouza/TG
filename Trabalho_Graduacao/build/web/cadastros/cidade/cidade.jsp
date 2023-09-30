<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<div class="tabelas">
    <div class="card_table">
        <h2>Cidades</h2>
        <div class="tabela-listar">
            <table class="largura100">
                <thead >                        
                    <tr>
                        <th align="left" ><div >ID</div></th>                    
                        <th align="left">Cidade</th>
                        <th align="left">Estado</th>
                        <th align="left">Cep</th>
                        <th align="right"></th>
                        <th align="right"></th>
                    </tr>
                </thead>                                 
                <tbody >
                    <c:forEach var="cidade" items="${cidades}">                    
                        <tr class="borda-top">
                            <td  align="left">${cidade.idCidade}</td>                    
                            <td  align="left">${cidade.nomeCidade}</td>
                            <td  align="left">${cidade.estado.siglaEstado}</td>
                            <td  align="left" class="cep" name="cep">${cidade.cep}</td>

                            <td align="center" >
                                <a href="#" id="deletar" title="Excluir" onclick="deletar(${cidade.idCidade})">
                                    <button class="bt-amarelo">Excluir</button>
                                </a>
                            </td>
                            <td align="center" >
                                <a href="${pageContext.request.contextPath}/CidadeCarregar?idCidade=${cidade.idCidade}">
                                    <button class=" bt-amarelo"/>Alterar</button>
                                </a>
                            </td>
                        </tr>                
                    </c:forEach>
                </tbody>

            </table>
        </div>
        <div align="center" class="col">        
            <a href="${pageContext.request.contextPath}/CidadeNovo">
                <button class="align-button bt-amarelo-down">Novo</button>
            </a>
            <a href="index.jsp" >
                <button class="align-buttopn bt-amarelo-down">Voltar à Página Inicial</button>
            </a>
        </div>        
    </div>
</div>

<script>
    $(document).ready(function () {

        $('.cep').mask('00000-000');
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
            confirmButtonText: 'Apagar Cidade!',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/CidadeExcluir',
                    data: {
                        idCidade: id
                    },
                    success:
                            function (data) {
                                if (data == 1) {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'success',
                                        title: 'Sucesso',
                                        text: 'Cidade excluída com sucesso!',
                                        showConfirmButton: false,
                                        timer: 2000
                                    })
                                } else {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'error',
                                        title: 'ERRO',
                                        text: 'Não foi possivel excluir a cidade',
                                        showConfimButton: false,
                                        timer: 2000
                                    })
                                }
                                setTimeout(function() {window.location.href = "${pageContext.request.contextPath}/CidadeListar";}, 1500);
                            }
                });
            }
            ;
        });
    }
</script>



<%@ include file="/footer-neutro.jsp" %>        
