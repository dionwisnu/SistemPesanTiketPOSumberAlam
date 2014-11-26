/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tools;


import java.sql.Connection;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import oracle.jdbc.pool.OracleDataSource;

public class Koneksi {
    private String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    private String userid = "hr";
    private String password = "hr";
//    private String jdbcUrl = "jdbc:oracle:thin:@172.23.9.185:1521:orcl";
//    private String userid = "mhs125314036";
//    private String password = "mhs125314036";
//    private String jdbcUrl;
//    private String userid;
//    private String password;
    public Connection conn; 
    
    public Connection getDBConnection() throws SQLException {
        try {
            OracleDataSource ds;
            ds = new OracleDataSource();
            ds.setURL(jdbcUrl);
            conn = ds.getConnection(userid, password);
            System.out.println("Berhasil");
        } catch (SQLException ex) {
            System.out.println("hahahaha");
            JOptionPane.showMessageDialog(null, "Error : "+ex.getMessage());
            return null;
        }
        return conn;
    }
}