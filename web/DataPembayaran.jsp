<%-- 
    Document   : DataPembayaran
    Created on : Nov 11, 2014, 11:12:48 PM
    Author     : Pace_2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pembayaran</title>
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
                    months: ['Januari', 'Februari', 'Maret', 'April', 'May', 'Juni', 'Juli', 'Augustus', 'September', 'October', 'November', 'December'],
                    days: ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu'],
                    days_abbr: ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu']
                });
            });
        </script>
    </head>
    <body background="sumberalam/background.jpg">
        <h1><img src="sumberalam/header.jpg" width="1345" height="200" ></h1>
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
        <section class="container">
            <div class="login h1">
                <h1>Masukan Data Transaksi</h1>
                <form method="get" action="KonfirmasiAgen.jsp" name="demoform">
                    <p>Kode Boking</p><p><input type="text" name="boking"></p>
                    <p>Tanggal bayar</p><p><input type="text" name="tanggal" id="tanggal"/></p>
                    <p>Waktu bayar</p><p><input type="text" name="waktu"></p>
                    <p>Total bayar</p><p><input type="text" name="total"></p>              
                    <p class="submit"><input type="submit" value="Simpan"></p>
                </form>
            </div>
            <div class="login-help">
                <p>Kembali ? <a href="FormMenuUtama.jsp">Untuk kembali ke menu utama</a>.</p>
            </div>

            <div id="ft">
                <div id="" align="center">
                    <table font:color="white"><tr><td><img src="sumberalam/location15.png" width="60" height="60"></td><td>Sukoharjo - Purworejo</td>
                            <td></td><td></td><td><img src="sumberalam/phone17.png" width="60" height="60"></td><td>085-743-130-323</td></table></div>
            </div>
        </section>        
    </body>
</html>
