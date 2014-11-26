<%-- 
    Document   : CekHapusDataSupir
    Created on : Nov 23, 2014, 12:19:14 PM
    Author     : Dion Wisnu
--%>

<%@page import="com.PengelolaSupir.DataSupir"%>
<%@page import="com.tools.Koneksi"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("hapusDataSupir").equals("Hapus")) {
                String idSupir = request.getParameter("hapusIdSupir");
                 Connection conn = null;
                Koneksi kn = new Koneksi();
                conn = kn.getDBConnection();
                DataSupir dataSupir = new com.PengelolaSupir.DataSupir(conn);
                boolean status = dataSupir.cekSupir(idSupir);
                
                if (status == true) {
                    dataSupir.HapusDataSupir(idSupir);
                    session.setAttribute("idSpr", idSupir);
                    response.sendRedirect("FormHapusDataSupir.jsp");
                } else {
                    response.sendRedirect("FormTampilDataSupir.jsp?error=y");
                }

            }
        %>
    </body>
</html>
