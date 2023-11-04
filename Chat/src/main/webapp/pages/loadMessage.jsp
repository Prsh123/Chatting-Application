<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.demo.dbconnection.DBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%
  HttpSession session1 = request.getSession(false);
  String roomName = (String) session1.getAttribute("roomName");
  String query = "select * from message where roomName=?";
  PreparedStatement preparedStatement = new DBConnection().getStatement(query);
    preparedStatement.setString(1, roomName);
    ResultSet rs = preparedStatement.executeQuery();
  String data ="";
  while(rs.next()){
    data = data + "<div class='container2'><h4>"+rs.getString("userName")+"</h4><br>"+rs.getString("message")+"<span class='time-right'>"+rs.getString("messagetime")+"</span></div>";
  }
  out.println(data);
%>