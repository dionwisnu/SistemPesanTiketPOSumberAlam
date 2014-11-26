<%-- 
    Document   : CekNavigasi
    Created on : Nov 23, 2014, 1:06:41 PM
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
            if(request.getParameter("navigasi").equals("Menu Utama")){
                response.sendRedirect("FormMenuPengelolaSupir.jsp");
            } else if(request.getParameter("navigasi").equals("Log Out")){
                response.sendRedirect("FormLogin.jsp");
            } else  if (request.getParameter("navigasi").equals("Kembali")){
                response.sendRedirect("FormTampilDataSupir.jsp");
            } else{
                
            }
        %>
    </body>
</html>
