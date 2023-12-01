package com.example.demo;
import java.io.IOException;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.example.demo.dbconnection.DBConnection;

@WebServlet("/DeleteMessageServlet2")
public class DeleteMessageServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String messageId = request.getParameter("messageId");
        String query = "DELETE FROM private_message WHERE messageid = ?";
        PreparedStatement preparedStatement = new DBConnection().getStatement(query);

        try {
            preparedStatement.setString(1,messageId);
            preparedStatement.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
