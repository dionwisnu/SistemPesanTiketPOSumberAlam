<%-- 
    Document   : BatalTiket
    Created on : Nov 11, 2014, 11:15:55 PM
    Author     : Pace_2
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DataBaseConnection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="agen.DataTransaksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="dt" scope="application" class="agen.DataTransaksi"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Batal Tiket</title>
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
            $(document).ready(function () {
                $('#tanggal').Zebra_DatePicker({
                    format: 'd-F-Y',
                    months: ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'],
                    days: ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu'],
                    days_abbr: ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu']
                });
            });
        </script>

    </head>
    <body background="sumberalam/background.jpg">
        <div>
            <h1><img src="sumberalam/header.jpg" width="1340" height="200" ></a></h1>
            <div id='cssmenu' >
                <ul>
                    <li><a href="FormMenuUtama.jsp"><span>Home</span></a></li>
                    <li class='has-sub'><a href='#'><span>Pembayaran</span></a>
                        <ul>
                            <li class='has-sub'><a href="DataPembayaran.jsp"><span>Data Pembayaran</span></a>
                            </li>
                            <li class='has-sub'><a href="BatalTiket.jsp"><span>Batal Tiket</span></a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="TampilDataPembayaran.jsp"><span>Tampilkan Data Pembayaran</span></a></li>
                </ul>
            </div>
        </div>
        <form action="BatalTiket.jsp" methot="get">
            <div class="login h1">
                <table>
                    <tr>
                        <td>Kode pembayaran</td>
                        <td><input type="text" name="kode"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="right"><input type="submit" value="Cari"/></td>
                    </tr>
                </table>
            </div>
        </form>
        <%
            String kode = request.getParameter("kode");
        %>
        <br><br><br><br>
        <%
          //  try{
            //  int i = 1;
            //ResultSet rs = dt.cariData(kode);
            //while (rs.next()) {
            //   out.println(rs.getString("kode_pembayaran"));
            //}
            //}catch (SQLException ex){
            // }catch (NumberFormatException num){
            //  }

        %>
    </body>
</html>
