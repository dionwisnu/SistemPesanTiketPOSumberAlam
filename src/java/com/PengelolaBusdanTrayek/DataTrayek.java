/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.PengelolaBusdanTrayek;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Anak Tuhan
 */
public class DataTrayek {

    private String IDTrayek;
    private String NomorKendaraan;
    private String KotaBerangkat;
    private String KotaTujuan;
    private String JamKeberangkatan;
    private Connection conn;

    public DataTrayek() {
    }
    
    public DataTrayek(Connection koneksi) {
        conn=koneksi;
    }

    public String getIDTrayek() {
        return IDTrayek;
    }

    public void setIDTrayek(String IDTrayek) {
        this.IDTrayek = IDTrayek;
    }

    public String getNomorKendaraan() {
        return NomorKendaraan;
    }

    public void setNomorKendaraan(String NomorKendaraan) {
        this.NomorKendaraan = NomorKendaraan;
    }

    public String getKotaBerangkat() {
        return KotaBerangkat;
    }

    public void setKotaBerangkat(String KotaBerangkat) {
        this.KotaBerangkat = KotaBerangkat;
    }

    public String getKotaTujuan() {
        return KotaTujuan;
    }

    public void setKotaTujuan(String KotaTujuan) {
        this.KotaTujuan = KotaTujuan;
    }

    public String getJamKeberangkatan() {
        return JamKeberangkatan;
    }

    public void setJamKeberangkatan(String JamKeberangkatan) {
        this.JamKeberangkatan = JamKeberangkatan;
    }
    
    public void tambahTrayek(DataTrayek bus) throws SQLException {
        String sql = "insert into DATATRAYEK (nomor_kendaraan,kelas_bus,jumlah_seat,tahun_rakit,id_supir" + ") "
                + "values(?,?,?,?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, bus.getIDTrayek());
        pstmt.setString(2, bus.getJamKeberangkatan());
        pstmt.setString(3, bus.getKotaBerangkat() + "");
        pstmt.setString(4, bus.getKotaTujuan() + "");
//        pstmt.setString(5, bus.);
        pstmt.executeUpdate();
        conn.commit();
        conn.close();
    }
    
    public void updateTrayek(String nomor_kendaraan, DataTrayek trayek) throws SQLException {
        String ID_Trayek=trayek.getIDTrayek();
        String kotaBerangkat=trayek.getKotaBerangkat();
        String kotaTujuan=trayek.getKotaTujuan();
        String jamKeberangkatan=trayek.getJamKeberangkatan();
        String sql = "update DATATRAYEK set id_trayek ='"+ID_Trayek+"' , jamkeberangkatan = '"+jamKeberangkatan+"' , "
                + "kotaberangkat = '"+kotaBerangkat+"' , kotatujuan = '"+kotaTujuan+"' "
                + "where nomor_kendaraan = '"+nomor_kendaraan+"'";
        Statement stat = conn.createStatement();
        stat.executeUpdate(sql);
        conn.commit();
        conn.close();
    }
    
    public void hapusTrayek(String nomor_kendaraan) throws SQLException {
        String sql = "DELETE FROM DATATRAYEK where nomor_kendaraan like ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, nomor_kendaraan);
        pstmt.executeUpdate();
        conn.commit();
        conn.close();
    }
}