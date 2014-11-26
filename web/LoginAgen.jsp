<%-- 
    Document   : LoginAgen
    Created on : Nov 11, 2014, 9:32:17 PM
    Author     : Pace
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agen LogIn</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/layout.css">
        <link rel="stylesheet" href="css/form.css">
        <link href="css/default.css" rel="stylesheet" type="text/css">
        <script src="js/jquery.min.js"></script>
        <script src="js/zebra_datepicker.js"></script>
        <link rel="stylesheet" href="css/default.css" />
        <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="js/zebra_datepicker.js" type="text/javascript"></script>
         <script>
            $(document).ready(function() {
                $('#tanggal').Zebra_DatePicker({
                    format: 'd-F-Y',
                    months: ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'],
                    days: ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu'],
                    days_abbr: ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu']
                });
            });
        </script>
        <style>
     
        </style>
    </head>
    <body background="sumberalam/background.jpg">
        <div>
            <h1><img src="sumberalam/header.jpg" width="1340" height="200" ></a></h1>
        </div>
        <pre>
            <br><br><br>
        </pre>
        <section class="container">
            <div class="login h1">
                <form action="MenuAgen.jsp" method="post">
                    <table border align="center" cellpadding="20">
                <tr>
                    <td>
                        <table border cellspacing="0" cellpadding="5">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>user</td>
                                            <td><input type="text" name="user"></td>
                                        </tr>
                                        <tr>
                                            <td>password</td>
                                            <td><input type="password" name="passwd"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td align="right"><input type="submit" value="login"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>                      
                    </td>
                </tr>
            </table>
                </form>
            </div>
        </section>
    </body>
</html>
