package dao;

import model.Staff;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

public class StaffDAO extends DAO{

    public StaffDAO() {
        super();
    }
    
    public Staff checkLogin(String username, String password){
        Staff staff = new Staff();
        String sql = "SELECT * FROM tblStaff "
                + "WHERE username = ? AND password = ?";
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                staff.setId(rs.getInt("id"));
                staff.setUsername(username);
                staff.setPassword(password);
                staff.setName(rs.getString("name"));
                staff.setPhone(rs.getString("phone"));
                staff.setEmail(rs.getString("email"));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return staff;
    }
}
