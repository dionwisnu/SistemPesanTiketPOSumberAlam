/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.PengelolaSupir;

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
public class DataSupir {

    private String idSupir;
    private String namaSupir;
    private String nomorHP;
    private String alamat;
    private static Connection conn;

    public DataSupir() {
    }

    public DataSupir(Connection koneksi) {
        conn = koneksi;
    }

    public String getIdSupir() {
        return idSupir;
    }

    public void setIdSupir(String idSupir) {
        this.idSupir = idSupir;
    }

    public String getNamaSupir() {
        return namaSupir;
    }

    public void setNamaSupir(String namaSupir) {
        this.namaSupir = namaSupir;
    }

    public String getNomorHP() {
        return nomorHP;
    }

    public void setNomorHP(String nomorHP) {
        this.nomorHP = nomorHP;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public void tambahSupir(DataSupir supir) throws SQLException {
        PreparedStatement pstmt = null;
        try {
            String sql = "insert into DATASUPIR (idsupir,namasupir,nomorHP,alamat)"
                    + "values(?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, supir.getIdSupir());
            pstmt.setString(2, supir.getNamaSupir());
            pstmt.setString(3, supir.getNomorHP());
            pstmt.setString(4, supir.getAlamat());
            pstmt.executeUpdate();
            conn.commit();
            conn.close();
        } catch (SQLException exception) {
            conn.rollback();
            System.out.println("Tambah Data Supir gagal = " + exception.getMessage());
            throw exception;
        } finally {
            try {
                conn.setAutoCommit(true);
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException exception) {
                throw exception;
            }
        }
    }

    public void HapusDataSupir(String key) throws SQLException {
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            copotSupirDariBus(key);
            statement = conn.prepareStatement("delete from datasupir where idsupir = '" + key + "'");
            result = statement.executeQuery();
            conn.commit();
            System.out.println("Hapus Berhasil");
        } catch (SQLException exception) {
            conn.rollback();
            System.out.println("Hapus gagal :" + exception.getMessage());
            throw exception;
        }
    }

    public List<DataSupir> lihatDataSupir() throws SQLException {
        Statement stmt = conn.createStatement();
        String sql = "select * from datasupir";
        int jumlahSupir = 0;
        List<DataSupir> listSupir = new ArrayList<DataSupir>();

        try {
            ResultSet rset = stmt.executeQuery(sql);
            while (rset.next()) {
                DataSupir ds = new DataSupir();
                ds.setIdSupir(rset.getString("idSupir"));
                ds.setNamaSupir(rset.getString("namasupir"));
                ds.setAlamat(rset.getString("alamat"));
                ds.setNomorHP(rset.getString("nomorhp"));
                listSupir.add(ds);
            }
        } catch (SQLException ex) {
            System.out.println("Gagal hitung jumlah supir = " + ex.getMessage());
        }
        return listSupir;
    }

    public boolean cekSupir(String id_Supir) throws SQLException {
        Statement stmt = conn.createStatement();
        String sql = "select idSupir from datasupir where idSupir='" + id_Supir + "'";
        DataSupir ds = new DataSupir();
        boolean status;
        try {
            ResultSet rset = stmt.executeQuery(sql);
            while (rset.next()) {

                ds.setIdSupir(rset.getString("idSupir"));
            }
            
            if (ds.getIdSupir().equals("")) {
                status = false;
            } else {
                status = true;
            }
            System.out.println("status : "+status);
            return status;
        } catch (SQLException ex) {
            System.out.println("Gagal hitung jumlah supir = " + ex.getMessage());
            return false;
        }

    }
    private void copotSupirDariBus(String id_supir) throws SQLException{
        PreparedStatement statement = null;
        try {
            conn.setAutoCommit(false);
            String sql = "update databus set idsupir='' where idsupir='"+id_supir+"'";
            statement = conn.prepareStatement(sql);
            statement.executeUpdate();
            conn.commit();
            System.out.println("Update Data Supir Berhasil");
        } catch (SQLException ex) {
            conn.rollback();
            System.out.println("Gagal Update : " + ex.getMessage());
        }
    }
    
    
    public void UpdateDataSupir(DataSupir dataSupir, String key) throws SQLException {
        PreparedStatement statement = null;
        try {
            conn.setAutoCommit(false);
            String sql = "update datasupir set idsupir=?, namasupir=?, nomorhp=?, "
                    + "alamat=? where idsupir=?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, dataSupir.getIdSupir());
            statement.setString(2, dataSupir.getNamaSupir());
            statement.setString(3, dataSupir.getNomorHP());
            statement.setString(4, dataSupir.getAlamat());
            statement.setString(5, key);
            statement.executeUpdate();
            conn.commit();
            System.out.println("Update Data Supir Berhasil");
        } catch (SQLException ex) {
            conn.rollback();
            System.out.println("Gagal Update : " + ex.getMessage());
        }
    }
}