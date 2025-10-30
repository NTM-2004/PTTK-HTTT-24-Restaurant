package dao;

import static dao.DAO.con;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Combo;
import model.ComboOrder;
import model.Dish;
import model.DishOrder;
import model.Order;

public class OrderDAO extends DAO{

    public OrderDAO() {
        super();
    }
    
    public ArrayList<Order> getListOrder(int customerId, Date start, Date end){
        ArrayList<Order> orders = new ArrayList<>();
        String sql = "SELECT o.id, o.note, o.status, o.type, "
                + "COALESCE(SUM(d.price * d.amount), 0) "
                + "+ COALESCE(SUM(c.price * c.amount), 0) AS total "
                + "FROM tblOrder o "
                + "JOIN tblInvoice i ON o.tblInvoiceId = i.id "
                + "JOIN tblReservation r ON o.tblReservationId = r.id "
                + "LEFT JOIN tblDishOrder d ON o.id = d.tblOrderId "
                + "LEFT JOIN tblComboOrder c ON o.id = c.tblOrderId "
                + "WHERE i.payTime BETWEEN ? AND ? "
                + "AND r.tblCustomerId = ? "
                + "AND O.status = 1 "
                + "GROUP BY o.id, i.payTime "
                + "ORDER BY i.payTime ";
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, start);
            ps.setDate(2, end);
            ps.setInt(3, customerId);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Order order = new Order();
                order.setId(rs.getInt("o.id"));
                order.setNote(rs.getString("o.note"));
                order.setType(rs.getString("o.type"));
                order.setPrice(rs.getFloat("total"));
                
                orders.add(order);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return orders;
    }
    
    public Order getListDishAndCombo(Order order){
        ArrayList<DishOrder> dishes = new ArrayList<>();
        ArrayList<ComboOrder> combos = new ArrayList<>();
        
        String sqlDish = "SELECT d.id, d.name, do.id, do.amount, "
                + "do.price FROM tblDishOrder do "
                + "JOIN tblDish d ON do.tblDishId = d.id "
                + "WHERE do.tblOrderId = ? "
                + "ORDER BY do.amount ";
        
        String sqlCombo = "SELECT c.id, c.name, co.id, co.amount, "
                + "co.price FROM tblComboOrder co "
                + "JOIN tblCombo c ON co.tblComboId = c.id "
                + "WHERE co.tblOrderId = ? "
                + "ORDER BY co.amount ";
        try{
            PreparedStatement psDish = con.prepareStatement(sqlDish);
            psDish.setInt(1, order.getId());
            ResultSet rsDish = psDish.executeQuery();
            
            while(rsDish.next()){
                DishOrder dishOrder = new DishOrder();
                dishOrder.setId(rsDish.getInt("do.id"));
                dishOrder.setAmount(rsDish.getInt("do.amount"));
                dishOrder.setPrice(rsDish.getFloat("do.price"));
                
                Dish dish = new Dish();
                dish.setId(rsDish.getInt("d.id"));
                dish.setName(rsDish.getString("d.name"));
                
                dishOrder.setDish(dish);
                dishes.add(dishOrder);
            }
            
            order.setListDish(dishes);
            
            PreparedStatement psCombo = con.prepareStatement(sqlCombo);
            psCombo.setInt(1, order.getId());
            ResultSet rsCombo = psCombo.executeQuery();
            
            while(rsCombo.next()){
                ComboOrder comboOrder = new ComboOrder();
                comboOrder.setId(rsCombo.getInt("co.id"));
                comboOrder.setAmount(rsCombo.getInt("co.amount"));
                comboOrder.setPrice(rsCombo.getFloat("co.price"));
                
                Combo combo = new Combo();
                combo.setId(rsCombo.getInt("c.id"));
                combo.setName(rsCombo.getString("c.name"));
                
                comboOrder.setCombo(combo);
                combos.add(comboOrder);
            }
            
            order.setListCombo(combos);
        }catch(SQLException e){
            e.printStackTrace();
        }
        return order;
    }
}
