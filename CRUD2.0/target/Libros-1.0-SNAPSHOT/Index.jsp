<%-- 
    Document   : Index
    Created on : 2/07/2020, 08:34:03 PM
    Author     : VIMAHICASTILLO
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection conexion= null;
    PreparedStatement stmt= null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/libros", "root", "");
    }catch(Exception e){
        out.println("Error"+e.getMessage());
    }
%>

<html>
    <head>
        <link href="Estilos.css" rel="stylesheet"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>CRUD</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <%
           stmt= conexion.prepareStatement("SELECT libro.id_libro, libro.titulo, libro.autor, cat_editorial.nombre, libro.año, libro.formato, libro.stock FROM `libro` JOIN cat_editorial ON libro.id_editorial=cat_editorial.id_editorial");
           rs = stmt.executeQuery();
        %>
        <h1 style="text-align:center">CRUD de Libros</h1>
        <div class="container">
        <h5>LISTA DE LIBROS CON JOIN</h5>
        <table class="table" id="t01">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Titulo</th> 
                    <th>Autor</th>
                    <th>Editorial</th>
                    <th>Año</th>
                    <th>Formato</th>
                    <th>Stock</th>
                    <th>Acciones</th>
                    <th> </th>
                    <th> </th>
                </tr>
                </thead>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt("id_libro")%></td>
                    <td><%=rs.getString("titulo")%></td>
                    <td><%=rs.getString("autor")%></td>
                    <td><%=rs.getString("nombre")%></td>
                    <td><%=rs.getInt("año")%></td>
                    <td><%=rs.getString("formato")%></td>
                    <td><%=rs.getInt("stock")%></td>
                    <td><a class="btn btn-success btn-block" href="agregarL.jsp?id=<%=rs.getInt("id_libro")%>"/>Agregar</td>
                     <td><a class="btn btn-warning btn-block" href="editarL.jsp?id=<%=rs.getInt("id_libro")%>"/>Editar</td>
                    <td><a class="btn btn-danger btn-block" href="eliminarL.jsp?id=<%=rs.getInt("id_libro")%>"/>Eliminar</td>
                </tr>
                <%}%>
            </table>
        </div>
       
        <%
            stmt= conexion.prepareStatement("SELECT * FROM cat_editorial");
            rs = stmt.executeQuery();
        %>
        <br>
        <div class="container">
        <h5>CATALOGO EDITORIAL</h5>
            <table class="tabla" id="t01">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                    <th></th>
                </tr>
                </thead>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt("id_editorial")%></td>
                    <td><%=rs.getString("nombre")%></td>
                    <td><a class="btn btn-success btn-block" href="agregarEdit.jsp?id=<%=rs.getInt("id_editorial")%>"/>Agregar</td>
                    <td><a class="btn btn-danger btn-block" href="eliminarEdit.jsp?id=<%=rs.getInt("id_editorial")%>"/>Eliminar</td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
