<%@page contentType="text/html" pageEncoding="iso-8859-1" %>
<!DOCTYPE html>
<html>
    <head>
        <meta  http-equiv="Content-Type" content="text/html; charset=iso-8895-1">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>BRSADV</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <link href="${pageContext.request.contextPath}/img/logo_3.png" rel="icon">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">


        <!--JQuery-->
        <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> 
        <script src="${pageContext.request.contextPath}/js/jquery.mask.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.maskMoney.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/app.js"></script>
        <!--Bootstrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!--Datatable-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css"/>
        <script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
        <!--Mensagem aberta-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.3.1/dist/sweetalert2.all.min.js" type="text/javascript"></script>



    </head>
    <body>
        <header id="header" class="fixed-top ">
            <div class="container d-flex align-items-center justify-content-lg-between">

                <!--<h1 class="logo me-auto me-lg-0"><a href="index.html"><img /><span></span></a></h1>-->
                <!-- Uncomment below if you prefer to use an image logo -->
                <a href="${pageContext.request.contextPath}/home.jsp" class="logo me-auto me-lg-0"><img src="${pageContext.request.contextPath}/assets/img/logo_3.png" alt="" class="img-fluid"></a>

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                        <li><a class="nav-link scrollto" href="#about">Sobre</a></li>
                        <li><a class="nav-link scrollto" href="#services">Serviços</a></li>
                        <li><a class="nav-link scrollto " href="#portfolio">Faça sua Pergunta</a></li>
                        <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/AdvListarUser">Equipe</a></li>
                        <li class="dropdown"><a href="#"><span>Área do Direito</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="#">Civil</a></li>
                                <li><a href="#">Penal</a></li>
                                <li><a href="#">Admnistrativo</a></li>
                                <li><a href="#">Ambiente</a></li>
                                <li><a href="#">Trabalhista</a></li>
                                <li><a href="#">Empresarial</a></li>
                            </ul>
                        </li>
                        <li><a class="nav-link scrollto" href="#contact">Contato</a></li>
                        <li class="dropdown"><a href="#"><span>ADM</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li class="dropdown"><a href="#"><span>ADV's</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/AdvListar">Listar Advogados</a></li>
                                        <li><a href="${pageContext.request.contextPath}/AdvNovo">Cadastrar Advogado</a></li>
                                    </ul>
                                <li class="dropdown"><a href="#"><span>Estados</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/EstadoListar">Listar Estados</a></li>
                                        <li><a href="${pageContext.request.contextPath}/EstadoNovo">Cadastrar Estado</a></li>
                                    </ul>
                                <li class="dropdown"><a href="#"><span>Cidades</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/CidadeListar">Listar Cidades</a></li>
                                        <li><a href="${pageContext.request.contextPath}/CidadeNovo">Cadastrar Cidade</a></li>
                                    </ul>
                                <li class="dropdown"><a href="#"><span>Endereços</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/EnderecoListar">Listar Endereço</a></li>
                                        <li><a href="${pageContext.request.contextPath}/EnderecoNovo">Cadastrar Endereço</a></li>
                                    </ul>
                                <li class="dropdown"><a href="#"><span>Areas</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/AreaListar">Listar Areas</a></li>
                                        <li><a href="${pageContext.request.contextPath}/AreaNovo">Cadastrar Area</a></li>
                                    </ul>
                            </ul>
                        </li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->

                <a href="${pageContext.request.contextPath}/login.jsp" class="get-started-btn scrollto">Login</a>
                <a href="#"><i class="ri-wechat-line" style="color: #ffc451; font-size: 2em;"></i></a>
            </div>
        </header>
