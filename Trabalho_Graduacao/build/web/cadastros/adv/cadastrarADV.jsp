<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<div class="tabelas">
    <div class="container-fluid card_table" >

        <h1 align="center" class="h3 mb-2 text-gray-800">Cadastrar Advogado</h1>
        <br/>

<!--    <a class="btn btn-secondary mb-4" href="${pageContext.request.contextPath}/DespesaListar">
        <i class="fas fa-undo-alt"></i>
        <strong>Voltar</strong>
    </a>-->
        <div class="column-gap-0">

            <div class="col">
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="form-group">
                            <center>

                                <img alt="imagem" class="img-thumbnail"
                                     src="${adv.imagemadv}"
                                     name="target" id="target" width="170" height="200">
                                <br/>
                                <input type="file" id="gallery-photo-add"
                                       class="inputfile" onchange="uploadFile();"/><br/>
                                <label for="gallery-photo-add" class="bt-amarelo-down">
                                    <i class="fas fa-file-upload"></i>
                                    Selecionar Foto                                
                                </label>

                            </center>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column-gap-0">
                <div class="card shadow mb-4">
                    <div class="card-body">

                        <div class="form-group">

                            <input class="form-control" type="hidden" value="${adv.idadv}" name="idadv" id="idadv" readonly="readonly"/>                     

                        </div>
                        <div class="form-group">
                            <div class="form-line row">

                                <div class="col-sm">
                                    <label>Nome</label>
                                    <input class="form-control" type="text" style="text-align: rigth;"
                                           name="nome" id="nome" 
                                           value="${adv.nome}"/>
                                </div>

                                <div class="col-sm">

                                    <label>OAB</label>
                                    <input class="form-control" type="text" name="oab" id="oab" value="${adv.oab}"/>

                                </div>

                                <!--                                <div class="col-sm">
                                                                    <label>Valor Pago</label>
                                                                    <input class="form-control" type="text" style="text-align: rigth;"
                                                                           name="valorpago" id="valorpago" 
                                                                           value="<fmt:formatNumber value='${despesa.valorPago}' type='currency'/>"/>
                                                                </div>-->

                                <!--                                                                <div class="col-sm">
                                                                                                    <label>Selecionar area principal</label>
                                                                                                    <select name="area" id="area">
                                                                                                        <option value="">Selecione</option>
                                <c:forEach var="endereco" items="${endereco}">
                                    <option value="${endereco.idendereco}" 
                                    ${adv.endereco.idendereco == endereco.idendereco ? "selected" : ""}>
                                    ${endereco.cidade}${endereco.rua}${endereco.numero}
                                </option>
                                </c:forEach>
                            </select>
                        </div>-->
                                <div class="col-sm">
                                    <div class="form-group">
                                        <label>Area</label>
                                        <select name="area" id="area" class="form-control">
                                            <option value="">Selecione</option>
                                            <c:forEach var="area" items="${area}">
                                                <option value="${area.idarea}" 
                                                        ${adv.area.idarea == area.idarea ? "selected" : ""}>
                                                    ${area.nomearea}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">

                            <label>Sobre</label>
                            <input class="form-control" type="text" value="${adv.sobre}" name="sobre" id="sobre" size="100" maxlength="100"/>

                        </div>
                        <div class="form-line row">
                            <div class="col-sm">
                                <label> <i class="bi bi-instagram"></i> Instagram</label>
                                <input class="form-control" type="text" style="text-align: rigth;"
                                       name="insta" id="insta" 
                                       value="${adv.insta}"/>
                            </div><div class="col-sm">
                                <label><i class="bi bi-facebook"></i> Facebook</label>
                                <input class="form-control" type="text" style="text-align: rigth;"
                                       name="facebook" id="facebook" 
                                       value="${adv.facebook}"/>
                            </div><div class="col-sm">
                                <label><i class="bi bi-linkedin"></i> Linkedin</label>
                                <input class="form-control" type="text" style="text-align: rigth;"
                                       name="linkedin" id="linkedin" 
                                       value="${adv.linkedin}"/>
                            </div>
                        </div>
                        <br/>
                        <div class="form-group" align="center">
                            <button class="bt-amarelo-down" type="submit" id="submit" onclick="validarCampos()">Salvar Documento</button>
                        </div> 

                    </div>                 
                </div>                 
            </div>   
        </div>
    </div>
</div> 
<style type="text/css">
    .inputfile{
        width: 0.1px;
        height: 0.1px;
        opacity: 0;
        overflow: hidden;
        position: absolute;
        z-index: -1;
    }
    .inputfile:focus + label{
        outline: 1px dotted #000;
        outline: -webkit-focus-ring-color auto 5px;
    }
    .inputfile + label * {
        pointer-events: none;
    }
    .borda{
        position: relative;
        margin: 0 20px 30px 0;
        padding: 10px;
        border: 1px solid #e1e1e1;
        border-radius: 3px;
        background: #fff;
        -webkit-box-shadow: 0px 0px 3px rgba(0,0,0,0.06);
        -moz-box-shadow:0px 0px 3px rgba(0,0,0,0.06);
        box-shadow: 0px 0px 3px rgba(0,0,0,0.06);
    }
</style>
<script>
    $(document).ready(function () {
        console.log("Entrei na ready do documento");
        $("#valordespesa").maskMoney({
            prefix: 'R$',
            suffix: '',
            allowZero: false,
            allowNegative: true,
            allowEmpty: false,
            doubleClickSelection: true,
            selectAllOnFocus: true,
            thousands: '.',
            decimal: ',',
            precision: 2,
            affixesStay: true,
            bringCareAtEndOnFocus: true
        })

        $("#valorpago").maskMoney({
            prefix: 'R$',
            suffix: '',
            allowZero: false,
            allowNegative: true,
            allowEmpty: false,
            doubleClickSelection: true,
            selectAllOnFocus: true,
            thousands: '.',
            decimal: ',',
            precision: 2,
            affixesStay: true,
            bringCareAtEndOnFocus: true
        })
    })

    function validarCampos() {
        console.log("Entrei na validação de campos");
        if (document.getElementById("nome").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o nome !',
                showCopnfirmButton: false,
                timer: 1000
            });
            $("#nome").focus();
        } else if (document.getElementById("oab").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a OAB !',
                showConfirmButton: false,
                timer: 1000
            });
            $("#oab").focus();
        } else if (document.getElementById("area").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a area !',
                showConfirmButton: false,
                timer: 1000
            });
            $("#area").focus();
        }else {
            gravarDados();
        }

    }

    function gravarDados() {
        console.log("Gravando Dados...");
        var target = document.getElementById("target").src;
        $.ajax({
            type: 'post',
            url: 'AdvCadastrar',
            data: {
                idadv: $('#idadv').val(),
                nome: $('#nome').val(),
                oab: $('#oab').val(),
                area: $('#area').val(),
                sobre: $('#sobre').val(),
                insta: $('#insta').val(),
                facebook: $('#facebook').val(),
                linkedin: $('#linkedin').val(),
                imagemadv: target
            },
            success: function (data) {
                console.log("Resposta servlet->");
                console.log(data);
                if (data == 1) {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Sucesso',
                        text: 'Advogado gravado com sucesso!',
                        showConfirmButton: false,
                        timer: 5000
                    })
                } else {
                    Swal.fire({
                        position: 'center',
                        icon: 'error',
                        title: 'Erro',
                        text: 'Não foi possivel gravar Advogado!',
                        showConfirmButton: false,
                        timer: 5000
                    })
                }
                window.location.href = "${pageContext.request.contextPath}/AdvListar";
            },
            error: function (data) {
                window.location.href = "${pageContext.request.contextPath}/AdvListar";
            }
        });
    }

    function uploadFile() {
        var target = document.getElementById("target");
        target.src = "";
        var file = document.querySelector("input[type='file']").files[0];
        if (file) {
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onloadend = function () {
                target.src = reader.result;
            };

        } else {
            target.src = "";
        }
    }
</script>
<jsp:include page="/footer-neutro.jsp"/>
