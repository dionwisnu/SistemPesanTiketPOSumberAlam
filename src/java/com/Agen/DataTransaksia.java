package com.Agen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataTransaksia {

    public static Connection getConn() {
        return conn;
    }

    public static void setConn(Connection aConn) {
        conn = aConn;
    }
    private String kode_bayar;
    private String kode_boking;
    private String waktu_bayar;
    private String status_keberangkatan;
    private String tanggal_bayar;
    private int total_bayar;
    private static Connection conn;

    public DataTransaksia() {
    }

    public DataTransaksia(Connection koneksi) {
        conn = koneksi;
    }

    public List<DataTransaksi> tampilTransaksi() throws SQLException {
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            conn.setAutoCommit(false);
            statement = conn.prepareStatement("select * from DATA_TRANSAKSI_RPLO");
            result = statement.executeQuery();
            List<DataTransaksi> transaksi = new ArrayList<DataTransaksi>();
            while (result.next()) {
                DataTransaksi dt = new DataTransaksi();

                dt.setKode_bayar(result.getString("kode_pembayaran"));
//                dt.setKode_boking(result.getString("kode_boking"));
                dt.setWaktu_bayar(result.getString("waktu_bayar"));
                dt.setTotal_bayar(Integer.parseInt(result.getString("total_bayar")));
//                dt.setStatus_keberangkatan(result.getString("status_keberangkatan"));
//                dt.setTanggal_bayar(result.getString("tanggal_bayar"));
                transaksi.add(dt);
            }

            conn.commit();
            return transaksi;
        } catch (SQLException exception) {
            throw exception;
        } finally {
            try {
                conn.setAutoCommit(true);
                if (result != null) {
                    result.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException exception) {
                throw exception;
            }
        }
    }

    public void inputTransaksi(DataTransaksi agen) throws SQLException {
        String sql = "insert into DATA_TRANSAKSI_RPLO (kode_pembayaran,tanggal_bayar,"
                + "waktu_bayar,total_bayar,kode_boking, status_keberangkatan) "
                + "values(?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, generateKodeBooking());
        ps.setString(2, agen.getTanggal_pembayaran());
        ps.setString(3, agen.getWaktu_bayar());
        ps.setString(4, agen.getTotal_bayar() + "");
        ps.setString(5, agen.getTransaksi().getKode_booking());
        ps.setString(6, agen.getStatus_pembayaran());
        ps.executeUpdate();
        conn.commit();
        conn.close();
    }

    public String generateKodeBooking() throws SQLException {
        String kodBook;
        kodBook = getTanggal_bayar() + "" + getKode_boking();
        return kodBook;
    }

    public void batalTransaksi(DataTransaksi agen) throws SQLException {
        String sql = "delete from DATATRANSAKSI where kode_pembayaran = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, agen.getKode_bayar());
        ps.executeUpdate();
        conn.commit();
        conn.close();
    }

    public String getKode_bayar() {
        return kode_bayar;
    }

    public void setKode_bayar(String kode_bayar) {
        this.kode_bayar = kode_bayar;
    }

    public String getKode_boking() {
        return kode_boking;
    }

    public void setKode_boking(String kode_boking) {
        this.kode_boking = kode_boking;
    }

    public String getWaktu_bayar() {
        return waktu_bayar;
    }

    public void setWaktu_bayar(String waktu_bayar) {
        this.waktu_bayar = waktu_bayar;
    }

    public String getStatus_keberangkatan() {
        return status_keberangkatan;
    }

    public void setStatus_keberangkatan(String status_keberangkatan) {
        this.status_keberangkatan = status_keberangkatan;
    }

    public String getTanggal_bayar() {
        return tanggal_bayar;
    }

    public void setTanggal_bayar(String tanggal_bayar) {
        this.tanggal_bayar = tanggal_bayar;
    }

    public int getTotal_bayar() {
        return total_bayar;
    }

    public void setTotal_bayar(int total_bayar) {
        this.total_bayar = total_bayar;
    }
}