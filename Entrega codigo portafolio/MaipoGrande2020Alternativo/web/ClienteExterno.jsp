<%-- 
    Document   : principal
    Created on : 11-09-2020, 2:28:03
    Author     : inter
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            // detect IE8 and above, and edge
            if (document.documentMode || /Edge/.test(navigator.userAgent)) {
                alert('Please use Chrome or Firefox for best browsing experience!');
            }
        </script>

        <!-- load CSS -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
        <link rel="stylesheet" href="css/bootstrap.min.css">                                      <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/fontawesome-all.min.css">                                <!-- Font awesome -->
        <link rel="stylesheet" href="slick/slick.css">
        <link rel="stylesheet" href="slick/slick-theme.css">
        <link rel="stylesheet" href="css/templatemo-style.css">    
    </head>
    <body>
        <%
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521/XE";
            String user = "ADMIN";
            String pass = "123";
            Class.forName(driver);
            Connection cn = DriverManager.getConnection(url, user, pass);
            PreparedStatement ps = null;
            ResultSet rs = null;
            Statement st = null;
            HttpSession sesion = request.getSession();
            String user_http;
            String pass_http;
            user_http = sesion.getAttribute("user").toString();
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Maipo Grande: Cliente Externo</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="ClienteExterno.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="realizarCompras.jsp">Nuestros productos<span class="sr-only"></span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="realizarPedido.jsp">Realizar pedido<span class="sr-only"></span></a>
                    </li>
                    <%
                        String runuser = "Select * from usuario where nombre_usuario = '" + user_http + "'";
                        ps = cn.prepareStatement(runuser);
                        rs = ps.executeQuery();
                        while (rs.next() == true) {
                    %> 
                    <li class="nav-item active">
                        <a class="nav-link" href="estadoPedido.jsp?run=<%=rs.getString(1)%>">Estado de pedido<span class="sr-only"></span></a>
                    </li>
                    <%
                        }
                    %>
                    <li class="nav-item active">
                        <a class="nav-link" href="AnimFolder/CorreoLoading.jsp">Correo<span class="sr-only"></span></a>
                    </li>  
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <%
                        if (sesion.getAttribute("user") != null && sesion.getAttribute("pass") != null) {
                            user = sesion.getAttribute("user").toString();
                            pass = sesion.getAttribute("pass").toString();
                    %>
                    <a href="logOut.jsp" style="color: #000; text-decoration: none">Cerrar sesion </a>
                    <%
                        } else {
                            out.print("<script> location.replace('index.jsp'); </script>");
                        }


                    %>
                </form>
            </div>
        </nav>


        <!-- Loader -->
        <div id="loader-wrapper">
            <div id="loader"></div>
            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>
        </div>

        <div class="container">
            <div class="tm-top-bar"></div>

            <!-- Welcome section -->
            <section class="tm-welcome">

                <div class="tm-welcome-left">
                    <!-- Logo -->
                    <div class="tm-logo">

                    </div>
                    <div class="tm-welcome-content">
                        <!-- fa icons -->
                        <div class="tm-welcome-icons-container">
                            <img src="img/AppleLogo.png" height="100px" width="100px" style="margin-left: 10%">
                            <img src="img/company.png" height="100px" width="100px" style="margin-left: 20%">
                        </div>

                        <h2 class="tm-mb-25">Bienvenido a Maipo grande.</h2>
                        <p class="tm-font-big">Nosotros nos dedicamos a la agrupación de distintas empresas ubicadas en la zona sur de la región Metropolitana que se dedican en gran parte a la producción de frutas.</p>
                    </div>
                </div>
                <div class="tm-welcome-right"></div>

            </section>
            <div class="tm-bar-2"></div>

            <section class="row tm-section-mb tm-section-2">
                <div class="col-md-12 tm-section-2-inner">
                    <div class="tm-section-2-left">
                        <div class="tm-img-container tm-img-container-1"></div>
                        <div class="tm-img-container tm-img-container-2"></div>
                    </div>
                    <div class="tm-section-2-right tm-bg-primary">
                        <div class="tm-section-2-text">
                            <h2 class="tm-section-2-header tm-mb-45">Mision</h2>
                            <p> La misión de la empresa es facilitar la comercialización de los productos de sus diferentes clientes en el
                                mercado extranjero y local.
                            </p>
                            <h2 class="tm-section-2-header tm-mb-45">Vision</h2>
                            <p> En el mercado extranjero se negocian ventas masivas de productos a mejores precios, pero no todos los
                                productos son enviados al extranjero, ya sea por baja demanda, o bien, por la calidad de la fruta obtenida.
                                Por esta razón, es necesario comercializar en el mercado local los productos que han quedado sobrantes del
                                proceso anterior, haciendo tratos con pequeños comerciantes y otras empresas.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="row tm-section-3">
                <div class="col-md-12 tm-section-3-inner">
                    <div class="tm-section-3-left tm-bg-primary">
                        <div class="tm-section-3-text">
                            <h2 class="tm-section-3-header tm-mb-35">Nuestras redes sociales</h2>
                            <a style="text-decoration: none; color: white" href="https://www.facebook.com/maipo.grande.9"><img src="img/facebook-f.png" height="50px" width="50px"> Siguenos en facebook!</a>
                            <br><br>
                            <a style="text-decoration: none; color: white" href="https://www.instagram.com/maipogrande2020/"><img src="img/instagram.png" height="50px" width="50px"> Siguenos en Instagram!</a>
                            <br><br>
                            <a style="text-decoration: none; color: white" href="mailto:maipogrande2021@gmail.com"><img src="img/gmail.png" height="50px" width="50px"> Contactanos por correo!</a>
                        </div>
                    </div>
                    <div class="tm-section-3-right">
                        <div class="tm-img-container tm-img-container-3"></div>
                    </div>
                </div>
            </section>

            <section class="row tm-section-pt tm-section-pb">
                <div class="col-md-6 mx-auto text-center">
                    <h2 class="tm-text-dark tm-mb-50">Nuestra comunidad</h2>
                    <p class="tm-text-light-dark tm-font-big">En Maipo grande somos todos una familia en donde nos respetamos y nos ayudamos los unos a los otros. Cada día fomentamos la producción para ser lideres en el mercado y ser una empresa que pueda ser confiable en todo momento por nuestros clientes y gracias a nuestros colaboradores, productores, transportistas y clientes no podríamos ser quienes somos ahora. </p>
                    <p class="tm-text-light-dark tm-font-big">Muchas gracias a todos.</p>
                </div>
            </section>

            <footer class="pt-4 pb-4">
                <p class="text-center tm-text-light-dark">Copyright &copy; 2020 Empresa Maipo grande ™

                    | <a rel="nofollow" class="tm-text-light-dark"> Todos los derechos reservados</a></p>
            </footer>

        </div> <!-- container -->

        <script src="js/jquery-3.2.1.slim.min.js"></script>
        <script src="slick/slick.min.js"></script>
        <script>

            $(function () {
                $('.tm-gallery').slick({
                    dots: true,
                    infinite: true,
                    slidesToShow: 4,
                    slidesToScroll: 2,
                    responsive: [
                        {
                            breakpoint: 991,
                            settings: {
                                slidesToShow: 3,
                                slidesToScroll: 2
                            }
                        },
                        {
                            breakpoint: 767,
                            settings: {
                                slidesToShow: 2,
                                slidesToScroll: 1
                            }
                        },
                        {
                            breakpoint: 480,
                            settings: {
                                slidesToShow: 1,
                                slidesToScroll: 1
                            }
                        }
                        // You can unslick at a given breakpoint now by adding:
                        // settings: "unslick"
                        // instead of a settings object
                    ]
                });
            });

        </script>
    </body>
</html>
