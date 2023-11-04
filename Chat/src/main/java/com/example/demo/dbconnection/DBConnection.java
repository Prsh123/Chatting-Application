package com.example.demo.dbconnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class DBConnection {
    Connection connection = null;
    public DBConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/chat";
            String name = "root";
            String password = "";
            this.connection = DriverManager.getConnection(dbUrl, name, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        new DBConnection();
    }
    public PreparedStatement getStatement(String query) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(query);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return preparedStatement;
    }
}