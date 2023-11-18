<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>

<div class="tabelas">
    <div class="card_table">
        <h2>Advogados</h2>
        <div class="tabela-listar">
            <table  class="largura100">
                <thead>
                    <tr>
                        <th align="center">ID</th>
                        <th align="center">Nome</th>
                        <th align="center">Area</th>
                        <th align="center">OAB</th>
                        <th align="center">Cidade - UF</th>
                        <th Align="center">Alterar</th>
                        <th Align="center">Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="adv" items="${advs}">                    
                        <tr>
                            <td align="left">${adv.idAdv}</td>                    
                            <td align="left">${adv.nome}</td>
                            <td align="left">${adv.area.nomearea}</td>
                            <td align="left">${adv.oab}</td>
                            <td align="left">${adv.cidade.nomeCidade}-${adv.cidade.estado.siglaEstado}</td>
                            <td align="left">
                                <a href="#modaladicionar" class="btn btn-warning adicionar" data-toggle="modal" 
                                   data-id="" onclick="setDadosModal(${adv.idAdv})">
                                    <i class="fas fa-plus fa-fw"></i> Alterar </a>
                            </td>
                            <td align="left">
                                <a href="#" onclick="deletar(${adv.idAdv})">
                                    <button class="btn
                                            <c:out value="${adv.situacao == 'A' ? 'btn-danger': 'btn-success'}"/>">
                                        <i class="fas fa-fw
                                           <c:out value="${adv.situacao == 'A' ? 'fa-times' : ' fa-plus'}"/>"></i>
                                        <Strong>
                                            <c:out value="${adv.situacao == 'A' ? 'Inativar': 'Ativar'}"/>
                                        </Strong>
                                    </button></a>
                            </td>
                        </tr>                
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div align="center" class="col">        
            <a href="#modaladicionar" data-toggle="modal"  data-id="" onclick="setDadosModal(${0})">
                <button class="align-button bt-amarelo-down">Novo</button>
            </a>
            <a href="index.jsp" >
                <button class="align-buttopn bt-amarelo-down">Voltar à Página Inicial</button>
            </a>
        </div> 
    </div>
</div>
<div class="modal fade" id="modaladicionar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Adicionar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <img alt="imagem" class="" 
                         name="foto" id="foto" width="85" heigth="100">
                    <input type="file" id="gallery-photo-add" class="inputfile" onchange="uploadFile();"/>
                    <label for="gallery-photo-add" class="btn btn-success">
                        <i class="fas fa-file-upload"></i> 
                        Selecionar Foto...
                    </label>
                </div>

                <div class="form-group">
                    <input class="form-control" type="hidden" name="idpessoa" id="idpessoa" value="" 
                           readonly="readonly"/>
                    <input class="form-control" type="hidden" name="idAdv" id="idAdv" 
                           value="" readonly="readonly"/>
                    <input class="form-control" type="hidden" name="situacao" id="situacao" 
                           value="" readonly="readonly"/>
                </div>

                <div class="form-group">
                    <label>CPF/Cnpj</label>
                    <input class="form-control" type="text" name="cpfcnpjpessoa" id="cpfcnpjpessoa" 
                           value=""/>
                </div>

                <div class="form-group">
                    <label>Nome/Razão Social</label>
                    <input class="form-control" type="text" name="nomepessoa" id="nomepessoa"/>
                </div>

                <div class="form-group">
                    <div class="form-line row">
                        <div class="col-sm">
                            <label class="m-t-0 header-title">Data Nascimento</label>
                            <input class="form-control" type="date" name="datanascimento" id="datanascimento" 
                                   value="" />
                        </div>
                        <div class="col-sm">
                            <label>Estado</label>
                            <select class="form-control" name="idestado" id="idestado" 
                                    onchange="BuscarCidadesPorEstado()" required>
                                <option value="nulo">Selecione</option>
                                <c:forEach var="estado" items="${estados}">
                                    <option value="${estado.idEstado}"
                                            ${cliente.cidade.estado.idEstado == estado.idEstado ? "selected" : ""}>
                                        ${estado.nomeEstado}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-sm">
                            <label>Cidade</label>
                            <select class="form-control" name="idcidade" id="idcidade" required>
                                <option value="nulo">Selecione</option>
                                <c:forEach var="cidade" items="${cidades}">
                                    <option value="${cidade.idCidade}"
                                            ${cliente.cidade.idCidade == cidade.idCidade ? "selected" : ""}>
                                        ${cidade.nomeCidade} 
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>




                <div class="form-group">
                    <div class="form-line row">
                        <div class="col-sm">
                            <label class="m-t-0 header-title">Sobre</label>
                            <input class="form-control" type="text" name="sobre" id="sobre" 
                                   value="" />
                        </div>

                    </div>
                </div>


                <div class="form-group">
                    <div class="form-line row">
                        <div class="col-sm">
                            <label class="m-t-0 header-title">OAB</label>
                            <input class="form-control" type="text" name="oab" id="oab" 
                                   value="" />
                        </div>
                        <div class="col-sm">
                            <label>Area</label>
                            <select name="area" id="area" class="form-control">
                                <option value="">Selecione</option>
                                <c:forEach var="area" items="${areas}">
                                    <option value="${area.idarea}" 
                                            ${adv.area.idarea == area.idarea ? "selected" : ""}>
                                        ${area.nomearea}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>








                <div class="form-group">
                    <div class="form-line row">
                        <div class="col-sm">
                            <label>Login</label>
                            <input class="form-control" type="text" name="login" id="login" value="" size="20" 
                                   maxlength="20" required/>
                        </div>

                        <div class="col-sm">
                            <label>Senha</label>
                            <input class="form-control" type="password" name="senha" id="senha" value="" size="20" 
                                   maxlength="20" required/>
                        </div>
                        <div class="col-sm">
                            <label>Permite Login</label>
                            <select class="form-control" name="permitelogin" id="permitelogin">
                                <option value="N" ${fornecedor.permiteLogin == 'N' ? "selected" : ""}>Não</option>
                                <option value="S" ${fornecedor.permiteLogin == 'S' ? "selected" : ""}>Sim</option>       
                            </select>    
                        </div>                      
                    </div>
                </div>

                            
                            
                            
                <div class="form-group">
                    <div class="form-line row">
                        <div class="col-sm">
                            <label>Instagram</label>
                            <input class="form-control" type="text" name="insta" id="insta" value="" size="20" 
                                   maxlength="20" required/>
                        </div>

                        <div class="col-sm">
                            <label>Linkedin</label>
                            <input class="form-control" type="text" name="linkedin" id="linkedin" value="" size="20" 
                                   maxlength="20" required/>
                        </div>
                        <div class="col-sm">
                            <label>Facebook</label>
                            <input class="form-control" type="text" name="facebook" id="facebook" value="" size="20" 
                                   maxlength="20" required/>  
                        </div>                      
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <a href="#" onclick="validarCampos()">
                        <button type="button" class="btn btn-success">Salvar</button>
                    </a>
                </div>
            </div>
        </div>
    </div>        
</div>   

<style type="text/css">
    .inputfile {
        /* visibility: hidden etc. wont work */
        width: 0.1px;
        height: 0.1px;
        opacity: 0;
        overflow: hidden;
        position: absolute;
        z-index: -1;
    }
    .inputfile:focus + label {
        /* keyboard navigation */
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
        -moz-box-shadow: 0px 0px 3px rgba(0,0,0,0.06);
        box-shadow: 0px 0px 3px rgba(0,0,0,0.06);
    }
</style>                                        

<script>
    $(document).ready(function () {
        console.log('entrei ready');
        //Carregamos a datatable
        //$("#datatable").DataTable({});
        $('#datatable').DataTable({
            "oLanguage": {
                "sProcessing": "Processando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "Nenhum registro encontrado.",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                "sInfoFiltered": "",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "Primeiro",
                    "sPrevious": "Anterior",
                    "sNext": "Seguinte",
                    "sLast": "Último"
                }
            }
        });
    });

    var cidade = ''; //variavel para controle do carregamento de cidades.
    function limparDadosModal() {
        $('#idpessoa').val("0");
        $('#situacao').val("");
        $('#cpfcnpjpessoa').val("");
        $('#nomepessoa').val("");
        $('#datanascimento').val("");
        $('#idestado').val("0");
        //cidade = 0;
        //BuscarCidadesPorEstado(); //atualiza lista de cidades
        $('#sobre').val("");
        $('#oab').val("");
        $('#area').val("0");
        $('#login').val("");
        $('#senha').val("");
        $('#permitelogin').val("S");
        $('#insta').val("");
        $('#linkedin').val("");
        $('#facebook').val("");
        foto.src = "";
    }

    function setDadosModal(valor) {
        limparDadosModal();
        var foto = document.getElementById("foto");
        document.getElementById('idpessoa').value = valor;
        document.getElementById('idAdv').value = valor;
        var idAdm = valor;
        if (idAdm != "0") {
            //existe administrador para buscar (alteração)
            $.getJSON('AdvCarregar', {idAdv: idAdm}, function (respostaServlet) {
                console.log(respostaServlet);
                var id = respostaServlet.idCliente;
                if (id != "0") {
                    $('#idpessoa').val(respostaServlet.idPessoa);
                    $('#idAdv').val(respostaServlet.idAdv);
                    $('#situacao').val(respostaServlet.situacao);
                    $('#cpfcnpjpessoa').val(respostaServlet.cpfCnpj);
                    $('#nomepessoa').val(respostaServlet.nome);
                    $('#datanascimento').val(respostaServlet.dataNascimento);
                    $('#idestado').val(respostaServlet.cidade.estado.idEstado);
                    cidade = respostaServlet.cidade.idCidade;
                    BuscarCidadesPorEstado(); //atualiza lista de cidades
                    $('#sobre').val(respostaServlet.sobre);
                    $('#oab').val(respostaServlet.oab);
                    $('#area').val(respostaServlet.area.idarea);
                    $('#login').val(respostaServlet.login);
                    $('#senha').val(respostaServlet.senha);
                    $('#permitelogin').val(respostaServlet.permiteLogin);
                    $('#insta').val(respostaServlet.insta);
                    $('#linkedin').val(respostaServlet.linkedin);
                    $('#facebook').val(respostaServlet.facebook);
                    foto.src = respostaServlet.foto;
                }
            });
        }
    }

    function carregarPessoa(v) {
        //console.log("Entrou");
        var idM = v;
        var tipoPessoa = 'adv';
        //console.log("Usuario = " + idM);
        $(document).ready(function () {
            $.getJSON('PessoaBuscarCpfCnpj', {cpfcnpjpessoa: idM, tipopessoa: tipoPessoa}, function (respostaForn) {
                console.log(respostaForn);
                //var id = respostaAdm.idAdministrador;
                if (respostaAdm != null)
                {
                    $('#idcliente').val(respostaForn.ifFornecedor);
                    $('#permitelogin').val(respostaForn.permiteLogin);
                    $('#situacao').val(respostaForn.situacao);
                    $('#idpessoa').val(respostaForn.idPessoa);
                    $('#nomepessoa').val(respostaForn.nome);
                    $('#login').val(respostaForn.login);
                    var datanasc = respostaForn.dataNascimento;
                    console.log(datanasc);
                    $('#datanascimento').val(datanasc);
                    $('#idestado').val(respostaForn.cidade.estado.idEstado);
                    cidade = respostaForn.cidade.idCidade;
                    BuscarCidadesPorEstado();
                    var foto = document.getElementById("foto");
                    foto.src = respostaAdm.foto;
                } else {
                    //se não encontrou administrador busca por pessoa somente
                    tipoPessoa = 'pessoa';
                    $.getJSON('PessoaBuscarCpfCnpj', {cpfcnpjpessoa: idM, tipopessoa: tipoPessoa}, function (respostaPessoa) {
                        console.log(respostaPessoa);
                        var id = respostaPessoa.idPessoa;
                        if (id != "0")
                        {
                            $('#idpessoa').val(respostaPessoa.idPessoa);
                            $('#nomepessoa').val(respostaPessoa.nome);
                            $('#login').val(respostaPessoa.login);
                            var datanasc = respostaPessoa.dataNascimento;
                            console.log(datanasc);
                            $('#datanascimento').val(datanasc);
                            $('#idestado').val(respostaPessoa.cidade.estado.idEstado);
                            cidade = respostaPessoa.cidade.idCidade;
                            BuscarCidadesPorEstado();
                            var foto = document.getElementById("foto");
                            foto.src = respostaPessoa.foto;
                        }
                    });
                }
            });
        });
    }

    function deletar(codigo) {
        var id = codigo;
        console.log(codigo);
        Swal.fire({
            title: 'Você tem certeza?',
            text: "Você deseja realmente inativar/ativar o ADV?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sim',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/AdvExcluir',
                    data: {
                        idAdv: id
                    },
                    success:
                            function (data) {
                                if (data == 1) {
                                    Swal.fire({
                                        position: 'top-end',
                                        icon: 'success',
                                        title: 'Sucesso',
                                        text: 'Adv inativado com sucesso!',
                                        showConfirmButton: true,
                                        timer: 10000
                                    }).then(function () {
                                        window.location.href = "${pageContext.request.contextPath}/AdvListar";
                                    })
                                } else {
                                    Swal.fire({
                                        position: 'top-end',
                                        icon: 'error',
                                        title: 'Erro',
                                        text: 'Não foi possível inativar Adv!',
                                        showConfirmButton: true,
                                        timer: 10000
                                    }).then(function () {
                                        window.location.href = "${pageContext.request.contextPath}/AdvListar";
                                    })
                                }
                            },
                    error:
                            function (data) {
                                window.location.href = "${pageContext.request.contextPath}/AdvListar";
                            }
                });
            }
            ;
        });
    }

    function validarCampos() {
        console.log("entrei na validação de campos");
        if (document.getElementById("nomepessoa").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o Nome do Fornecedor!',
                showConfirmButton: true,
                timer: 2000
            });
            $("#nome").focus();
        } else if (document.getElementById("datanascimento").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a Data de nascimento!',
                showConfirmButton: true,
                timer: 2000
            });
            $("#datanascimento").focus();
        } else if (document.getElementById("idcidade").value == 'nulo') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a cidade!',
                showConfirmButton: true,
                timer: 2000
            });
            $("#idcidade").focus();
        } else {
            gravarDados();
        }
    }

    function gravarDados() {
        console.log("Gravando dados ....");
        var target = document.getElementById("foto").src;

        $.ajax({
            type: 'post',
            url: 'AdvCadastrar',
            data: {
                idadv: $('#idAdv').val(),
                idpessoa: $('#idpessoa').val(),
                cpfcnpjpessoa: $('#cpfcnpjpessoa').unmask().val(),
                nomepessoa: $('#nomepessoa').val(),
                datanascimento: $('#datanascimento').val(),
                idcidade: $("#idcidade").val(),
                login: $("#login").val(),
                senha: $("#senha").val(),
                permitelogin: $("#permitelogin").val(),
                situacao: $("#situacao").val(),
                sobre: $("#sobre").val(),
                oab: $("#oab").val(),
                area: $("#area").val(),
                insta: $("#insta").val(),
                linkedin: $("#linkedin").val(),
                facebook: $("#facebook").val(),
                fotopessoa: target
            },
            success:
                    function (data) {
                        console.log("reposta servlet->");
                        console.log(data);
                        if (data == 1) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Sucesso',
                                text: 'Adv gravado com sucesso!',
                                showConfirmButton: true,
                                timer: 10000
                            }).then(function () {
                                window.location.href = "${pageContext.request.contextPath}/AdvListar";
                            })
                        } else {
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Erro',
                                text: 'Não foi possível gravar o Adv!',
                                showConfirmButton: true,
                                timer: 10000
                            }).then(function () {
                                window.location.href = "${pageContext.request.contextPath}/AdvListar";
                            })
                        }
                    },
            error:
                    function (data) {
                        window.location.href = "${pageContext.request.contextPath}/AdvListar";
                    }
        });
    }

    function BuscarCidadesPorEstado() {
        $('#idcidade').empty();
        idEst = $('#idestado').val();
        console.log("entrou buscar estado");
        if (idEst != 'null')
        {
            console.log("estado = " + idEst);
            url = "CidadeBuscarPorEstado?idestado=" + idEst;
            //console.log(url);
            $.getJSON(url, function (result) {
                //alert(result);
                $.each(result, function (index, value) {
                    $('#idcidade').append('<option id="cidade_' + value.idCidade + '"value="' + value.idCidade + '">' +
                            value.nomeCidade + '</option>');
                    if (cidade !== '') {
                        $('#cidade_' + cidade).prop({selected: true});
                    } else {
                        $('#cidade_').prop({selected: true});
                    }
                });
            }).fail(function (obj, textStatus, error) {
                alert('Erro do servidor: ' + textStatus + ', ' + error);
            });
        }
    }

    function uploadFile() {
        var target = document.getElementById("foto");
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
<%@include file="/footer-neutro.jsp"%>

