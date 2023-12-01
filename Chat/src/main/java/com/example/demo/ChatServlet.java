package com.example.demo;
import com.example.demo.PasswordHashing.HashPassword;
import com.example.demo.model.Room;
import com.example.demo.model.User;
import com.example.demo.service.RoomService;
import com.example.demo.service.UserService;
import java.io.*;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@WebServlet(name = "userServlet", value = "/user")
public class ChatServlet extends HttpServlet {
    public void init() {
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter printWriter = response.getWriter();
        String page = request.getParameter("page");
        if (page.equalsIgnoreCase("newUser")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/register.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("chatSelection")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/chatSelection.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("index")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("logins")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/login.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("login")) {
            String userName = request.getParameter("userName");
            String password = HashPassword.hash(request.getParameter("password"));
            User user = new UserService().getUser(userName, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("userName", userName);
                Cookie cookie = new Cookie("username", userName);
                cookie.setMaxAge(24 * 60 * 60 * 7);
                response.addCookie(cookie);
                try {
                    request.setAttribute("user", user);
                    List<User> userList = null;
                    userList = new UserService().getUserList(request.getParameter("userName"));
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/chatSelection.jsp");
                    requestDispatcher.forward(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            } else {
                printWriter.println("<script>alert('Invalid username or password');</script>");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/login.jsp");
                requestDispatcher.include(request, response);
            }
        }
        if (page.equalsIgnoreCase("chatFriend")) {
            String user1 = request.getParameter("user1");
            User user = new User();
            HttpSession session = request.getSession();
            session.setAttribute("user1", user1);
            Cookie cookie = new Cookie("username", user1);
            cookie.setMaxAge(24 * 60 * 60 * 7);
            response.addCookie(cookie);
            try {
                request.setAttribute("user", user);
                List<User> userList = null;
                userList = new UserService().getUserList(user1);
                request.setAttribute("userList", userList);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/chatFriend.jsp");
                requestDispatcher.forward(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("register")) {
            User user = new User();
            user.setUsername(request.getParameter("userName"));
            user.setPassword(HashPassword.hash(request.getParameter("password")));
            User user1 = new UserService().getUser(request.getParameter("userName"), request.getParameter("password"));
            if (user1 != null){
                response.getWriter().println("<script>alert('User Already exists. Try another UserName');</script>");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/register.jsp");
                requestDispatcher.include(request, response);
            }
            else{
                new UserService().insertUser(user);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/login.jsp");
                try {
                    requestDispatcher.forward(request, response);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        //Room Login and Register
        if (page.equalsIgnoreCase("newRoom")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/roomRegister.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("roomLogin")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/roomLogin.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("roomsLogin")) {
            String name = request.getParameter("roomName");
            String password = HashPassword.hash(request.getParameter("password"));
            Room room = new RoomService().getRoom(name, password);
            if (room != null) {
                HttpSession session = request.getSession();
                session.setAttribute("roomName", name);
                Cookie cookie = new Cookie("roomName", name);
                cookie.setMaxAge(24 * 60 * 60 * 7);
                response.addCookie(cookie);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/chatRoom.jsp");
                requestDispatcher.forward(request, response);
            } else {
                printWriter.println("<script>alert('Invalid roomname or password');</script>");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/roomLogin.jsp");
                requestDispatcher.include(request, response);
            }
        }
        if (page.equalsIgnoreCase("roomsRegister")) {
            Room room = new Room();
            room.setRoomName(request.getParameter("roomName"));
            room.setPassword(HashPassword.hash(request.getParameter("password")));
            Room room1 = new RoomService().getRoom(request.getParameter("roomName"), request.getParameter(HashPassword.hash("password")));
            if (room1 != null){
                response.getWriter().println("<script>alert('Room Already exists. Create different room');</script>");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/roomRegister.jsp");
                requestDispatcher.include(request, response);
            }
            else{
                new RoomService().insertRoom(room);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/roomLogin.jsp");
                try {
                    requestDispatcher.forward(request, response);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        if (page.equalsIgnoreCase("chatRoom2")) {
            String user1 = request.getParameter("user1");
            String user2 = request.getParameter("user2");
            HttpSession session = request.getSession();
            session.setAttribute("user1", user1);
            session.setAttribute("user2", user2);
            Cookie cookie1 = new Cookie("user1", user1);
            Cookie cookie2 = new Cookie("user2", user2);
            cookie1.setMaxAge(24 * 60 * 60 * 7);
            cookie2.setMaxAge(24 * 60 * 60 * 7);
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            User user = new User();
            try {
                request.setAttribute("user", user);
                List<User> userList2 = null;
                userList2 = new UserService().getUserList(user1);
                request.setAttribute("userList2", userList2);
                session.setAttribute("userList2", userList2);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/chatRoom2.jsp");
                requestDispatcher.forward(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("roomList")) {
            Room room = new Room();
            HttpSession session = request.getSession();
            session.setAttribute("room", room);
            try {
                request.setAttribute("room", room);
                List<Room> RoomList = null;
                RoomList = new RoomService().getRoomList();
                request.setAttribute("roomList", RoomList);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/roomList.jsp");
                requestDispatcher.forward(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("roomLogin2")) {
            String roomName = request.getParameter("roomName");
                HttpSession session = request.getSession();
                session.setAttribute("roomName", roomName);
                Cookie cookie = new Cookie("roomName", roomName);
                cookie.setMaxAge(24 * 60 * 60 * 7);
                response.addCookie(cookie);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/roomLogin2.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            }
        }
        if (page.equalsIgnoreCase("userDetails")) {
            String userName = request.getParameter("userName");
            HttpSession session = request.getSession();
            try {
                User user = new UserService().getUserDetails(userName);
                request.setAttribute("UserDetail", user);
                session.setAttribute("UserDetail", user);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/userDetails.jsp");
            requestDispatcher.forward(request,response);
        }
        if (page.equalsIgnoreCase("editPassword")) {
            String userName = request.getParameter("id");
            HttpSession session = request.getSession();
            try {
                User user = new UserService().getUserDetails(userName);
                request.setAttribute("UserDetail", user);
                request.setAttribute("UserPassword", user.getPassword());
                session.setAttribute("UserDetail", user);
                session.setAttribute("UserPassword", user.getPassword());
            } catch (SQLException e) {
                e.printStackTrace();
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/editPassword.jsp");
            requestDispatcher.forward(request,response);
        }
        if (page.equalsIgnoreCase("editedPassword")) {
            User user = new User();
            user.setPassword(HashPassword.hash(request.getParameter("new-password")));
            user.setUsername(request.getParameter("userName"));
            new UserService().editUser(user);
            Cookie cookie0 = new Cookie("username", null);
            Cookie cookie1 = new Cookie("roomName", null);
            Cookie cookie2 = new Cookie("user1", null);
            Cookie cookie3 = new Cookie("user2", null);
            cookie0.setMaxAge(0);
            cookie1.setMaxAge(0);
            cookie2.setMaxAge(0);
            cookie3.setMaxAge(0);
            response.addCookie(cookie0);
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            response.addCookie(cookie3);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/login.jsp");
            requestDispatcher.forward(request, response);
        }
        if (page.equalsIgnoreCase("logout")){
            HttpSession session = request.getSession(false);
            session.invalidate();
            Cookie cookie = new Cookie("username", null);
            Cookie cookie1 = new Cookie("roomName", null);
            Cookie cookie2 = new Cookie("user1", null);
            Cookie cookie3 = new Cookie("user2", null);
            cookie.setMaxAge(0);
            cookie1.setMaxAge(0);
            cookie2.setMaxAge(0);
            cookie3.setMaxAge(0);
            response.addCookie(cookie);
            response.addCookie(cookie1);
            response.addCookie(cookie2);
            response.addCookie(cookie3);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pages/login.jsp");
            requestDispatcher.forward(request, response);
        }
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        doPost(request, response);
    }
    public void destroy() {
    }
}