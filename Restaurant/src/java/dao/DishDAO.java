package dao;

import java.util.ArrayList;
import model.Dish;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DishDAO extends DAO{

    public DishDAO() {
        super();
    }
    
    public ArrayList<Dish> getAllDish(){
        ArrayList<Dish> dishes = new ArrayList<>();
        String sql = "SELECT * FROM tblDish";
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Dish dish = new Dish();
                dish.setId(rs.getInt("id"));
                dish.setName(rs.getString("name"));
                dish.setPrice(rs.getFloat("price"));
                dish.setDescription(rs.getString("description"));
                
                dishes.add(dish);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return dishes;
    }
    
    public boolean addDish(Dish dish){
        String sql = "INSERT INTO tblDish(id, name, price, description) "
                + "VALUES(?, ?, ?, ?)";
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, dish.getId());
            ps.setString(2, dish.getName());
            ps.setFloat(3, dish.getPrice());
            ps.setString(4, dish.getDescription());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        
        return true;
    }
}
