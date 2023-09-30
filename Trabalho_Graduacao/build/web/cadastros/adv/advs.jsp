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
                            <h3>${adv.nome}</h3>
                            <h6>Advogado(a) ${adv.area.nomearea}</h6><br/>
                            ${adv.sobre}<br/><br/>
                            <a href="${adv.facebook}" target="_blank"><i class="bi bi-facebook redes_sociais"></i><label class="redes_sociais">&nbsp;Facebook</label></a><br/>
                            <a href="${adv.insta}" target="_blank"><i class="bi bi-instagram redes_sociais"></i><label class="redes_sociais">&nbsp;Instagram</label></a><br/>
                            <a href="${adv.linkedin}" target="_blank"><i class="bi bi-linkedin redes_sociais"></i><label class="redes_sociais">&nbsp;Linkedin</label></a>

                        </div>
                    </div>
                    </tr>
                </c:forEach>
            </table>
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





<!-- Comentarios -->



<!--<div align="center" class="col">        
        <a href="${pageContext.request.contextPath}/AdvNovo">
            <button class="align-button bt-amarelo-down">Novo</button>
        </a>
        <a href="index.jsp" >
            <button class="align-buttopn bt-amarelo-down">Voltar à Página Inicial</button>
        </a>
    </div>        -->



<!--<td>
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




            <!-- Rua: ${adv.endereco.rua},${adv.endereco.numero}<br/>${adv.endereco.cidade.nomeCidade}-${adv.endereco.estado.siglaEstado}-->




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