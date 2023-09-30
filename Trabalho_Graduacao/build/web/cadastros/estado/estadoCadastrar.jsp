<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>

<div class="tabelas-cadastro">
    <div class="card_table_cadastro">
        <div class="form-group" align="center">
            <h3>Cadastrar Estado</h3>
        </div>
        <div class="form-group">
            <input class="form-control" type="hidden" value="${estado.idEstado}" name="idestado" id="idestado" readonly="readonly"/>     
        </div>

        <div class="form-group">
            <label>Nome</label>
            <input class="form-control" type="text" value="${estado.nomeEstado}" name="nomeestado" id="nomeestado" />
        </div>

        <div class="form-group">
            <label>Sigla</label>
            <input class="form-control cep" type="text" name="siglaestado" id="siglaestado" value="${estado.siglaEstado}"/>
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
        if ($("#nomeestado").val() === '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o nome do Estado !',
                showConfirmButton: false,
                timer: 3000
            });
            $("#nomeestado").focus();
        } else if ($("#siglaestado").val() === '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a sigla!',
                showConfirmButton: false,
                timer: 3000
            });
            $("#siglaestado").focus();
        } else {
            gravarDados();
        }
    }

    function gravarDados() {
        console.log("Gravando Dados...");
        $.ajax({
            type: 'post',
            url: 'EstadoCadastrar',
            data: {
                idestado: $('#idestado').val(),
                nomeestado: $('#nomeestado').val(),
                siglaestado: $('#siglaestado').val()
            },
            success: function (data) {
                console.log("Resposta servlet->");
                console.log(data);
                if (data == 1) {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Sucesso',
                        text: 'Estado gravado com sucesso!',
                        showConfirmButton: true,
                        timer: 5000
                    });
                } else {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'Erro',
                        text: 'Não foi possível gravar o Estado!',
                        showConfirmButton: false,
                        timer: 5000
                    });
                }
                setTimeout(function() {window.location.href = "${pageContext.request.contextPath}/EstadoListar";}, 1500);
                
            },
            error: function (data) {
                setTimeout(function() {window.location.href = "${pageContext.request.contextPath}/EstadoListar";}, 1500);
            }
        });
    }
</script>
<!--<form name="cadastrarestado" action="EstadoCadastrar" method="POST">
    <table>
        <thead>
            <tr>
                <th colspan="2" align="center">
                    Cadastro de Estado
                </th>
            </tr>
            <tr>
                <th colspan="2" align="center">
                    ${mensagem}
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ID: </td>
                <td><input type="text" name="idestado" id="idestado" value="${estado.idEstado}" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>Nome: </td>
                <td><input type="text" name="nomeestado" id="nomeestado" value="${estado.nomeEstado}" size="50" maxlength="50"/></td>
            </tr>
            <tr>
                <td>Sigla: </td>
                <td><input type="text" name="siglaestado" id="siglaestado" value="${estado.siglaEstado}"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="cadastrar" id="cadastrar" value="Cadastrar"/>
                    <input type="reset" name="limpar" id="limpar" value="Limpar"/>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2"><h5><a href="index.jsp">Voltar à Página Inicial</a></h5></td>
            </tr>
        </tbody>
    </table>
</form>-->
<%@include file="/footer.jsp" %>