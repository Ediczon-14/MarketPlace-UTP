<%-- 
    Document   : detallePedidoTienda
    Created on : 05/11/2021, 10:48:27 AM
    Author     : edicz
--%>

<%@page import="Entidad.DetallePedido"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<DetallePedido> da= (List<DetallePedido>)request.getAttribute("data");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://code.jquery.com/jquery-3.2.1.js"></script>
                
    </head>
    
    <body>
        <%@include file="/header.jsp" %>
        <br> 
        <br>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <%@include file="/menuVendedor.jsp"%>
                </div>
                <div class="col-9 card text-center">
                    <h1>Listar Producto</h1>
                    <hr>
                    
                        <table border="1" class="table table-hover">
                        <thead>
                            <tr>
                                <th>CANTIDAD</th>
                                <th>PRECIO</th>
                                <th>MARCA</th>
                                <th>IMAGEN</th>
                                <th>ACCION</th>
                        </thead>
                        <tbody>
                            <%
                        if(da!=null)
                        {
                            for(DetallePedido a:da)
                            {
                        %>
                        <form action="ServletProducto">
                            <input type="hidden" name="tipo" value="actualizaDetalleProducto">    
                            <tr>
                                <input style="display: none" type="number" name="id" required class="form-control" value="<%=a.getIdDetallePedido()%>">
                                <td><input type="number" id="cantidad" name="cantidad" required class="form-control" value="<%=a.getCantida()%>"></td>
                                <td><input type="text" id="precio" readonly="" name="precio" required class="form-control" value="<%=a.getCantida()*a.getPrecioProducto()%>"></td>
                                <script>
                                    var s=document.getElementById("cantidad").value;
                                    document.getElementById("precio").value =(<%=a.getPrecioProducto()%>*s);
                                </script>
                                <td><%=a.getNombreProducto()%></td>
                                <td><img src="<%=a.getImgProducto()%>" width="50" height="50"></td>
                                <td><a href="ServletProducto?tipo=eliminarDetallePedido&id=<%=a.getIdDetallePedido()%>" class="btn btn-outline-info my-2 my-sm-0 form-control">Eliminar</a>
                                <input type="submit" value="Actualizar" class="btn btn-outline-info my-2 my-sm-0 form-control"></td>
                            </tr>
                        </form>
                        <%
                            }
                        }
                        %>
                        </tbody>
                    </table>
                    <a href="javascript: history.go(-1)"  class="btn btn-outline-info my-2 my-sm-0 form-control">Mostrar Pedidos</a>
                        <%
                        if(da!=null)
                        {
                            double total=0.0;
                            for(DetallePedido a:da)
                            {
                                total=total+a.getPrecio();
                            }
                            for(DetallePedido a:da)
                            {
                        %>
                            <form name="form1" action="pdf.jsp" target="_black">
                                <input type="text" name ="txtparametro" style="display:none" value="<%=a.getIdPedido()%>"/>
                                <input type="text" name ="total" style="display:none" value="<%=total%>"/>
                                <input type="text" name ="titulo" style="display:none" value="<jsp:getProperty name="tiendaBean" property ="nombreTienda"/>"/>
                                <input type="submit" value="Ver Boleta" class="btn btn-outline-info my-2 my-sm-0 form-control"/>
                            </form>
                            <a href="ServletProducto?tipo=EnviarMail&correo=ediczon.mayta@gmail.com&tienda=<jsp:getProperty name="tiendaBean" property ="nombreTienda"/>" class="btn btn-outline-info">Notificar</a>
                        <%break;
                            }
                        }
                        %>
                </div><br><br>
                
            </div>
        </div>
        <br> 
        <br>
        <br>
        <%@include file="/footer.jsp"%>
    </body>
</html>