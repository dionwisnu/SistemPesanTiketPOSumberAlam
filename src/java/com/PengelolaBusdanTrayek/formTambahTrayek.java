/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.PengelolaBusdanTrayek;

import com.PengelolaSupir.DataSupir;
import com.tools.Koneksi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anak Tuhan
 */
public class formTambahTrayek {
    
    public static void main(String[] args) throws SQLException {
        DataBus bus = new DataBus();
        bus.setNomor_kendaraan("AD1234CJ");
        bus.setKelas_bus("Bisnis");
        bus.setJumlah_seat(50);
        bus.setTahun_rakit(1994);
        DataSupir supir = new DataSupir();
        supir.setIdSupir("125314038");
        bus.setSupir(supir);
//        Kontrol.getKoneksi().tambahBus(bus);
//        Kontrol.getKoneksi().updateBus("AD1234CJ",bus);
//        Kontrol.getKoneksi().hapusBus("AD1234CJ");
        
    }
}
