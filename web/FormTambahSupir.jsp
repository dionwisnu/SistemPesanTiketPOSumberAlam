<%-- 
    Document   : FormTambahSupir
    Created on : Nov 16, 2014, 12:22:50 PM
    Author     : Dion Wisnu
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.PengelolaSupir.DataSupir"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Tambah Data Supir</title>
    </head>
    <body>
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
        <h1 align="center" class="title">Form Tambah Supir</h1>

        <%
            try {
                if (request.getParameter("simpan").equals("n")) {
        %>
        <blink><h3 align="center" style="color: red">Anda Gagal Menambahkan Data Supir, Silahkan Coba Lagi</h3></blink>
        <%}
            } catch (Exception e) {
            }
        %>
        <p align="center" size="120">Masukan Data Supir</p>
        <p></p>
        <form action="CekTambahSupir.jsp" method="post">
            <div align="center">
                <table width="312" border="0">
                    <tr>
                        <td width="80">Id</td>
                        <td width="222">
                            <label for="idSupir"></label>
                            <input type="text" name="idSupir" id="idSupir" />
                        </td>
                    </tr>
                    <tr>
                        <td>Nama</td>
                        <td>
                            <label for="namaSupir"></label>
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
                            <textarea name="alamat" id="alamat" cols="25" rows="3" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <input type="submit" name="simpan" id="simpan" value="Simpan" align="right" onclick="tambahData()" />
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <p align="center">&nbsp;</p>
        </div>
        
    </body>
</html>
