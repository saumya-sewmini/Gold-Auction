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

@WebServlet("/singleproductview")
public class GetSingleProductServlet extends HttpServlet {

    @EJB
    private StoredDataRemote storedDataRemote;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productIdParam = request.getParameter("id");
        System.out.println("Received product id: " + productIdParam);

        try {

            int productId = Integer.parseInt(productIdParam);
            ProductModel product = storedDataRemote.getProductById(productId);
            System.out.println("Product found 1");

            if (product != null){
                response.setContentType("application/json");
                new Gson().toJson(product, response.getWriter());

                System.out.println("Product found 2");
            }else {
//                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                System.out.println("Product not found");
            }

        }catch (NumberFormatException e){
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product id");
            System.out.println("Invalid product id");
        }
    }
}
