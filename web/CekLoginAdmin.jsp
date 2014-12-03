<%-- 
    Document   : CekLoginAdmin
    Created on : Nov 19, 2014, 11:33:50 AM
    Author     : Dion Wisnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String buttonPilih = request.getParameter("tombol");

            if (buttonPilih.equals("submit")) {
                if (request.getParameter("username").equals("supir") && request.getParameter("password").equals("supir")) {
                    response.sendRedirect("FormMenuPengelolaSupir.jsp");
                } else if (request.getParameter("username").equals("trayek") && request.getParameter("password").equals("trayek")) {
                    response.sendRedirect("FormMenuPengelolaBusTrayek.jsp");
                } else if (request.getParameter("username").equals("agen") && request.getParameter("password").equals("agen")) {
                    response.sendRedirect("FormMenuAgen.jsp");
                } else {
                    response.sendRedirect("FormLogin.jsp?error=y");
                }
            } else if (buttonPilih.equals("logout")) {
                response.sendRedirect("FormLogin.jsp");
            }
        %>
    </body>
</html>
