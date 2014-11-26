/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Agen;

import com.Pemesan.DataPemesanan;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anak Tuhan
 */
public class DataTransaksi {

    private String kode_bayar;
    private String waktu_bayar;
    private int total_bayar;
    private String status_pembayaran;
    private String tanggal_pembayaran;
    private DataPemesanan transaksi;
    private static Connection conn;

    public String getTanggal_pembayaran() {
        return tanggal_pembayaran;
    }

    public void setTanggal_pembayaran(String tanggal_pembayaran) {
        this.tanggal_pembayaran = tanggal_pembayaran;
    }

    public String getStatus_pembayaran() {
        return status_pembayaran;
    }

    public void setStatus_pembayaran(String status_pembayaran) {
        this.status_pembayaran = status_pembayaran;
    }

    public int getTotal_bayar() {
        return total_bayar;
    }

    public void setTotal_bayar(int total_bayar) {
        this.total_bayar = total_bayar;
    }

    public String getWaktu_bayar() {
        return waktu_bayar;
    }

    public void setWaktu_bayar(String waktu_bayar) {
        this.waktu_bayar = waktu_bayar;
    }

    public String getKode_bayar() {
        return kode_bayar;
    }

    public void setKode_bayar(String nomorTransaksi) {
        this.kode_bayar = nomorTransaksi;
    }

    public DataPemesanan getTransaksi() {
        return transaksi;
    }

    public void setTransaksi(DataPemesanan transaksi) {
        this.transaksi = transaksi;
    }

    public List<DataTransaksi> tampilTransaksi() throws SQLException {
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            conn.setAutoCommit(false);
            statement = conn.prepareStatement("select * from DATATRANSAKSI");
            result = statement.executeQuery();
            List<DataTransaksi> transaksi = new ArrayList<DataTransaksi>();
            while (result.next()) {
                DataTransaksi dt = new DataTransaksi();
                DataPemesanan dp = new DataPemesanan();
                dp.setKode_booking(result.getString("kode_boking"));
                dt.setKode_bayar(result.getString("kode_pembayaran"));
                dt.setWaktu_bayar(result.getString("waktu_bayar"));
                dt.setTotal_bayar(Integer.parseInt(result.getString("total_bayar")));
                dt.setStatus_pembayaran(result.getString("status_keberangkatan"));
                dt.setTanggal_pembayaran(result.getString("tanggal_bayar"));
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
        String sql = "insert into DATATRANSAKSI (kode_pembayaran,tanggal_bayar,"
                + "waktu_bayar,total_bayar,kode_boking, status_keberangkatan) "
                + "values(?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, agen.getKode_bayar());
        ps.setString(2, agen.getTanggal_pembayaran());
        ps.setString(3, agen.getWaktu_bayar());
        ps.setString(4, agen.getTotal_bayar() + "");
        ps.setString(5, agen.getTransaksi().getKode_booking());
        ps.setString(6, agen.getStatus_pembayaran());
        ps.executeUpdate();
        conn.commit();
        conn.close();
    }
    
        public void batalTransaksi(DataTransaksi agen) throws SQLException {
        String sql = "delete from DATATRANSAKSI where kode_pembayaran = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, agen.getKode_bayar());
        ps.executeUpdate();
        conn.commit();
        conn.close();
    }
}