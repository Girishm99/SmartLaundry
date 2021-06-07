
package com.org.model;
import com.org.dc.DAL;
import java.sql.*;
import java.util.*;
import java.lang.*;
public class Clothcategory {
    int cc_id;
    String cc_name;
    int laundry_price;
    int iron_rate;
    public int getLaundry_price() {
        return laundry_price;
    }

    public void setLaundry_price(int laundry_price) {
        this.laundry_price = laundry_price;
    }

    public int getIron_rate() {
        return iron_rate;
    }

    public void setIron_rate(int iron_rate) {
        this.iron_rate = iron_rate;
    }
  

    public int getCc_id() {
        return cc_id;
    }   

    public void setCc_id(int cc_id) {
        this.cc_id = cc_id;
    }

    public String getCc_name() {
        return cc_name;
    }

    public void setCc_name(String cc_name) {
        this.cc_name = cc_name;
    }
    
    
    
    public Clothcategory getOneclothcategory(int cc_id){
        DAL d=new DAL();
        Clothcategory c=new Clothcategory();
        try {
            String sql="select * from cloth_category where cc_id="+cc_id;
            ResultSet rs=d.executeQuery(sql);
            if(rs.next()){
                c.setCc_name(rs.getString("cc_name"));
                c.setCc_id(rs.getInt("cc_id"));
                 c.setLaundry_price(rs.getInt("laundry_price"));
                  c.setIron_rate(rs.getInt("iron_rate"));
                return c;
            }else{
                return null;
            }
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    public ArrayList<Clothcategory> getAllclothcategory(){
        DAL d=new DAL();
        ArrayList<Clothcategory> al=new ArrayList<Clothcategory>();
        try {
            String sql="select * from cloth_category";
            ResultSet rs=d.executeQuery(sql);
            while(rs.next()){
                Clothcategory c=new Clothcategory();
                c.setCc_name(rs.getString("cc_name"));
                c.setCc_id(rs.getInt("cc_id"));
                c.setLaundry_price(rs.getInt("laundry_price"));
                  c.setIron_rate(rs.getInt("iron_rate"));
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
            String sql="insert into cloth_category(cc_name,laundry_price,iron_rate)values"
                    + "('"+this.getCc_name()+"','"+this.getLaundry_price()+"','"+this.getIron_rate()+"')";
            //return sql;
return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
    
    public int update(int cc_id){
        DAL d=new DAL();
        try {
            String sql="update cloth_category set cc_name='"+this.getCc_name()+"','"+this.getLaundry_price()+"','"+this.getIron_rate()+"' where cc_id="+cc_id;
            return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
    
    public int delete(int cc_id){
        DAL d=new DAL();
        try {
            String sql="delete from cloth_category where cc_id="+cc_id;
            return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
}
