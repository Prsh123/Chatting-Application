<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.demo.dbconnection.DBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%
    String sender = request.getParameter("sender");
    String receiver = request.getParameter("receiver");
    String query = "select * from private_message where (sender=? AND receiver=?) OR (sender=? AND receiver=?) ";
    PreparedStatement preparedStatement = new DBConnection().getStatement(query);
    preparedStatement.setString(1, sender);
    preparedStatement.setString(2, receiver);
    preparedStatement.setString(3, receiver);
    preparedStatement.setString(4, sender);
    ResultSet rs = preparedStatement.executeQuery();
    String data ="";
    while(rs.next()){
        data = data + "<div class='container2'><h4>"+rs.getString("sender")+"</h4><br>"+rs.getString("message")+"<span class='time-right'>"+rs.getString("messagetime")+"</span></div>";
    }
    out.println(data);
%>