       
package com.org.model;

import com.org.dc.DAL;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Girish Musham
 */
public class Orders {
    int order_id;
    int cust_id;
    String order_date;
    int cloth_qty;
   String cc_id;
    String cloth_name;
    String payment_mode;
    String order_status;
    double total_amount;
    String pick_up_time;
    String delivery_time;
    String pick_up_date;
    String delivery_date;
  
   public String getCc_id() {
        return cc_id;
    }

    public void setCc_id(String cc_id) {
        this.cc_id = cc_id;
    }
  public String getCloth_name() {
        return cloth_name;
    }

    public void setCloth_name(String cloth_name) {
        this.cloth_name = cloth_name;
    }
    public String getDelivery_date() {
        return delivery_date;
    }

    public void setDelivery_date(String delivery_date) {
        this.delivery_date = delivery_date;
    }
    

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getCust_id() {
        return cust_id;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public int getCloth_qty() {
        return cloth_qty;
    }

    public void setCloth_qty(int cloth_qty) {
        this.cloth_qty = cloth_qty;
    }

    public String getPayment_mode() {
        return payment_mode;
    }

    public void setPayment_mode(String payment_mode) {
        this.payment_mode = payment_mode;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public String getPick_up_time() {
        return pick_up_time;
    }

    public void setPick_up_time(String pick_up_time) {
        this.pick_up_time = pick_up_time;
    }

    public String getDelivery_time() {
        return delivery_time;
    }

    public void setDelivery_time(String delivery_time) {
        this.delivery_time = delivery_time;
    }

    public String getPick_up_date() {
        return pick_up_date;
    }

    public void setPick_up_date(String pick_up_date) {
        this.pick_up_date = pick_up_date;
    }

  

  

  


 

    public Orders getOneorders(int order_id) {
        DAL d = new DAL();
        Orders c = new Orders();
        try {
            String sql = "SELECT order_id , cust_id , cloth_qty ,cc_id "
                    + "date_format(order_date , '%d-%m-%y') as order_date  ,  cloth_qty , cloth_name , Payment_mode , "
                    + "order_status , total_amount  ,  "
                    + "TIME_FORMAT(pick_up_time , '%h:%i  %p') as pick_up_time , "
                    + "TIME_FORMAT(delivery_time , '%h:%i  %p\') as delivery_time , "
                    + "DATE_FORMAT(pick_up_date , '%d-%m-%y') as pick_up_date , "
                    + "DATE_FORMAT(delivery_date , '%d-%m-%y') "
                    + "from orders  where order_id=" + order_id;
            ResultSet rs = d.executeQuery(sql);
            if (rs.next()) {
                //int order_id;
    //int cust_id;
   // String order_date;
   // int cloth_qty;
   // String Payment_mode;
   // String Order_status;
   // float Total_amount;
   // String Pick_up_time;
   // String Delivery_time;
   // String Pick_up_date;
   // String Delivery_date;
                c.setOrder_id(rs.getInt("order_id"));
                c.setCc_id(rs.getString("cc_id"));
                c.setCust_id(rs.getInt("cust_id"));
                c.setOrder_date(rs.getString("order_date"));
                c.setCloth_qty(rs.getInt("cloth_qty"));
                c.setPayment_mode(rs.getString("payment_mode"));
                c.setOrder_status(rs.getString("order_status"));
                c.setTotal_amount(rs.getFloat("total_amount"));
                c.setPick_up_time(rs.getString("pick_up_time"));
                c.setDelivery_time(rs.getString("delivery_time"));
                c.setPick_up_date(rs.getString("Pick_up_date"));
                c.setDelivery_date(rs.getString("delivery_date"));
                 
                return c;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public ArrayList<Orders> getAllOrders() {
        DAL d = new DAL();
        ArrayList<Orders> al = new ArrayList<Orders>();
        try {
            String sql = "SELECT order_id , cust_id , cloth_qty , "
                    + "date_format(order_date , '%d-%m-%y') as order_date , cc_id ,  cloth_qty , cloth_name , Payment_mode , "
                    + "order_status , total_amount  ,  "
                    + "TIME_FORMAT(pick_up_time, \"%h:%i  %p\") as pick_up_time , "
                    + "TIME_FORMAT(delivery_time, \"%h:%i  %p\") as delivery_time , "
                    + "DATE_FORMAT(pick_up_date , ' %d-%m-%y') as pick_up_date , "
                    + "DATE_FORMAT( delivery_date , ' %d-%m-%y') "
                    + "from orders";
            ResultSet rs = d.executeQuery(sql);
            while (rs.next()) {
                Orders c = new Orders();
                c.setOrder_id(rs.getInt("order_id"));
                c.setCc_id(rs.getString("cc_id"));
                c.setCust_id(rs.getInt("cust_id"));
                c.setOrder_date(rs.getString("order_date"));
                c.setCloth_qty(rs.getInt("cloth_qty"));
                c.setPayment_mode(rs.getString("payment_mode"));
                c.setOrder_status(rs.getString("order_status"));
                c.setTotal_amount(rs.getFloat("total_amount"));
                c.setPick_up_time(rs.getString("pick_up_time"));
                c.setDelivery_time(rs.getString("delivery_time"));
                c.setPick_up_date(rs.getString("Pick_up_date"));
                c.setDelivery_date(rs.getString("delivery_date"));
                al.add(c);
            }
            return al;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public int save() {
        DAL d = new DAL();
        try {
//            INSERT INTO `laundry`.`orders` (`order_id`, `cust_id`, `cc_id`, `order_date`, `cloth_qty`, `cloth_name`, `payment_mode`, `order_status`, `total_amount`, 
//            `pick_up_time`, `delivery_time`, `pick_up_date`, `delivery_date`) 
//            VALUES ('1', '2', '3', '18/03/2021', '2', 'shirt', 'Cash on delivery', 'Confirmed', '25.0', '10:16', '17:20', '2021-03-19', '2021-03-19');
//            
//            
            String sql = "insert into laundry.orders(order_id , cust_id , cc_id,  order_date , cloth_qty , cloth_name , payment_mode , "
                    + "order_status , total_amount , pick_up_time , delivery_time, pick_up_date , delivery_date)values"
                    + "('" + this.getOrder_id() + "','" + this.getCust_id() + "','" + this.getCc_id()+ "','" + this.getOrder_date() 
                    + "','" + this.getCloth_qty()+ "','" + this.getCloth_name()+ "','" + this.getPayment_mode() 
                    + "','" + this.getOrder_status()+ "' ,'" + this.getTotal_amount() + "' ,'" + this.getPick_up_time()
                    + "' ,'" + this.getDelivery_time()+ "','" + this.getPick_up_date()+ "' ,'" + this.getDelivery_date()+"')";
            return d.executeDML(sql);
//return sql;
            
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }

    public int update(int Order_id) {
        DAL d = new DAL();
        try {
            //int cust_id;
   // String order_date;
   // int cloth_qty;
   // String Payment_mode;
   // String Order_status;
   // float Total_amount;
   // String Pick_up_time;
   // String Delivery_time;
   // String Pick_up_date;
   // String Delivery_date;
            String sql = "update order_id='',cust_id='',order_date='', cloth_qty='', Order_status='' , total_amount='' "
                    + "pick_up_time='' delivery_time='' Pick_up_date='' delivery_date='' where order_id="+Order_id;
            return d.executeDML(sql); 
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }

    public int delete(int Order_id) {
        DAL d = new DAL();
        try {
            String sql = "delete from orders where order_id=" + Order_id;
            return d.executeDML(sql);
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }
    public int updatestatus(int Order_id) {
        DAL d = new DAL();
        try {
            String sql = "UPDATE orders SET order_status = '" + this.getOrder_status()+ "' WHERE order_id=" +Order_id;
           return d.executeDML(sql);
           
        } catch (Exception e) {
            System.out.println(e);
            return 0;
        }
    }

}
