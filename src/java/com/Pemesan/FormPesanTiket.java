/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Pemesan;

import com.PengelolaBusdanTrayek.DataBus;
import com.PengelolaBusdanTrayek.DataTrayek;
import com.tools.Koneksi;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Anak Tuhan
 */
public class FormPesanTiket {
private Connection conn;
    public static void main(String[] args) throws SQLException {
        Koneksi kn = new Koneksi();
        DataPemesanan pesan = new DataPemesanan(kn.getDBConnection());
        pesan.setNama_pemesan("Rekiyan seto");
        pesan.setNomor_hp("0857654390");
        DataBus bus = new DataBus();
        bus.setNomor_kendaraan("AD1234CJ");
        pesan.setBus(bus);
        DataTrayek trayek = new DataTrayek();
        trayek.setIDTrayek("JOGLO");
        pesan.setTrayek(trayek);
        pesan.setBatas_pembayaran("2:00");
        pesan.setTgl_keberangkatan("30-NOV-2014");
        pesan.setTgl_pemesanan("12-NOV-2014");
        pesan.setEmail("seto@gmail.com");
        pesan.setNomor_seat("3");
        pesan.setStatus_seat("terpesan");
        pesan.setHarga(130000);
//        DataPemesanan.pesanButton(pesan);
        System.out.println(DataPemesanan.generateKodeBooking());
    }
}
