package lk.sau.ee.web.servlet;

import com.google.gson.Gson;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.sau.ee.core.model.ProductModel;
import lk.sau.ee.ejb.remote.StoredDataRemote;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/home")
public class LoadProduct extends HttpServlet {

    @EJB
    private StoredDataRemote storedDataRemote;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoadProduct servlet invoked.");

        List<ProductModel> products = storedDataRemote.getAllProducts();
        System.out.println("LoadProduct servlet invoked.");

        response.setContentType("application/json");
        new Gson().toJson(products, response.getWriter());

    }
}
