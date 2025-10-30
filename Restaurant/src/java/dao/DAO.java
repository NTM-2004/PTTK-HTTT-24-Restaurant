package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
    public static Connection con;

    public DAO() {
        if(con == null){
            String user = "root";
            String password = "123456";
            String url = "jdbc:mysql://localhost:3306/restaurant?autoReconnect=true&useSSL=false";
            String dbClass = "com.mysql.jdbc.Driver";
            try{
                Class.forName(dbClass);
                con = DriverManager.getConnection(url, user, password);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
}
