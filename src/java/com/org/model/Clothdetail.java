
package com.org.model;

import com.org.dc.DAL;
import java.sql.*;
import java.util.*;
public class Clothdetail {
    int cloth_id;
    int cc_id;
    String cloth_name;
    
//cloth_id,cc_id,clothname,iron_rate

    public int getCloth_id() {
        return cloth_id;
    }

    public void setCloth_id(int cloth_id) {
        this.cloth_id = cloth_id;
    }

    public int getCc_id() {
        return cc_id;
    }

    public void setCc_id(int cc_id) {
        this.cc_id = cc_id;
    }

    public String getCloth_name() {
        return cloth_name;
    }

    public void setCloth_name(String cloth_name) {
        this.cloth_name = cloth_name;
    }

 
    
    
    
    public Clothdetail getOneclothdetail(int cloth_id){
        DAL d=new DAL();
        Clothdetail c=new Clothdetail();
        try {
            String sql="select * from cloth_detail where cloth_id="+cloth_id;
            ResultSet rs=d.executeQuery(sql);
            if(rs.next()){
                c.setCc_id(rs.getInt("cc_id"));
                c.setCloth_id(rs.getInt("cloth_id"));
                c.setCloth_name(rs.getString("cloth_name"));
               
                
                return c;
            }else{
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
    
    public ArrayList<Clothdetail> getAllclothdetail(){
        DAL d=new DAL();
        ArrayList<Clothdetail> al = new ArrayList<Clothdetail>();
        try {
            String sql="select * from cloth_detail";
            ResultSet rs=d.executeQuery(sql);
            while(rs.next()){
                Clothdetail c=new Clothdetail();
                
                c.setCloth_id(rs.getInt("cloth_id"));
                c.setCc_id(rs.getInt("cc_id"));
                c.setCloth_name(rs.getString("cloth_name"));
               
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
            String sql="insert into cloth_detail(cloth_name,cc_id)values"
                    + "('"+this.getCloth_name()+"','"+this.getCc_id()+"')";
            //return sql;
            return d.executeDML(sql);
            
        } catch (Exception e) {
            System.out.println(e);
           return 0;
        }
        
    }
    
    public int update(int Cloth_id){
        DAL d=new DAL();
        try {
            String sql="update cloth_detail set cloth_name='',cc_id='' "+Cloth_id;
            return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
    
    public int delete(int Cloth_id){
        DAL d=new DAL();
        try {
            String sql="delete from cloth_detail where cloth_id="+Cloth_id;
           return d.executeDML(sql);
            
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
    
     
}
