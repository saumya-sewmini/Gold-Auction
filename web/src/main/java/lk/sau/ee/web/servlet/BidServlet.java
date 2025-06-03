package lk.sau.ee.web.servlet;

import com.google.gson.Gson;
import jakarta.annotation.Resource;
import jakarta.ejb.EJB;
import jakarta.inject.Inject;
import jakarta.jms.JMSContext;
import jakarta.jms.Topic;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.sau.ee.core.model.BidModel;
import lk.sau.ee.core.model.UserModel;
import lk.sau.ee.ejb.remote.BidManagerRemote;
import lk.sau.ee.ejb.remote.StoredDataRemote;

import java.io.IOException;

@WebServlet("/bid")
public class BidServlet extends HttpServlet {

    @EJB
    private BidManagerRemote bidManagerRemote;

    @EJB
    private StoredDataRemote storedDataRemote;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String productIdParam = request.getParameter("itemId");
        String amountParam = request.getParameter("amount");
        System.out.println(amountParam);

        try {

            //session
            HttpSession session = request.getSession(false);
            UserModel user = (session != null) ? (UserModel) session.getAttribute("user") : null;

            if (user == null) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
                return;
            }

            //parse inputs
            int itemId = Integer.parseInt(productIdParam);
            double amount = Double.parseDouble(amountParam);

            System.out.println("Received item id: " + itemId);
            System.out.println("Received amount: " + amount);
            System.out.println("User id: " + user.getId());

            //validation
            double currentMaxBid = storedDataRemote.getProductById(itemId).getMaxBidPrice();

            if (amount <= currentMaxBid) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bid amount must be greater than current max bid");
                return;
            }

            if ((amount - currentMaxBid) % 50 != 0){
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bids must increment by 50");
                return;
            }

            //bid create and send
            BidModel bidModel = new BidModel(user.getId(), itemId, amount);

            //success response
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("success");
            System.out.println("Bid sent to client");

        }catch (NumberFormatException e){
            System.err.println("Invalid number format: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product id or amount");
        } catch (Exception e) {
            System.err.println("Bid failed: " + e.getMessage());
        }

    }
}
