/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Pemesan;

import com.PengelolaBusdanTrayek.DataBus;
import com.PengelolaBusdanTrayek.DataTrayek;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anak Tuhan
 */
public class DataPemesanan {
    private String kode_booking;
    private String nama_pemesan;
    private String nomor_hp;
    private DataBus bus;
    private DataTrayek trayek;
    private String batas_pembayaran;
    private String tgl_keberangkatan;
    private String email;
    private String nomor_seat;
    private String status_seat;
    private String tgl_pemesanan;
    private int harga;
    private static Connection conn;

    public DataPemesanan() {
    }

    public DataPemesanan(Connection koneksi) {
        conn = koneksi;
    }

    public String getTgl_pemesanan() {
        return tgl_pemesanan;
    }

    public void setTgl_pemesanan(String tgl_pemesanan) {
        this.tgl_pemesanan = tgl_pemesanan;
    }
   
    public String getKode_booking() {
        return kode_booking;
    }

    public void setKode_booking(String kode_booking) {
        this.kode_booking = kode_booking;
    }

    public String getNama_pemesan() {
        return nama_pemesan;
    }

    public void setNama_pemesan(String nama_pemesan) {
        this.nama_pemesan = nama_pemesan;
    }

    public String getNomor_hp() {
        return nomor_hp;
    }

    public void setNomor_hp(String nomor_hp) {
        this.nomor_hp = nomor_hp;
    }

    public DataBus getBus() {
        return bus;
    }

    public void setBus(DataBus bus) {
        this.bus = bus;
    }

    public DataTrayek getTrayek() {
        return trayek;
    }

    public void setTrayek(DataTrayek trayek) {
        this.trayek = trayek;
    }

    public String getBatas_pembayaran() {
        return batas_pembayaran;
    }

    public void setBatas_pembayaran(String batas_pembayaran) {
        this.batas_pembayaran = batas_pembayaran;
    }

    public String getTgl_keberangkatan() {
        return tgl_keberangkatan;
    }

    public void setTgl_keberangkatan(String tgl_keberangkatan) {
        this.tgl_keberangkatan = tgl_keberangkatan;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNomor_seat() {
        return nomor_seat;
    }

    public void setNomor_seat(String nomor_seat) {
        this.nomor_seat = nomor_seat;
    }

    public String getStatus_seat() {
        return status_seat;
    }

    public void setStatus_seat(String status_seat) {
        this.status_seat = status_seat;
    }

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }
    
    public static String generateKodeBooking() throws SQLException{
        Statement stmt = conn.createStatement();
        String sql = "select TO_CHAR(Sysdate,'fmDDMMYYYY')||'-'||nomorkodebooking() AS \"KODE_BOOKING\" FROM DATAPEMESANAN";
        String kodBook="";
        ResultSet rset = stmt.executeQuery(sql);
        while (rset.next()) {
            kodBook = rset.getString("KODE_BOOKING");
        }
        conn.commit();
        return kodBook;
    }
    
    public static void pesanButton(DataPemesanan pesan) throws SQLException {
        String sql = "insert into DATAPEMESANAN (kode_booking,nama_pemesan,nomor_hp,"
                + "nomor_kendaraan,id_trayek,batas_pembayaran,tgl_keberangkatan,email,nomor_seat,status_seat,harga,tgl_Pemesanan) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, generateKodeBooking());
        pstmt.setString(2, pesan.getNama_pemesan());
        pstmt.setString(3, pesan.getNomor_hp());
        pstmt.setString(4, pesan.getBus().getNomor_kendaraan());
        pstmt.setString(5, pesan.getTrayek().getIDTrayek());
        pstmt.setString(6, pesan.getBatas_pembayaran());
        pstmt.setString(7, pesan.getTgl_keberangkatan());
        pstmt.setString(8, pesan.getEmail());
        pstmt.setString(9, pesan.getNomor_seat());
        pstmt.setString(10, pesan.getStatus_seat());
        pstmt.setString(11, pesan.getHarga()+"");
        pstmt.setString(12, pesan.getTgl_pemesanan()+"");
        pstmt.executeUpdate();
        conn.commit();
        conn.close();
    }
     public List<DataBus> LihatButton(String kelasbus) throws SQLException, Exception {
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            conn.setAutoCommit(false);
            statement = conn.prepareStatement("select * DATABUS where kelas_bus ='"+kelasbus+"'");
            result = statement.executeQuery();
            List<DataBus> brgs = new ArrayList<DataBus>();
            while (result.next()) {
                DataBus db = new DataBus();

                db.setNomor_kendaraan(result.getString("nomor_kendaraan"));
                db.setKelas_bus(result.getString("kelas_bus"));
                db.setJumlah_seat(Integer.parseInt(result.getString("jumlah_seat")));
                db.setTahun_rakit(Integer.parseInt(result.getString("Tahun_Rakit")));
                brgs.add(db);
            }

            conn.commit();
            return brgs;
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
}
