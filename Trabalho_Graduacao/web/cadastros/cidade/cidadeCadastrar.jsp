<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<jsp:include page="/header.jsp"/>

<div class="tabelas-cadastro">
    <div class="card_table_cadastro">
        <div class="form-group" align="center">
            <h3>Cadastrar Cidade</h3>
        </div>
        <div class="form-group">
            <input class="form-control" type="hidden" value="${cidade.idCidade}" name="idcidade" id="idcidade" readonly="readonly"/>     
        </div>

        <div class="form-group">
            <label>Nome</label>
            <input class="form-control" type="text" value="${cidade.nomeCidade}" name="nomecidade" id="nomecidade" />
        </div>

        <div class="form-group">
            <label>Cep</label>
            <input class="form-control cep" type="text" name="cep" id="cep" value="${cidade.cep}"/>
        </div>

        <div class="form-group">
            <label>Estado</label>
            <select name="idestado" id="idestado" class="form-control">
                <option value="">Selecione</option>
                <c:forEach var="estado" items="${estados}">
                    <option value="${estado.idEstado}" 
                            ${cidade.estado.idEstado == estado.idEstado ? "selected" : ""}>
                        ${estado.nomeEstado}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group"  align="center">
            <button class="bt-amarelo-down" type="button" id="submit" onclick="validarCampos()">Salvar Documento</button>
        </div>
    </div>                 
</div>

<script>
    $(document).ready(function () {
        console.log("Entrei na ready do documento");
    });

    function validarCampos() {
        console.log("Entrei na validação de campos");
        if ($("#nomecidade").val() === '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o nome da Cidade !',
                showConfirmButton: false,
                timer: 3000
            });
            $("#nomecidade").focus();
        } else if ($("#cep").val() === '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o cep!',
                showConfirmButton: false,
                timer: 3000
            });
            $("#cep").focus();
        } else {
            gravarDados();
        }
    }

    function gravarDados() {
        console.log("Gravando Dados...");
        $.ajax({
            type: 'post',
            url: 'CidadeCadastrar',
            data: {
                idcidade: $('#idcidade').val(),
                nomecidade: $('#nomecidade').val(),
                cep: $('#cep').val(),
                idestado: $('#idestado').val()
            },
            success: function (data) {
                console.log("Resposta servlet->");
                console.log(data);
                if (data == 1) {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Sucesso',
                        text: 'Cidade gravada com sucesso!',
                        showConfirmButton: true,
                        timer: 5000
                    });
                } else {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'Erro',
                        text: 'Não foi possível gravar a Cidade!',
                        showConfirmButton: false,
                        timer: 5000
                    });
                }
                setTimeout(function() {window.location.href = "${pageContext.request.contextPath}/CidadeListar";}, 1500);
                
            },
            error: function (data) {
                setTimeout(function() {window.location.href = "${pageContext.request.contextPath}/CidadeListar";}, 1500);
            }
        });
    }
</script>

<%@ include file="/footer-neutro.jsp" %>
