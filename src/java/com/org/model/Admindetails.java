
package com.org.model;

import com.org.dc.DAL;
import java.sql.*;

public class Admindetails {
    int admin_id;
    String admin_name;
    String admin_email;
    String admin_password;
//admin_id,admin_name,admin_email,admin_password
    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }
    
     public int getAdmin_id() {
        return admin_id;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public String getAdmin_password() {
        return admin_password;
    }
    
    public String checkLogin(String admin_email,String admin_password){
        DAL d=new DAL();
        try{
            String sql="select * from admin_details where admin_email='"+admin_email+"'"
                    + "and admin_password='"+admin_password+"'";
            ResultSet rs=d.executeQuery(sql);
            if(rs.next()){
                this.setAdmin_name(rs.getString("admin_name"));
                this.setAdmin_id(rs.getInt("admin_id"));
                String admin_name= rs.getString("admin_name");
                return admin_name;
            }else{
                return null;
            }
            
        }catch(SQLException e){
            System.out.println(e);
            return null;
        }
    }
}
