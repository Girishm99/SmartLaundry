package com.org.dc;
import java.sql.*;
public class DAL {
    private static Connection con = null;
    
   
    private void connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/laundry","root","");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        
    }
    public void disconnect() {
       
        try {
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    
    public int executeDML(String sql) {
        int rownumber=0;
        try {
            connect();
            Statement st = con.createStatement();
            st.executeUpdate(sql,Statement.RETURN_GENERATED_KEYS);
            ResultSet rs= st.getGeneratedKeys();
            if (rs.next())
            {
              rownumber= rs.getInt(1);
            }
            return rownumber;
        } catch (SQLException e) {
            System.out.println(e);
            return rownumber;
        } finally {
            disconnect();
        }
    }

    public ResultSet executeQuery(String sql) {
        try {
            connect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            return rs;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
}
