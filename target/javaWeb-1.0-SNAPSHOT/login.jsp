<%-- 
    Document   : login
    Created on : 23/06/2022, 2:46:31 p. m.
    Author     : OSKAR
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="Utils.Encriptar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> 
        <title>Login</title>
    </head>
    <body>
        <div class="container mt-5" >
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="login.jsp">


                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="user" placeholder="Usuario">

                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Contraseña">

                        </div>

                        <button type="submit" class="btn btn-primary" name="login">Login</button>

                    </form>
                    <%

                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        Encriptar enc=new Encriptar();

                        if (request.getParameter("login") != null) {
                            String user = request.getParameter("user");
                            String password = request.getParameter("password");
                            HttpSession sesion = request.getSession();

                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://db4free.net/ejemplobada?user=ejemplobd159&password=a85cb96d");
                                st = con.createStatement();

                                rs = st.executeQuery("SELECT * FROM `user` where user='" + user + "' and password='" + enc.getMD5(password) + "';   ");
                                while (rs.next()) {
                                    sesion.setAttribute("logueado", "1");
                                    sesion.setAttribute("user", rs.getString("user"));
                                    sesion.setAttribute("id", rs.getString("id"));
                                    response.sendRedirect("index.jsp");

                                }
                                out.print("<div class=\"alert alert-danger\" role=\"alert\">usuario no encontrado </div>");
                            } catch (Exception e) {
                            }

                        }
                    %> 
                </div>
            </div>
        </div>

    </body>
</html>
