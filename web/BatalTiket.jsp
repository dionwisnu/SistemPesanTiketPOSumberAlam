<%-- 
    Document   : BatalTiket
    Created on : Nov 11, 2014, 11:15:55 PM
    Author     : Pace_2
--%>

<%@page import="com.Pemesan.DataPemesanan"%>
<%@page import="com.Agen.DataTransaksia"%>
<%@page import="com.tools.Koneksi"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--<jsp:useBean id="dt" scope="application" class="agen.DataTransaksi"/>--%>
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
                    <li><a href="MenuAgen.jsp"><span>Home</span></a></li>
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
                <p>Kode pembayaran</p><p><input type="text" name="kode"/></p>                
                <p class="submit"><input type="submit" value="Cari"/></p>
            </div>
        </form>
        <%
            String kode = request.getParameter("kode");
            Koneksi dbc = new Koneksi();
            DataTransaksia dt = new DataTransaksia(dbc.getDBConnection());
            DataPemesanan dp = new DataPemesanan();
            List<DataTransaksia> transaksi = new ArrayList<DataTransaksia>();
            transaksi = dt.searchBayar(kode);
        %>
        <br><br>

        <%for (int i = 0; i < transaksi.size(); i++) {%>
        <div class="login h1">
            <p>
                <!--<form action="BatalTiket.jsp" methot="get">-->
            <table>
                <tr>
                    <td>Kode Pembayaran</td>
                    <td>
                        <% out.print(transaksi.get(i).getKode_bayar()); %>
                        <input type="hidden" name="bayar" value="transaksi.get(i).getKode_bayar())"/>
                    </td>
                </tr>
                <tr>
                    <td>Tanggal Pembayaran</td>
                    <td><% out.print(transaksi.get(i).getTanggal_bayar().substring(0, 11)); %></td>
                </tr>
                <tr>
                    <td>Waktu Pembayaran</td>
                    <td><% out.print(transaksi.get(i).getWaktu_bayar()); %></td>
                </tr>
                <tr>
                    <td>Total Pembayaran</td>
                    <td><% out.print(transaksi.get(i).getTotal_bayar()); %></td>
                </tr>
                <tr>
                    <td>Kode Boking</td>
                    <td><% out.print(transaksi.get(i).getKode_boking().getKode_booking()); %></td>
                </tr>
                <tr>
                    <td></td>
                    <td><p class="submit"><input type="submit" value="Batal"/></td>
                </tr>
            </table>                
            <!--</form>-->            
        </p>
    </div>
    <%}%>

    <%%>
</body>
</html>
