<%-- 
    Document   : FormTampilDataSupir
    Created on : Nov 17, 2014, 11:07:50 AM
    Author     : Dion Wisnu
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.PengelolaSupir.DataSupir"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tools.Koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Ubah Data Supir</title>
    </head>

    <body>
        <%
            Connection conn = null;
            Koneksi kn = new Koneksi();
            conn = kn.getDBConnection();
            DataSupir dataSupir=new com.PengelolaSupir.DataSupir(conn);
            List<DataSupir> listSupir = new ArrayList<DataSupir>();
            listSupir=dataSupir.lihatDataSupir();
        %>
        <p align="center"><img src="sumberalam/HeaderSA.png" width="350" height="100"/></p>
        <p align="center">&nbsp;</p>
        <form action="CekNavigasi.jsp" method="post">
            <table width="200" border="0" align="center">
                <tr>
                    <td align="center"><input name="navigasi" type="submit" value="Menu Utama" /></td>
                    <td align="center"><input name="navigasi" type="submit" value="Log Out" /></td>
                </tr>
            </table>
        </form>
        <p align="center">&nbsp;</p>
        <%try {
                if (request.getParameter("error").equals("y")) {

        %>

        <blink><h5 align="center" style="color: red">ID Supir yang dimasukan tidak ditemukan, masukan lagi</h5></blink>
            <%                             }
                } catch (Exception e) {
                }
            %>
        <form action="CekIdSupir.jsp" method="post">
            <table width="350" border="0" align="center">
                <tr>
                    <td width="150">Masukan ID supir</td>
                    <td width="200">
                        <input type="text" name="ubahIdSupir" id="ubahIdSupir" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input type="submit" name="ubahDataSupir" id="ubahDataSupir" value="Ubah" />
                    </td>
                </tr>
            </table>
        </form>
        <h1 align="center" class="title">Data Supir</h1>

        <table width="736" border="2" align="center">
            <tr>
                <td width="90" align="center">ID</td>
                <td width="150" align="center">Nama</td>
                <td width="150" align="center">No Telp</td>
                <td width="300" align="center">Alamat</td>
            </tr>
            <% 
                    for(int i=0;i<listSupir.size();i++){ %>
            <tr>
                <td>&nbsp <% out.print(listSupir.get(i).getIdSupir()); %> </td>
                <td>&nbsp <% out.print(listSupir.get(i).getNamaSupir()); %> </td>
                <td>&nbsp <% out.print(listSupir.get(i).getNomorHP()); %> </td>
                <td>&nbsp <% out.print(listSupir.get(i).getAlamat()); %> </td>
            </tr>
           <%}%>
        </table>
        <p align="center">&nbsp;</p>

    </body>
</html>
