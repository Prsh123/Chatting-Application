package com.example.demo;
import java.io.IOException;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.demo.dbconnection.DBConnection;

@WebServlet("/DeleteMessageServlet")
public class DeleteMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String messageId = request.getParameter("messageId");
        String query = "DELETE FROM message WHERE messageid = ?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);
        System.out.println(messageId);
        System.out.println("eheee");
        try {
            preparedStatement.setString(1,messageId);
            preparedStatement.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
