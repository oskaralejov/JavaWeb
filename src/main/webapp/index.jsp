<%-- 
    Document   : index
    Created on : 20/06/2022, 10:41:36 p. m.
    Author     : OSKAR
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> 
        <title>Lista de Empleados</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");

            }


        %>
        <div class="container" >
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand">Empleados</a>
                <form class="form-inline" action="logout.jsp">
                    <a href="datosUsuario.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i><%= session.getAttribute("user")%></a>
                    <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" type="submit">Log out</button>
                </form>
            </nav>
            <div class="row mt-2">

                <div class="col-sm">
                    <form action="index.jsp" method="get">

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col" colspan="4" class="text-center"> <h3> Empleados <i class="fa fa-users" aria-hidden="true"></i> </h3> </th>
                                  </tr>
                                  <tr>
                                    <th scope="col" colspan="4" class="text-center">
                                        <input type="text" name="nombre" class="form-control" placeholder="Buscar por nombre" />
                                    </th>
                                    <th scope="col" class="text-center">
                                        <input type="submit" value="Buscar" name="buscar" class="form-control btn btn-primary" />
                                    </th>
                                    <th></th>
                                    <th scope="col">
                                        <a href="crear.jsp" <i class="fa fa-user-plus" aria-hidden="true"></i> </a>

                                    </th>
                                    </tr>


                                
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Direccion</th>
                                    <th scope="col">Telefono</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <jsp:include page="Empleados"/>


                            </tbody>
                        </table>
                    </form>
                </div>
            </div>

        </div> 


    </body>
</html>
