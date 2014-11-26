<%-- 
    Document   : CekEditDataSupir
    Created on : Nov 23, 2014, 9:25:57 AM
    Author     : Dion Wisnu
--%>

<%@page import="com.PengelolaSupir.DataSupir"%>
<%@page import="com.tools.Koneksi"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.PengelolaSupir.DataSupir"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("ubahDataSupir").equals("Ubah")) {
                String idSupir = request.getParameter("ubahIdSupir");
                Connection conn = null;
                Koneksi kn = new Koneksi();
                conn = kn.getDBConnection();
                DataSupir dataSupir = new com.PengelolaSupir.DataSupir(conn);
                boolean status = dataSupir.cekSupir(idSupir);
                
                if (status == true) {
                    session.setAttribute("idSpr", idSupir);
                    response.sendRedirect("FormUbahDataSupir.jsp");
                } else {
                    response.sendRedirect("FormTampilDataSupir.jsp?error=y");
                }

            }
        %>
    </body>
</html>
