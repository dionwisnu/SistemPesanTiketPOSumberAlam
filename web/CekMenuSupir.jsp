<%-- 
    Document   : CekMenuSupir
    Created on : Nov 19, 2014, 11:37:25 AM
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
            String tombolSupir = request.getParameter("tombolSupir");

            if (tombolSupir.equals("Tambah Supir")) {
                response.sendRedirect("FormTambahSupir.jsp");
            } else if (tombolSupir.equals("Ubah Supir")) {
                response.sendRedirect("FormTampilDataSupir.jsp");
            } else if (tombolSupir.equals("Hapus Supir")) {
                response.sendRedirect("FormHapusDataSupir.jsp");
            } else {

            }
        %>
    </body>
</html>
