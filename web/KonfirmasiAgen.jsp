<%-- 
    Document   : KonfirmasiAgen
    Created on : Dec 3, 2014, 9:08:56 AM
    Author     : Pace_2
--%>

<%@page import="java.io.PrintWriter"%>
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
//            PrintWriter out = response.getWriter();
            String boking = request.getParameter("boking");
            String tanggal = request.getParameter("tanggal");
            String waktu = request.getParameter("waktu");
            String total = request.getParameter("total");
            String status = request.getParameter("status");

            Koneksi dbc = new Koneksi();
            DataTransaksia dt = new DataTransaksia(dbc.getDBConnection());
            List<DataTransaksia> transaksi = new ArrayList<DataTransaksia>();
            try {
                dt.setKode_boking(boking);
                dt.setTanggal_bayar(tanggal);
                dt.setWaktu_bayar(waktu);
                dt.setTotal_bayar(Long.parseLong(total));
                dt.setStatus_keberangkatan("Berangkat");
                dt.inputTransaksi(dt);
            } catch (NullPointerException np) {

            }
            transaksi = dt.searchBoking(boking);
        %>
        Transaksi berhasil
        <table>
            <%for (int i = 0; i < transaksi.size(); i++) {%>
            <tr>
                <td>Kode Pembayaran</td>
                <td><% out.print(transaksi.get(i).getKode_bayar()); %></td>
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
                <td><% out.print(boking); %></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
