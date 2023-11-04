package com.example.demo.service;
import com.example.demo.dbconnection.DBConnection;
import com.example.demo.model.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class RoomService {
    public void insertRoom(Room room) {
        String query = "insert into room (roomName, password)" + "values(?,?)";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, room.getRoomName());
            preparedStatement.setString(2, room.getPassword());
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Room getRoom(String userName, String password) {
        Room room = null;
        String query = "select *  from room where roomName = ? AND password = ?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        try {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                room = new Room();
                room.setId(resultSet.getInt("id"));
                room.setRoomName(resultSet.getString("roomName"));
                room.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return room;
    }
    public List<Room> getRoomList() throws SQLException{
        List<Room> RoomList = new ArrayList<>();
        String query = "select * from room";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            Room room = new Room();
            room.setRoomName(resultSet.getString("roomName"));
            RoomList.add(room);
        }
        return RoomList;
    }
}
