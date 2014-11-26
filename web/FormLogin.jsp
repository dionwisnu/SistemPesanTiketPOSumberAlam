<%-- 
    Document   : Form Login
    Created on : Nov 15, 2014, 9:38:26 PM
    Author     : Dion Wisnu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Login Owner</title>
        <style type="text/css">
            body,td,th {
                font-family: Verdana, Geneva, sans-serif;
                font-size: 16px;
            }
            .title {
                text-align: center;
            }
            .buttonLogin {
                font-family: Verdana, Geneva, sans-serif;
            }
        </style>

    </head>

    <body>
        <p align="center"><img src="sumberalam/HeaderSA.png" width="350" height="100"/></p>
        <h1 class="title">Halaman Login Admin</h1>
        <p>&nbsp;</p>
        <%try {
                if (request.getParameter("error").equals("y")) {

        %>

        <blink><h3 align="center" style="color: red">username dan password salah... coba lagi!!! </h3></blink>
            <%                             }
                } catch (Exception e) {
                }
            %>
        <form action="CekLoginAdmin.jsp" method="post">
            <table width="255" border="0" align="center">
                <tr>
                    <td width="97">Username</td>
                    <td width="148">
                        <input type="text" name="username" id="username" />
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="password" id="password" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" name="tombol" value="submit" align="right"  />
                    </td>
                </tr>
            </table>
        </form>
        <p></p>
    </body>
</html>