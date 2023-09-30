<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>

<div class="tabelas">
    <div class="card_table_adv" align="center">
        <div class="section-title" align="left">
            <h2>Equipe</h2>
        </div>
        <div class="tabela-listar-adv" align="left">
            <table>
                <c:forEach var="adv" items="${adv}">
                    <tr>
                    <div class="flex-box">
                        <div class="flex_img"><img src="${adv.imagemadv}" class="img_listar"></div>
                        <div class="flex_text">
                            ${adv.nome}<br/>
                            Advogado ${adv.area.nomearea}<br/>
                            ${adv.sobre}<br/>
<!--                            Rua: ${adv.endereco.rua},${adv.endereco.numero}<br/>${adv.endereco.cidade.nomeCidade}-${adv.endereco.estado.siglaEstado}<br/>-->
                            <a href="#" id="deletar" title="Excluir" onclick="deletar(${adv.idadv})">
                                <button class="bt-amarelo">Excluir</button>
                            </a>
                            <a href="${pageContext.request.contextPath}/AdvCarregar?idadv=${adv.idadv}">
                                <button class=" bt-amarelo"/>Alterar</button>
                            </a>
                        </div>
                    </div>
                    </tr>
                </c:forEach>
            </table>





            <!--            <table  class="largura100">
            <c:forEach var="adv" items="${adv}">                    
                <tr class="borda-bot">
                    <th align="left" ><img src="${pageContext.request.contextPath}/img/adv-1.png" class="img_listar"></th>
                    <th align="left" style="color: white;">
                        <div>${adv.nome}</div>
                        <div>Advogado ${adv.area.nomearea}</div>
                        <div>${adv.sobre}</div>
                        <div>Rua: ${adv.endereco.rua},${adv.endereco.numero}${adv.endereco.cidade.nomeCidade}-${adv.endereco.estado.siglaEstado}</div>
                    </th>
                </tr>                
            </c:forEach>
        </table>-->








            <!--                            <td>
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
                                        </td>-->



        </div>
        <div align="center" class="col">        
            <a href="${pageContext.request.contextPath}/AdvNovo">
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
            confirmButtonText: 'Excluir Adv',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/AdvExcluir',
                    data: {
                        idadv: id
                    },
                    success:
                            function (data) {
                                if (data == 1) {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'success',
                                        title: 'Sucesso',
                                        text: 'Adv excluido com sucesso!',
                                        showConfirmButton: false,
                                        timer: 2000
                                    })
                                } else {
                                    Swal.fire({
                                        position: 'top-center',
                                        icon: 'error',
                                        title: 'ERRO',
                                        text: 'Não foi possivel excluir o Adv',
                                        showConfimButton: false,
                                        timer: 2000
                                    })
                                }
                                setTimeout(function () {
                                    window.location.href = "${pageContext.request.contextPath}/AdvListar";
                                }, 1500);
                            }
                });
            }
            ;
        });
    }
</script>

<%@ include file="/footer-neutro.jsp" %>        
