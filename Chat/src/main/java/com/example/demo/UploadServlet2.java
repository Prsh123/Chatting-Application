package com.example.demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



@WebServlet("/UploadServlet2")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class UploadServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String connectionURL = "jdbc:mysql://localhost:3306/chat";
        String user = "root";
        String pass = "";

        Connection conn = null;
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(connectionURL, user, pass);

            Part part = request.getPart("fileInput");
            String sender = request.getParameter("senders");
            String receiver = request.getParameter("receivers");
            if (part != null) {
                System.out.println(part);
            } else {
                System.out.println("Part is null. No file uploaded?");
            }
            System.out.println("here");
            InputStream inputStream = part.getInputStream();
            String sql = "INSERT INTO private_message (sender,receiver, image) VALUES (?, ?, ?)";
            try (PreparedStatement statement = conn.prepareStatement(sql)) {
                statement.setString(1, sender);
                statement.setString(2, receiver);
                statement.setBlob(3, inputStream);
                statement.executeUpdate();
                System.out.println("hreer again");
            }
            String referer = request.getHeader("referer");
            response.sendRedirect(referer);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
