package lk.sau.ee.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.sau.ee.core.model.UserModel;
import lk.sau.ee.ejb.remote.UserRemote;

import java.io.IOException;
import java.util.List;

@WebServlet("/index")
public class SigninServlet extends HttpServlet {

    @EJB
    private UserRemote userRemote;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        System.out.println("Received email:" +email);
        System.out.println("Received password:" +password);

        List<UserModel> users = userRemote.getAllUsers();
        System.out.println("Users in system:");

        for (UserModel user : users) {
            System.out.println("User: " + user.getEmail() + " - " + user.getPassword());
        }

        UserModel successUser = null;

        for (UserModel user : users) {
            if (user.getEmail().equalsIgnoreCase(email) && user.getPassword().equals(password)) {
                successUser = user;
                break;
            }
        }

        if (successUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", successUser);

            System.out.println("Login successful for user: " + successUser.getEmail());
            response.getWriter().write("success");
        } else {
            System.out.println("Login failed");
            response.getWriter().write("fail");
        }
    }
}
