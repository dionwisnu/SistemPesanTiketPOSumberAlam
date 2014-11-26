/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.PengelolaSupir;

import com.tools.Koneksi;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author Dion Wisnu
 */
public class EksekusiDataSupir {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        DataSupir dataSupir = new DataSupir();
        System.out.print("Masukan ID Supir   : ");
        String idSpr = sc.next();
        dataSupir.setIdSupir(idSpr);
        System.out.print("Masukan nama supir : ");
        String nmSpr = sc.next();
        dataSupir.setNamaSupir(nmSpr);
        System.out.print("Masukan nomor telepon  : ");
        String noTlp = sc.next();
        dataSupir.setNomorHP(noTlp);
        System.out.print("Masukan alamat : ");
        String almt = sc.next();
        dataSupir.setAlamat(almt);

//        System.out.print("Masukan kode supir yang ingin dihapus : ");
//        String key = sc.next();
        try {
            Koneksi kon = new Koneksi();
            kon.getDBConnection();
            dataSupir.tambahSupir(dataSupir);
//            boolean hasil = DataSupirControl.getKoneksiDataSupir().cariSupir(idSpr);
//            System.out.println(hasil);
//            int jumlah = DataSupirControl.getKoneksiDataSupir().hitungDataSupir();
//            System.out.println("Jumlah Supir : " + jumlah);
//            DataSupirControl.getKoneksiDataSupir().UpdateDataSupir(dataSupir, idSpr);
            System.out.println("TambahBerhasil");
        } catch (SQLException ex) {
            System.out.println("gagal = " + ex.getMessage());
        }
    }
}
