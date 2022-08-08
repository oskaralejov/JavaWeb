<%-- 
    Document   : datosUsuario
    Created on : 28/06/2022, 11:08:34 p. m.
    Author     : OSKAR
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="Utils.Encriptar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">  
        <title>Usuario</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }
            Connection con = null;
            Statement st = null;
            Encriptar enc=new Encriptar();
              
        %>
        <div class="container mt-5" >
            <div class="row">
                <div class="col-sm">

                    <form action="datosUsuario.jsp" method="post">

                        <div class="form-group">
                            <label>User</label>
                            <input type="text" class="form-control" name="user" placeholder="User"  <%= sesion.getAttribute("user") %>>

                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password1" placeholder="Password">

                        </div>
                        <div class="form-group">
                            <label>Repita su password</label>
                            <input type="password" class="form-control" name="password2" placeholder="Repita su password">

                        </div>

                        <button type="submit"  name="guardar" class="btn btn-primary">Guardar</button>
                        <button type="submit"  name="cancelar" class="btn btn-danger">Cancelar</button>

                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("guardar") != null) {
            String user=request.getParameter("user");
            String password1=request.getParameter("password1");
            String password2=request.getParameter("password2");
            
            if(password1.equals(password2)){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://db4free.net/ejemplobada?user=ejemplobd159&password=a85cb96d");
                st=con.createStatement();
                st.executeUpdate("update user set user='"+user+"',password='"+enc.getMD5(password1)+"' where id='"+sesion.getAttribute("id")+"';");
                sesion.setAttribute("user", user);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                out.print(e);
                }
            
            }
            else{
            out.print("<div class=\"alert alert-danger\" role=\"alert\">las contraseñas no coinciden</div>");
            }
            }
            if (request.getParameter("cancelar") != null) {
             request.getRequestDispatcher("index.jsp").forward(request, response);
            
            }
        %>
    </body>
</html>

