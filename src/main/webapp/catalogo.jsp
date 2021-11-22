<%-- 
    Document   : catalogo
    Created on : 04/10/2021, 05:45:04 PM
    Author     : edicz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="Entidad.Producto"%>

 


<%
    List<Producto> da= (List<Producto>)request.getAttribute("data");
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    
    <body>
        <%@include file="/header.jsp" %>
        <nav class="navbar navbar-light bg-light">
            <a class="btn btn-outline-info my-2 my-sm-0" href="ServletProducto?tipo=listarPedidoCliente&id=<jsp:getProperty name="usuarioBean" property ="idUsuario" />">Historial de Compras</a>
            <a class="btn btn-outline-info my-2 my-sm-0" href="ControladoProducto?accion=Carrito">Carrito <i class="fas fa-cart-plus">(<label style="color: orange">${contador}</label>)</i><img src="img/carrito.png"></a>
            <form class="form-inline">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Buscar Producto</button>
            </form>
            
        </nav>
        <br> 
        <br>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-12 card text-center">
                    <hr>
                    <h1>PRODUCTOS</h1>
                    <hr>
                    <form action="ServletProducto">
                        <input type="hidden" name="id" value="" >
                        <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                        <%
                            if(da!=null)
                                {
                                    for(Producto a:da)
                                        {
                        %>
                                            <div class="col"><br>
                                                <div class="card" style="width: 11rem;">
                                                    <img class="card-img-top" src="<%=a.getImgProducto()%>"  alt="Card image cap">
                                                    <div class="card-body">
                                                        <h5 class="card-title">S/. <%=a.getPrecioProducto()%></h5>
                                                        <p class="card-text"><%=a.getNombreProducto()%>-<%=a.getUnidadDeMedida()%></p>
                                                        <p class="card-text"><%=a.getMarcaProducto()%></p>
                                                        <a href="ServletProducto?tipo=getProducto&id=<%=a.getIdProducto()%>" class="btn btn-outline-info my-2 my-sm-0">Ver Detalles</a>
                                                    </div>
                                                </div>
                                            </div>
                        <%
                                        }
                                }
                        %>
                        
                        </div><hr>
                        <div style="visibility: hidden">
                            <input type="number" value="<jsp:getProperty name="usuarioBean" property ="idUsuario" />" name="idUsuario" required class="form-control" id="exampleFormControlInput1">
                        </div>                        
                        <div class="form-group card">
                            <h4>Califica la Tienda</h4>
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                            <p class="clasificacion">
                                <input id="radio1" type="radio" name="calificacion" value="1">
                                <label for="radio1">★</label>
                                <input id="radio2" type="radio" name="calificacion" value="2">
                                <label for="radio2">★</label>
                                <input id="radio3" type="radio" name="calificacion" value="3">
                                <label for="radio3">★</label>
                                <input id="radio4" type="radio" name="calificacion" value="4">
                                <label for="radio4">★</label>
                                <input id="radio5" type="radio" name="calificacion" value="5">
                                <label for="radio5">★</label>
                            </p>
                            <textarea class="form-control" name="comentario" rows="3"></textarea> <br>
                            <a href="#" class="btn btn-outline-info my-2 my-sm-0">Calificar</a>
                        </div>
                    </form>
                </div><br><br>    
            </div>
        </div>
        <br> 
        <br>
        <br>
        <%@include file="/footer.jsp"%>
        <script>
            $(".clasificacion").find("input").change(function()
            {
            var valor = $(this).val();
            $(".clasificacion").find("input").removeClass("activo");
            $(".clasificacion").find("input").each(function(index){
               if(index+1<=valor){
                $(this).addClass("activo");
               }

            });
          });

          $(".clasificacion").find("label").mouseover(function(){
            var valor = $(this).prev("input").val();
            $(".clasificacion").find("input").removeClass("activo");
            $(".clasificacion").find("input").each(function(index){
               if(index+1<=valor){
                $(this).addClass("activo");
               }

            });
          });
        </script>
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
