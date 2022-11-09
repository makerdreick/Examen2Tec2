<%-- 
    Document   : editProductos
    Created on : 8 nov. 2022, 19:42:19
    Author     : Dreick Lap1
--%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.controlador.modelo.Categoria"%>
<%@page import="com.emergentes.controlador.modelo.Productos"%>
<%
    Productos lib = (Productos)request.getAttribute("lib");
    List<Categoria> categorias = (List<Categoria>)request.getAttribute("categorias");
    String tipo = (String)request.getAttribute("tipo");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NUEVO | EDITAR</title>
    </head>
    <body>
            <h1><%= (tipo == "new") ? "Nuevo " : "Editar "%>Producto</h1>
            <form action="ProductoController" method="POST">
                <input type="hidden" name="tipo" value="<%=tipo%>">
                <table border="10" >
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="id" value="<%= lib.getId()%>"></td>
                    </tr>
                    <tr>
                        <td>DESCRIPCION</td>
                        <td><input type="text" name="descripcion" value="<%= lib.getDescripcion()%>"></td>
                    </tr>
                    <tr>
                        <td>CANTIDAD</td>
                        <td><input type="text" name="cantidad"  value="<%= lib.getCantidad()%>"></td>
                    </tr>
                    <tr>
                        <td>PRECIO</td>
                        <td><input type="text"  name="precio"  value="<%= lib.getPrecio()%>"></td>
                    </tr>
                    <tr>
                        <td>Categoria</td>
                        <td><select  type="text" name="idcat" > 
                                <%
                                    for (Categoria c : categorias) {
                                %>
                                <option value="<%= c.getId()%>"<%= (c.getId() == lib.getCate().getId()) ? "selected" : ""%>>
                                    <%= c.getDescripcion()%>
                                </option>
                                <%
                                    }
                                %>                        
                            </select></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Registrar"></td>
                    </tr>
                </table>
            </form>
       <p><a href="Productos.jsp"><- volver</a></p>
    </body>
</html>
