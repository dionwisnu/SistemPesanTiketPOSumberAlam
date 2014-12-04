package com.Agen;

import com.Pemesan.DataPemesanan;
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
    private DataPemesanan kode_boking;
    private String waktu_bayar;
    private String status_keberangkatan;
    private String tanggal_bayar;
    private long total_bayar;
    private static Connection conn;
    private DataPemesanan transaksi;

    public DataPemesanan getTransaksi() {
        return transaksi;
    }

    public void setTransaksi(DataPemesanan transaksi) {
        this.transaksi = transaksi;
    }

    public DataTransaksia() {
    }

    public DataTransaksia(Connection koneksi) {
        conn = koneksi;
    }

    public List<DataTransaksia> tampilTransaksi() throws SQLException {
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            conn.setAutoCommit(false);
            statement = conn.prepareStatement("select * from DATA_TRANSAKSI_RPLO");
            result = statement.executeQuery();
            List<DataTransaksia> transaksia = new ArrayList<DataTransaksia>();
            while (result.next()) {
                DataTransaksia dt = new DataTransaksia();
                DataPemesanan dp = new DataPemesanan();

                dt.setKode_bayar(result.getString("kode_pembayaran"));
                dt.setKode_boking(dp);
                dp.setKode_booking(result.getString("kode_boking"));
                dt.setWaktu_bayar(result.getString("waktu_bayar"));
                dt.setTotal_bayar(Long.parseLong(result.getString("total_bayar")));
                dt.setStatus_keberangkatan(result.getString("status_keberangkatan"));
                dt.setTanggal_bayar(result.getString("tanggal_bayar"));
                transaksia.add(dt);
            }

            conn.commit();
            return transaksia;
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
    
    public List<DataTransaksia> searchBoking(String kunci) throws SQLException {
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            conn.setAutoCommit(false);
            statement = conn.prepareStatement("select * from DATA_TRANSAKSI_RPLO where "
                    + "kode_boking = '" + kunci + "'");
            result = statement.executeQuery();
            List<DataTransaksia> transaksia = new ArrayList<DataTransaksia>();
            while (result.next()) {
                DataTransaksia dt = new DataTransaksia();
                DataPemesanan dp = new DataPemesanan();

                dt.setKode_bayar(result.getString("kode_pembayaran"));
                dp.setKode_booking(result.getString("kode_boking"));
                dt.setKode_boking(dp);
                dt.setWaktu_bayar(result.getString("waktu_bayar"));
                dt.setTotal_bayar(Long.parseLong(result.getString("total_bayar")));
                dt.setStatus_keberangkatan(result.getString("status_keberangkatan"));
                dt.setTanggal_bayar(result.getString("tanggal_bayar"));
                transaksia.add(dt);
            }

            conn.commit();
            return transaksia;
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

    public List<DataTransaksia> searchBayar(String kunci) throws SQLException {
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            conn.setAutoCommit(false);
            statement = conn.prepareStatement("select * from DATA_TRANSAKSI_RPLO where "
                    + "kode_pembayaran = '" + kunci + "'");
            result = statement.executeQuery();
            List<DataTransaksia> transaksia = new ArrayList<DataTransaksia>();
            while (result.next()) {
                DataTransaksia dt = new DataTransaksia();
                DataPemesanan dp = new DataPemesanan();

                dt.setKode_bayar(result.getString("kode_pembayaran"));
                dp.setKode_booking(result.getString("kode_boking"));
                dt.setKode_boking(dp);
                dt.setWaktu_bayar(result.getString("waktu_bayar"));
                dt.setTotal_bayar(Long.parseLong(result.getString("total_bayar")));
                dt.setStatus_keberangkatan(result.getString("status_keberangkatan"));
                dt.setTanggal_bayar(result.getString("tanggal_bayar"));
                transaksia.add(dt);
            }

            conn.commit();
            return transaksia;
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
    
    public void inputTransaksi(DataTransaksia agen) throws SQLException {
        String sql = "insert into DATA_TRANSAKSI_RPLO (kode_pembayaran,tanggal_bayar,"
                + "waktu_bayar,total_bayar,kode_boking, status_keberangkatan) "
                + "values(?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, generateKodeBooking());
        ps.setString(2, agen.getTanggal_bayar());
        ps.setString(3, agen.getWaktu_bayar());
        ps.setString(4, agen.getTotal_bayar() + "");
        ps.setString(5, agen.getKode_boking().getKode_booking());
        ps.setString(6, agen.getStatus_keberangkatan());
        ps.executeUpdate();
        conn.commit();
//        conn.close();
    }

    public String generateKodeBooking() throws SQLException {
        String kodBook;
        kodBook = getTanggal_bayar().substring(3, 6) + "" + getKode_boking();
        return kodBook;
    }

    public void batalTransaksi(DataTransaksia agen) throws SQLException {
        String sql = "delete from DATA_TRANSAKSI_RPLO where kode_pembayaran = ?";
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

    public DataPemesanan getKode_boking() {
        return kode_boking;
    }

    public void setKode_boking(DataPemesanan kode_boking) {
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

    public long getTotal_bayar() {
        return total_bayar;
    }

    public void setTotal_bayar(long total_bayar) {
        this.total_bayar = total_bayar;
    }
}
