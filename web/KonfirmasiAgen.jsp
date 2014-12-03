<%-- 
    Document   : KonfirmasiAgen
    Created on : Dec 3, 2014, 9:08:56 AM
    Author     : Pace_2
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Agen.DataTransaksia"%>
<%@page import="com.tools.Koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Konfirmasi Transaksi</title>
    </head>
    <body>
        <%
            //String boking = request.getParameter("boking");
           // String tanggal = request.getParameter("tanggal");
           // String waktu = request.getParameter("waktu");
          //  int total = Integer.parseInt(request.getParameter("total"));
           // String status = request.getParameter("status");

            Koneksi dbc = new Koneksi();
            DataTransaksia dt = new DataTransaksia(dbc.getDBConnection());
            List<DataTransaksia> transaksi = new ArrayList<DataTransaksia>();
//        for (int i = 0; i < transaksi.size(); i++) {
            //dt.setKode_boking(boking);
          //  dt.setTanggal_bayar(tanggal);
           // dt.setWaktu_bayar(waktu);
           // dt.setTotal_bayar(total);
            //dt.setStatus_keberangkatan(status);
            //dt.inputTransaksi(dt);
            
            dt.setKode_boking("aaa");
            dt.setTanggal_bayar("10-Nov-14");
            dt.setWaktu_bayar("10:15");
            dt.setTotal_bayar(150000);
            dt.setStatus_keberangkatan("berangkat");
            dt.inputTransaksi(dt);
        %>
    </body>
</html>
