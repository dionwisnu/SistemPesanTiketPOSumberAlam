/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.PengelolaBusdanTrayek;

import com.PengelolaSupir.DataSupir;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import oracle.jdbc.pool.OracleDataSource;

/**
 *
 * @author Anak Tuhan
 */
public class DataBus {
    String nomor_kendaraan;
    String kelas_bus;
    int jumlah_seat;
    int tahun_rakit;
    DataSupir Supir;    
    private static Connection conn;

    public DataBus() {
    }

    public DataBus(Connection koneksi) {
        conn=koneksi;
    }
    
    public String getNomor_kendaraan() {
        return nomor_kendaraan;
    }

    public void setNomor_kendaraan(String nomor_kendaraan) {
        this.nomor_kendaraan = nomor_kendaraan;
    }

    public String getKelas_bus() {
        return kelas_bus;
    }

    public void setKelas_bus(String kelas_bus) {
        this.kelas_bus = kelas_bus;
    }

    public int getJumlah_seat() {
        return jumlah_seat;
    }

    public void setJumlah_seat(int jumlah_seat) {
        this.jumlah_seat = jumlah_seat;
    }

    public int getTahun_rakit() {
        return tahun_rakit;
    }

    public void setTahun_rakit(int tahun_rakit) {
        this.tahun_rakit = tahun_rakit;
    }

    public DataSupir getSupir() {
        return Supir;
    }

    public void setSupir(DataSupir Supir) {
        this.Supir = Supir;
    }
    
    public void tambahBus(DataBus bus) throws SQLException {
        String sql = "insert into DATABUS (nomor_kendaraan,kelas_bus,jumlah_seat,tahun_rakit,id_supir" + ") "
                + "values(?,?,?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, bus.getNomor_kendaraan());
        pstmt.setString(2, bus.getKelas_bus());
        pstmt.setString(3, bus.getJumlah_seat() + "");
        pstmt.setString(4, bus.getTahun_rakit() + "");
        pstmt.setString(5, bus.getSupir().getIdSupir());
        pstmt.executeUpdate();
        conn.commit();
        conn.close();
    }

    public void updateBus(String nomor_kendaraan, DataBus bus) throws SQLException {
        String kelas_bus=bus.getKelas_bus();
        String jumlah_seat=bus.getJumlah_seat()+"";
        String tahun_rakit=bus.getTahun_rakit()+"";
        String id_supir=bus.getSupir().getIdSupir();
        String sql = "update DATABUS set kelas_bus ='"+kelas_bus+"' , jumlah_seat = '"+jumlah_seat+"' , "
                + "tahun_rakit = '"+tahun_rakit+"' , id_supir = '"+id_supir+"' "
                + "where nomor_kendaraan = '"+nomor_kendaraan+"'";
        Statement stat = conn.createStatement();
        stat.executeUpdate(sql);
        conn.commit();
        conn.close();
    }
    
    public void hapusBus(String nomor_kendaraan) throws SQLException {
        String sql = "DELETE FROM DATABUS where nomor_kendaraan like ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, nomor_kendaraan);
        pstmt.executeUpdate();
        conn.commit();
        conn.close();
    }

    public void LihatButton(DataBus bus) throws SQLException{
        String kelasbus= bus.getKelas_bus();
        String sql = "select * DATABUS where kelas_bus ='"+kelasbus+"'";
        Statement stat = conn.createStatement();
        stat.executeUpdate(sql);
        conn.commit();
        conn.close();
    }
    public List<DataBus> LihatButton(String kelasbus) throws SQLException, Exception {
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            conn.setAutoCommit(false);
            statement = conn.prepareStatement("select * FROM DATABUS where kelas_bus ='"+kelasbus+"'");
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
