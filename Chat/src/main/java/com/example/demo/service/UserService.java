package com.example.demo.service;
import com.example.demo.dbconnection.DBConnection;
import com.example.demo.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class UserService {
    public void insertUser(User user) {
        String query = "insert into user (userName, password)" + "values(?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public User getUser(String userName, String password) {
        User user = null;
        String query = "select *  from user where userName = ? AND password = ?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("userName"));
                user.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
    public List<User> getUserList(String uname) throws SQLException{
        List<User> userList = new ArrayList<>();
        String query = "select * from user where userName != ? ";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        preparedStatement.setString(1, uname);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            User user = new User();
            user.setUsername(resultSet.getString("userName"));
            userList.add(user);
        }
        return userList;
    }
    public User getUserDetails(String userName) throws SQLException{
        User user =new User();
        String query = "select * from user where userName=?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        preparedStatement.setString(1, userName);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()){
            user.setUsername(resultSet.getString("userName"));
            user.setPassword(resultSet.getString("password"));
        }
        return user;
    }
    public void editUser(User user) {
        String query = "update user set password = ?" + " where userName = ?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}