<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<jsp:include page="/header.jsp"/>

<div class="tabelas-cadastro">
    <div class="card_table_cadastro">
        <div class="form-group" align="center">
            <h3>Cadastrar Endereço</h3>
        </div>


        <div class="form-group">
            <input class="form-control" type="hidden" value="${endereco.idendereco}" name="idendereco" id="idendereco" readonly="readonly"/>     
        </div>

        <div class="form-group">

            <label>Estado</label>
            <select name="estado" id="estado" class="form-control" >

                <option value="">Selecione </option>
                <c:forEach var="estado" items="${estados}">
                    <option value="${estado.idEstado}" 
                            ${endereco.estado.idEstado == estado.idEstado ? "selected" : ""}>
                        ${estado.nomeEstado}
                    </option>
                </c:forEach>

            </select>
        </div>

        <div class="form-group">
            <label>Cidade</label>
            <select name="cidade" id="cidade" class="form-control">
                <option value="">Selecione</option>
                <c:forEach var="cidade" items="${cidade}">
                    <option value="${cidade.idCidade}" 
                            ${endereco.cidade.idCidade == cidade.idCidade ? "selected" : ""}>
                        ${cidade.nomeCidade}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Rua</label>
            <input class="form-control cep" type="text" name="rua" id="rua" value="${endereco.rua}"/>
        </div>

        <div class="form-group">
            <label>Numero</label>
            <input class="form-control cep" type="text" name="numero" id="numero" value="${endereco.numero}"/>
        </div>
        <div class="form-group"  align="center">
            <button class="bt-amarelo-down" type="button" id="submit" onclick="validarCampos()">Cadastrar</button>
        </div>
        


    </div>                 
</div>

<script>
    $(document).ready(function () {
        console.log("Entrei na ready do documento");
    });

    function validarCampos() {
        console.log("Entrei na validação de campos");
        if ($("#rua").val() === '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o nome da Cidade !',
                showConfirmButton: false,
                timer: 3000
            });
            $("#rua").focus();
        } else if ($("#numero").val() === '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o cep!',
                showConfirmButton: false,
                timer: 3000
            });
            $("#numero").focus();
        } else {
            gravarDados();
        }
    }

    function gravarDados() {
        console.log("Gravando Dados...");
        $.ajax({
            type: 'post',
            url: 'EnderecoCadastrar',
            data: {
                idendereco: $('#idendereco').val(),
                estado: $('#estado').val(),
                cidade: $('#cidade').val(),
                rua: $('#rua').val(),
                numero: $('#numero').val()
            },
            success: function (data) {
                console.log("Resposta servlet->");
                console.log(data);
                if (data == 1) {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Sucesso',
                        text: 'Endereço gravado com sucesso!',
                        showConfirmButton: true,
                        timer: 5000
                    });
                } else {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'Erro',
                        text: 'Não foi possível gravar Endereço!',
                        showConfirmButton: false,
                        timer: 5000
                    });
                }
                setTimeout(function () {
                    window.location.href = "${pageContext.request.contextPath}/EnderecoListar";
                }, 1500);

            },
            error: function (data) {
                setTimeout(function () {
                    window.location.href = "${pageContext.request.contextPath}/EnderecoListar";
                }, 1500);
            }
        });
    }
</script>

<%@ include file="/footer-neutro.jsp" %>
