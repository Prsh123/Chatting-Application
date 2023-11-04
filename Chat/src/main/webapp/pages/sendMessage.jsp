<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.demo.dbconnection.DBConnection" %>
<%@ page import="java.sql.SQLException" %>
<%
    String roomName = request.getParameter("roomName");
    String userName = request.getParameter("userName");
    String message = request.getParameter("message");
    String query = "insert into message (roomName, message, userName)" + "values(?,?,?)";
    PreparedStatement preparedStatement = new DBConnection().getStatement(query);
    try {
        preparedStatement.setString(1, roomName);
        preparedStatement.setString(2, message);
        preparedStatement.setString(3, userName);
        preparedStatement.execute();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>