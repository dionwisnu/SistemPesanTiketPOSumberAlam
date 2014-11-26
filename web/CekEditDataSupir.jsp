<%-- 
    Document   : CekEditDataSupir
    Created on : Nov 23, 2014, 11:40:50 AM
    Author     : Dion Wisnu
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.supir.DataSupirControl"%>
<%@page import="com.supir.DataSupir"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("tombol").equals("Simpan")){
                String idSupir = (String) session.getAttribute("idSpr");
                DataSupir dataSupir = new DataSupir();
                dataSupir.setNamaSupir(request.getParameter("namaSupir"));
                dataSupir.setNoTelp(request.getParameter("noTelp"));
                dataSupir.setAlamat(request.getParameter("alamat"));
                try{
                    DataSupirControl.getKoneksiDataSupir().UpdateDataSupir(dataSupir, idSupir);
                    response.sendRedirect("FormMenuPengelolaSupir.jsp?ubah=y");
                } catch (SQLException ex){
                    response.sendRedirect("FormUbahDataSupir.jsp?error=y");
                } 
            } else{
                
            }
            
            
        %>
    </body>
</html>
