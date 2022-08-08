<%-- 
    Document   : borrar
    Created on : 23/06/2022, 11:54:15 a. m.
    Author     : OSKAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
           
            try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://db4free.net/ejemplobada?user=ejemplobd159&password=a85cb96d");
                st = con.createStatement();

                st.executeUpdate("delete FROM empledos where id='"+request.getParameter("id") +"';");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                
            } catch (Exception e) {
            out.print(e);
            }


        %>
    </body>
</html>
