
package com.org.model;



import com.org.dc.DAL;
import java.util.*;
import java.sql.*;
import java.lang.Exception;
public class Orderdetail {
  int od_id; 
  int order_id; 
  int cloth_id; 
  int cloth_qty;

    public int getOd_id() {
        return od_id;
    }

    public void setOd_id(int od_id) {
        this.od_id = od_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCloth_id() {
        return cloth_id;
    }

    public void setCloth_id(int cloth_id) {
        this.cloth_id = cloth_id;
    }

    public int getCloth_qty() {
        return cloth_qty;
    }

    public void setCloth_qty(int cloth_qty) {
        this.cloth_qty = cloth_qty;
    }
    
    public Orderdetail getOneorderdetail(int order_id) {
        DAL d = new DAL();
        Orderdetail c = new Orderdetail();
        try {
            String sql = "select * from order_detail where od_id=" + od_id;
            ResultSet rs = d.executeQuery(sql);
            if (rs.next()) {
                c.setOd_id(rs.getInt("od_id"));
                c.setOrder_id(rs.getInt("order_id"));
                c.setCloth_id(rs.getInt("cloth_id"));
                c.setCloth_qty(rs.getInt("cloth_qty"));
                return c;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public ArrayList<Orderdetail> getAllOrderdetail() {
        DAL d = new DAL();
        ArrayList<Orderdetail> al = new ArrayList<Orderdetail>();
        try {
            String sql = "select * from order_detail";
            ResultSet rs = d.executeQuery(sql);
            while (rs.next()) {
                Orderdetail c = new Orderdetail();
                c.setOd_id(rs.getInt("od_id"));
                c.setOrder_id(rs.getInt("order_id"));
                c.setCloth_id(rs.getInt("cloth_id"));
                c.setCloth_qty(rs.getInt("cloth_qty"));
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
            String sql="insert into orderdetail(order_id,cloth_id,cloth_qty)values"
                    + "('"+this.getOrder_id()+"','"+this.getCloth_id()+"','"+this.getCloth_qty()+"')";
            return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
    
    public int update(int cust_id){
        DAL d=new DAL();
        try {
            String sql="update orderdetail set order_id='',cloth_id='',cloth_qty='' where od_id="+od_id;
            return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
    
    public int delete(int od_id){
        DAL d=new DAL();
        try {
            String sql="delete from orderdetail where od_id="+od_id;
            return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
  
}
