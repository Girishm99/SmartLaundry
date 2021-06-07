package com.org.model;


import com.org.dc.DAL;
import java.sql.*;
import java.util.*;
public class Custdetail {
    int cust_id;
    String cust_name;
    String cust_contact;
    String cust_email;
    String cust_location;
    String cust_bldg_soc;
    String room_flat_no;
    String cust_password; 
    //cust_name,cust_contact,cust_email,cust_location,cust_bldg_soc,room_flat_no,cust_password

    public int getCust_id() {
        return cust_id;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public String getCust_name() {
        return cust_name;
    }

    public void setCust_name(String cust_name) {
        this.cust_name = cust_name;
    }

    public String getCust_contact() {
        return cust_contact;
    }

    public void setCust_contact(String cust_contact) {
        this.cust_contact = cust_contact;
    }

    public String getCust_email() {
        return cust_email;
    }

    public void setCust_email(String cust_email) {
        this.cust_email = cust_email;
    }

    public String getCust_location() {
        return cust_location;
    }

    public void setCust_location(String cust_location) {
        this.cust_location = cust_location;
    }

    public String getCust_bldg_soc() {
        return cust_bldg_soc;
    }

    public void setCust_bldg_soc(String cust_bldg_soc) {
        this.cust_bldg_soc = cust_bldg_soc;
    }

    public String getRoom_flat_no() {
        return room_flat_no;
    }

    public void setRoom_flat_no(String room_flat_no) {
        this.room_flat_no = room_flat_no;
    }

    public String getCust_password() {
        return cust_password;
    }

    public void setCust_password(String cust_password) {
        this.cust_password = cust_password;
    }
    
    public String checkLogin(String cust_email,String cust_password){
        DAL d=new DAL();
        try{
            String sql="select * from cust_detail where cust_email='"+cust_email+"'"
                    + "and cust_password='"+cust_password+"'";
            ResultSet rs=d.executeQuery(sql);
            if(rs.next()){
               this.setCust_name(rs.getString("cust_name"));
                this.setCust_id(rs.getInt("cust_id"));
                 this.setCust_location(rs.getString("cust_location"));
                this.setCust_bldg_soc(rs.getString("cust_bldg_soc"));
                this.setCust_contact(rs.getString("cust_contact"));
                this.setCust_email(rs.getString("cust_email"));
                this.setRoom_flat_no(rs.getString("room_flat_no"));
                
                String cust_name= rs.getString("cust_name");
                
                  return cust_name;
            }else{
                return null;
            }
            
        }catch(SQLException e){
            System.out.println(e);
            return null;
        }
    }
    
    public Custdetail getOnecustomer(int cust_id){
        DAL d=new DAL();
        Custdetail c=new Custdetail();
        try {
            String sql="select * from cust_detail where cust_id="+cust_id;
            ResultSet rs=d.executeQuery(sql);
            if(rs.next()){
                c.setCust_bldg_soc(rs.getString("cust_bldg_soc"));
                c.setCust_contact(rs.getString("cust_contact"));
                c.setCust_email(rs.getString("cust_email"));
                c.setCust_id(rs.getInt("cust_id"));
                c.setCust_location(rs.getString("cust_location"));
                c.setCust_name(rs.getString("cust_name"));
                c.setCust_password(rs.getString("cust_password"));
                c.setRoom_flat_no(rs.getString("room_flat_no"));
                return c;
            }else{
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
    
    public ArrayList<Custdetail> getAllcustomer(){
        DAL d=new DAL();
        ArrayList<Custdetail> al=new ArrayList<Custdetail>();
        try {
            String sql="select * from cust_detail";
            ResultSet rs=d.executeQuery(sql);
            while(rs.next()){
                Custdetail c=new Custdetail();
                c.setCust_bldg_soc(rs.getString("cust_bldg_soc"));
                c.setCust_contact(rs.getString("cust_contact"));
                c.setCust_email(rs.getString("cust_email"));
                c.setCust_id(rs.getInt("cust_id"));
                c.setCust_location(rs.getString("cust_location"));
                c.setCust_name(rs.getString("cust_name"));
                c.setCust_password(rs.getString("cust_password"));
                c.setRoom_flat_no(rs.getString("room_flat_no"));
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
            String sql="insert into cust_detail(cust_name,cust_contact,cust_email,cust_location,cust_bldg_soc,room_flat_no,cust_password)values"
                    + "('"+this.getCust_name()+"','"+this.getCust_contact()+"','"+this.getCust_email()+"','"+this.getCust_location()+"','"+this.getCust_bldg_soc()+"','"+this.getRoom_flat_no()+"','"+this.getCust_password()+"')";
             
            return d.executeDML(sql);
          
        } catch (Exception e) {
            System.out.println(e);
           return 0;
        }
    } 
    
    public ResultSet update(int Cust_id){
        DAL d=new DAL();
        try {
           String sql="update cust_detail set cust_name='',cust_contact='',cust_email='',cust_location='',cust_bldg_soc='',room_flat_no='',cust_password='' where cust_id="+Cust_id;
            return d.executeQuery(sql);
        } catch (Exception sql) {
            System.out.println(sql);
            return null;
        }
    }
    
   public int delete(int cust_id){
        DAL d=new DAL();
        try {
            String sql="delete from cust_detail where cust_id="+cust_id;
            return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }


   
}
