<%-- 
    Document   : eliminarEdit
    Created on : 6/07/2020, 07:44:58 PM
    Author     : VIMAHICASTILLO
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title>
    </head>
    <body>
       <%
    Connection conexion= null;
    PreparedStatement stmt= null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/libros", "root", "");
        int id= Integer.parseInt(request.getParameter("id_editorial"));
         stmt= conexion.prepareStatement("DELETE * FROM cat_editorial WHERE id_editorial=?");
         stmt.executeUpdate();
         request.getRequestDispatcher("Index.jsp").forward(request, response);
    }catch(Exception e){
      out.println("Error "+e.getMessage());
    }
    %>
    </body>
</html>
