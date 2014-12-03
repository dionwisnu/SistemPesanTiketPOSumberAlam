package com.Agen;

import com.tools.Koneksi;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class formDataTransaksi {
    public static void main(String[] args) throws SQLException {
        Koneksi dbc = new Koneksi();
        DataTransaksia dt = new DataTransaksia(dbc.getDBConnection());
        List<DataTransaksia> transaksi = new ArrayList<DataTransaksia>();
//        for (int i = 0; i < transaksi.size(); i++) {
            dt.setKode_boking("aaa");
            dt.setTanggal_bayar("10-Nov-14");
            dt.setWaktu_bayar("10:15");
            dt.setTotal_bayar(150000);
            dt.setStatus_keberangkatan("berangkat");
            dt.inputTransaksi(dt);
//        }
    }
}
