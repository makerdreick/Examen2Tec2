<%-- 
    Document   : Productos
    Created on : 8 nov. 2022, 19:42:09
    Author     : Dreick Lap1
--%>

<%@page import="java.util.List"%>
<%@page import="com.emergentes.controlador.modelo.Productos"%>
<%
    List<Productos > productos = (List<Productos>)session.getAttribute("Productos2");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos 🐓</title>
    </head>
    <body>
         <table border="10"  >
        <tr>
            <th><h2>SEGUNDO PARCIAL TEM-742</h2>
                    NOMBRE Y APELLIDO:    <br> 
                   
                    ERICK CONDE FERNANDEZ <br>
                    CARNET: 6809361<br>
                    MATRICULA: 200028190 <br>
                    </th>
                </tr>
        
        </table>
        <h1>Productos</h1>
            <p><a href="ProductoController?op=nuevo">Agregar Nuevo Producto -></a></p>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>DESCRIPCION</th>
                    <th>CANTIDAD</th>
                    <th>PRECIO</th>
                    <th>CATEGORIA</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    if ( productos != null) {
                        for (Productos item : productos) {
                %>
                <tr>
                    <td><%= item.getId()%></td>
                    <td><%= item.getDescripcion()%></td>
                    <td><%= item.getCantidad()%></td>
                    <td><%= item.getPrecio()%></td>
                    <td><%= item.getCate().getDescripcion()%></td>
                    <td><a href="ProductoController?op=editar&id=<%= item.getId()%>">Editar</a></td>
                    <td><a href="ProductoController?op=eliminar&id=<%= item.getId()%>">Eliminar</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
            <p><a href="index.jsp"><- Volver al menu</a></p>
        </div>
    </body>
</html>
