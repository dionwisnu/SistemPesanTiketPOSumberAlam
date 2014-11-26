<%-- 
    Document   : FormMenuSupir
    Created on : Nov 18, 2014, 12:10:53 PM
    Author     : Dion Wisnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Menu Supir</title>
    </head>
    <body>
        <p align="center"><img src="sumberalam/HeaderSA.png" width="350" height="100"/></p>
        <%try {
                if (request.getParameter("tambah").equals("y")) {

        %>

        <blink><h5 align="center" style="color: green">Data Supir Baru Tersimpan</h5></blink>
            <%                             } else if (request.getParameter("ubah").equals("y")) {
            %>
        <blink><h5 align="center" style="color: green">Update Data Supir Tersimpan</h5></blink>
            <%
            } else if (request.getParameter("hapus").equals("y")) {
            %>
        <blink><h5 align="center" style="color: green">Hapus Data Supir Berhasil</h5></blink>
            <%
                    }
                } catch (Exception e) {
                }
            %>
        <h1 align="center" class="title">Menu Supir</h1>
        <p align="center">&nbsp;</p>
        <form action="CekMenuSupir.jsp" method="post">
            <table width="391" height="162" border="0" align="center">
                <tr>
                    <td width="102" height="102"><img src="Icon/IconAdd.png" width="102" height="100" /></td>
                    <td width="25">&nbsp;</td>
                    <td width="103"><img src="Icon/IconUbahSupir.png" width="102" height="102" /></td>
                    <td width="25">&nbsp;</td>
                    <td width="97"><img src="Icon/IconHapusSupir.png" width="102" height="102" /></td>
                </tr>
                <tr>
                    <td height="21">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <input type="submit" name="tombolSupir" value="Tambah Supir" />
                    </td>
                    <td>&nbsp;</td>
                    <td align="center">
                        <input type="submit" name="tombolSupir" value="Ubah Supir" />
                    </td>
                    <td>&nbsp;</td>
                    <td align="center">
                        <input type="submit" name="tombolSupir" value="Hapus Supir"/>
                    </td>
                </tr>
            </table>
        </form>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <form action="CekLoginAdmin.jsp" method="post">
            <table width="200" border="0" align="center">
                <tr>
                    <td align="center"><input type="submit" name="tombol" value="logout" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
