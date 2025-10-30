package dao;

import java.util.ArrayList;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.CustomerStat;

public class CustomerStatDAO extends DAO{

    public CustomerStatDAO() {
        super();
    }
    
    public ArrayList<CustomerStat> getCustomerStat(Date start, Date end){
        ArrayList<CustomerStat> customerStats = new ArrayList<>();
        String sql = "SELECT c.id, c.name, c.phone, c.email, "
                + "COALESCE(SUM(do.price * do.amount), 0) "
                + "+ COALESCE(SUM(co.price * co.amount), 0) AS revenue "
                + "FROM tblCustomer c "
                + "JOIN tblReservation re ON c.id = re.tblCustomerId "
                + "JOIN tblInvoice i ON re.id = i.tblReservationId "
                + "JOIN tblOrder o ON i.id = o.tblInvoiceId "
                + "LEFT JOIN tblDishOrder do ON o.id = do.tblOrderId "
                + "LEFT JOIN tblComboOrder co ON o.id = co.tblOrderId "
                + "WHERE i.payTime BETWEEN ? AND ? "
                + "AND O.status = 1 "
                + "GROUP BY c.id "
                + "ORDER BY revenue DESC ";
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, start);
            ps.setDate(2, end);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                CustomerStat customer = new CustomerStat();
                customer.setId(rs.getInt("c.id"));
                customer.setName(rs.getString("c.name"));
                customer.setPhone(rs.getString("c.phone"));
                customer.setEmail(rs.getString("c.email"));
                customer.setRevenue(rs.getFloat("revenue"));
                
                customerStats.add(customer);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return customerStats;
    }
}
