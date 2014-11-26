<%-- 
    Document   : CekTambahSupir
    Created on : Nov 21, 2014, 8:00:28 PM
    Author     : Dion Wisnu
--%>
<%@page import="com.PengelolaSupir.DataSupir"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.PengelolaSupir.DataSupir"%>
<%@page import="com.tools.Koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
                try {
                    DataSupir ds = new DataSupir();
                    ds.setIdSupir(request.getParameter("idSupir"));
                    ds.setNamaSupir(request.getParameter("namaSupir"));
                    ds.setNomorHP(request.getParameter("noTelp"));
                    ds.setAlamat(request.getParameter("alamat"));
                    ds.tambahSupir(ds);
                    response.sendRedirect("FormMenuPengelolaSupir.jsp?tambah=y");
                    out.println("Data Berhasil disimpan");
                } catch (SQLException ex) {
                    response.sendRedirect("FormTambahSupir.jsp?simpan=n");
                    out.println("Data gagal disimpan karena : " + ex);
                }
        %>
    </body>
</html>
