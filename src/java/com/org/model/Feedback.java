package com.org.model;


import com.org.dc.DAL;
import java.sql.*;
import java.util.*;
public class Feedback {
    int f_id;
    String f_name;
    String f_email;
    String f_message;
    public int getF_id() {
        return f_id;
    }

    public void setF_id(int f_id) {
        this.f_id = f_id;
    }

    public String getF_name() {
        return f_name;
    }

    public void setF_name(String f_name) {
        this.f_name = f_name;
    }

    public String getF_email() {
        return f_email;
    }

    public void setF_email(String f_email) {
        this.f_email = f_email;
    }

    public String getF_message() {
        return f_message;
    }

    public void setF_message(String f_message) {
        this.f_message = f_message;
    }
  
     
    //cust_name,cust_contact,cust_email,cust_location,cust_bldg_soc,room_flat_no,cust_password

    
    
  
    
    public Feedback getOnefeedback(int f_id){
        DAL d=new DAL();
        Feedback c=new Feedback();
        try {
            String sql="select * from feedback where f_id="+f_id;
            ResultSet rs=d.executeQuery(sql);
            if(rs.next()){
              
                c.setF_id(rs.getInt("f_id"));
                c.setF_name(rs.getString("f_name"));
                c.setF_email(rs.getString("f_email"));
                c.setF_message(rs.getString("f_message"));
            
                return c;
            }else{
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
    
    public ArrayList<Feedback> getAllfeedback(){
        DAL d=new DAL();
        ArrayList<Feedback> al=new ArrayList<Feedback>();
        try {
            String sql="select * from feedback";
            ResultSet rs=d.executeQuery(sql);
            while(rs.next()){
               Feedback c=new Feedback();
                 c.setF_id(rs.getInt("f_id"));
                c.setF_name(rs.getString("f_name"));
                c.setF_email(rs.getString("f_email"));
                c.setF_message(rs.getString("f_message"));
                al.add(c);
            }
            return al;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
    
  public int save(){
        DAL d=new DAL();
        try {
            String sql="insert into feedback(f_name,f_email,f_message)values"
                    + "('"+this.getF_name()+"','"+this.getF_email()+"','"+this.getF_message()+"')";
             
            return d.executeDML(sql);
          
        } catch (Exception e) {
            System.out.println(e);
           return 0;
        }
    } 
    
    public ResultSet update(int cust_id){
        DAL d=new DAL();
        try {
           String sql="update feedback set fname='',f_email='',f_message='' where f_id="+f_id;
            return d.executeQuery(sql);
        } catch (Exception sql) {
            System.out.println(sql);
            return null;
        }
    }
    
   public int delete(int cust_id){
        DAL d=new DAL();
        try {
            String sql="delete from feedback where f_id="+f_id;
            return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }


   
}
