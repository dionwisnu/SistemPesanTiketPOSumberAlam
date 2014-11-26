<%-- 
    Document   : FormUbahDataSupir
    Created on : Nov 22, 2014, 10:21:34 PM
    Author     : Dion Wisnu
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.PengelolaSupir.DataSupir"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Ubah Data Supir</title>
    </head>

    <body>
        <%
            String idSupir = (String) session.getAttribute("idSpr");
        %>
        <p align="center"><img src="sumberalam/HeaderSA.png" width="350" height="100"/></p>
        <%try {
                if (request.getParameter("error").equals("y")) {

        %>

        <blink><h5 align="center" style="color: red">Gagal Update Data Supir, coba lagi</h5></blink>
        <%                             }
            } catch (Exception e) {
            }
        %>
        <h1 align="center" class="title">Ubah Data Supir</h1>
        <p align="center">Untuk supir dengan ID = <% out.print(idSupir);%> </p>
        <form action="CekEditDataSupir.jsp" method="post">
            <table width="312" border="0" align="center">
                <tr>
                    <td>Nama</td>
                    <td>

                        <input type="text" name="namaSupir" id="namaSupir" />
                    </td>
                </tr>
                <tr>
                    <td>No Telp</td>
                    <td>
                        <label for="noTelp"></label>
                        <input type="text" name="noTelp" id="noTelp" />
                    </td>
                </tr>
                <tr>
                    <td>Alamat</td>
                    <td>
                        <label for="alamat"></label>
                        <textarea name="alamat" id="alamat" cols="25" rows="3"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input type="submit" name="tombol" id="simpan" value="Simpan" align="right" onclick=""/>
                    </td>
                </tr>
            </table>
        </form>
        <p>&nbsp;</p>
        <form action="CekNavigasi.jsp" method="post">
            <table width="200" border="0" align="center">
                <tr>
                    <td align="center"><input name="navigasi" type="button" value="Kembali" /></td>
                    <td align="center"><input name="navigasi" type="button" value="Log Out" /></td>
                </tr>
            </table>
        </form>
        <p align="center">&nbsp;</p>
        <% if (session.getAttribute("idSpr").equals("")) {
            } else {
                try {
                    DataSupir ds = new DataSupir();
                    ds.setNamaSupir(request.getParameter("namaSupir"));
                    ds.setNomorHP(request.getParameter("noTelp"));
                    ds.setAlamat(request.getParameter("alamat"));
                    ds.UpdateDataSupir(ds, idSupir);
                    //out.println("Data Berhasil diupdate");
                } catch (SQLException ex) {
                    //out.println("Data gagal diupdate karena : " + ex);
                }
            }
        //aku ganteng
        %>
        
    </body>
</html>
