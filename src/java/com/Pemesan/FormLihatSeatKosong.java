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
public class FormLihatSeatKosong {
      private Connection conn;

    public static void main(String[] args) throws SQLException {
        Koneksi kn = new Koneksi();
        DataPemesanan pesan = new DataPemesanan(kn.getDBConnection());
            
    }
    }


