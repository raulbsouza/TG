<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>

<div class="tabelas-cadastro">
    <div class="card_table_cadastro">
        <div class="form-group" align="center">
            <h3>Cadastrar Area</h3>
        </div>
        <div class="form-group">
            <input class="form-control" type="hidden" value="${area.idarea}" name="idarea" id="idarea" />     
        </div>

        <div class="form-group">
            <label>Nome</label>
            <input class="form-control" type="text" value="${area.nomearea}" name="nomearea" id="nomearea" />
        </div>

        <div class="form-group">
            <label>Descrição</label>
            <input class="form-control cep" type="text" name="desc" id="desc" value="${area.desc}"/>
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
        if ($("#nomearea").val() === '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o nome da Area !',
                showConfirmButton: false,
                timer: 3000
            });
            $("#nomearea").focus();
        } else if ($("#desc").val() === '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a Descrição!',
                showConfirmButton: false,
                timer: 3000
            });
            $("#desc").focus();
        } else {
            gravarDados();
        }
    }

    function gravarDados() {
        console.log("Gravando Dados...");
        $.ajax({
            type: 'post',
            url: 'AreaCadastrar',
            data: {
                idarea: $('#idarea').val(),
                nomearea: $('#nomearea').val(),
                desc: $('#desc').val()
            },
            success: function (data) {
                console.log("Resposta servlet->");
                console.log(data);
                if (data == 1) {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Sucesso',
                        text: 'Area gravada com sucesso!',
                        showConfirmButton: true,
                        timer: 5000
                    });
                } else {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'Erro',
                        text: 'Não foi possível gravar a Area!',
                        showConfirmButton: false,
                        timer: 5000
                    });
                }
                setTimeout(function() {window.location.href = "${pageContext.request.contextPath}/AreaListar";}, 1500);
                
            },
            error: function (data) {
                setTimeout(function() {window.location.href = "${pageContext.request.contextPath}/AreaListar";}, 1500);
            }
        });
    }
</script>
<%@include file="/footer.jsp" %>