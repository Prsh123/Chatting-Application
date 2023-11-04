<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.demo.dbconnection.DBConnection" %>
<%@ page import="java.sql.SQLException" %>]
<%
    String sender = request.getParameter("sender");
    String receiver = request.getParameter("receiver");
    String message = request.getParameter("message");
    String query = "insert into private_message (sender, message, receiver)" + "values(?,?,?)";
    PreparedStatement preparedStatement = new DBConnection().getStatement(query);
    try {
        preparedStatement.setString(1, sender);
        preparedStatement.setString(2, message);
        preparedStatement.setString(3, receiver);
        preparedStatement.execute();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>