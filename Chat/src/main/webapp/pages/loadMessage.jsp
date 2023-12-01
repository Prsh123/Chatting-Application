<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.demo.dbconnection.DBConnection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Base64" %>
<%
  HttpSession session1 = request.getSession(false);
  String roomName = (String) session1.getAttribute("roomName");
  String query = "select * from message where roomName=?";
  PreparedStatement preparedStatement = new DBConnection().getStatement(query);
    preparedStatement.setString(1, roomName);
    ResultSet rs = preparedStatement.executeQuery();
  String data ="";
  while(rs.next()) {
    if (rs.getString("message") != null) {
      data = data + "<div class='container2' style='height: 110px; position: relative'>"
              + "<h4>" + rs.getString("userName") + "</h4>"
              + "<span class ='delete' style='position: absolute; top: 20; right: 20;'>"
              + "<button class='btn btn-danger delete-button' onclick='deleteMessage(" + rs.getInt("messageId") + ")'>Delete</button></span>"
              + "<br>" + rs.getString("message")
              + "<span class='time-right' style='position: absolute; bottom: 10; right: 20;'>"
              + rs.getString("messagetime") + "</span></div>";
    } else if (rs.getString("image") != null) {
      Blob blob = rs.getBlob("image");
      byte[] imageBytes = blob.getBytes(1, (int) blob.length());
      String base64Image = Base64.getEncoder().encodeToString(imageBytes);
      data = data + "<div class='container2' style='height: 350px; position: relative;'>"
              + "<h4>" + rs.getString("userName") + "</h4>"
              + "<span class ='delete' style='position: absolute; top: 20; right: 20;'>"
              + "<button class='btn btn-danger delete-button' onclick='deleteMessage(" + rs.getInt("messageId") + ")'>Delete</button></span>"
              + "<br>" + "<img src='data:image/png;base64," + base64Image + "' style='height: 250px;'/>"
              + "<span class='time-right' style='position: absolute; bottom: 10; right: 20;'>"
              + rs.getString("messagetime") + "</span></div>";
    }
  }
      out.println(data);
%>