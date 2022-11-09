<%-- 
    Document   : index
    Created on : 8 nov. 2022, 19:38:50
    Author     : Dreick Lap1
--%>
<%@page import="com.emergentes.controlador.modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.controlador.modelo.Productos"%>
<%

    if(session.getAttribute("Productos2")==null)
    {
        ArrayList<Productos> lisaux = new ArrayList<Productos>();
        session.setAttribute("Productos2", lisaux);
    }
    if(session.getAttribute("cates")==null)
    {
        ArrayList<Categoria> liscat = new ArrayList<Categoria>();
        
        liscat.add(new Categoria(1,"Golosinas"));
        liscat.add(new Categoria(2,"Galletas"));
        liscat.add(new Categoria(3,"Refrescos"));
        liscat.add(new Categoria(4,"Conservas"));
         liscat.add(new Categoria(5,"Frituras"));
        session.setAttribute("cates",liscat);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tienda Online</title>
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
            <h1>PRODUCTOS-TEC.EMERGENTES2</h1>
            <ul>
                <li><h1><a href="Productos.jsp">Productos</a></h1></li>
            </ul>   
        

    </body>
</html>
