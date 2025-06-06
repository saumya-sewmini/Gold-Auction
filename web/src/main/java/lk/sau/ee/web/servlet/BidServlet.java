package lk.sau.ee.web.servlet;

import com.google.gson.Gson;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.sau.ee.core.model.AutoBidModel;
import lk.sau.ee.core.model.BidModel;
import lk.sau.ee.core.model.UserModel;
import lk.sau.ee.core.model.Validate;
import lk.sau.ee.core.websocket.BidBroadcaster;
import lk.sau.ee.ejb.remote.BidManagerRemote;
import lk.sau.ee.ejb.remote.StoredDataRemote;

import java.io.IOException;
import java.util.List;

@WebServlet("/bid")
public class BidServlet extends HttpServlet {

    @EJB
    private BidManagerRemote bidManagerRemote;

    @EJB
    private StoredDataRemote storedDataRemote;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/plain");

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

            //save bid to memory + broadcast
            bidManagerRemote.addBid(bidModel);
            System.out.println("Bid sent to memory");

            storedDataRemote.getProductById(itemId).setMaxBidPrice(amount);
            System.out.println("Product maxBidPrice updated to: " + amount);

            String bidJson = new Gson().toJson(bidModel);
            BidBroadcaster.broadcast(bidJson);
            System.out.println("Broadcasted bid to WebSocket: " + bidJson);

            //auto bid
            List<AutoBidModel> autoBidders = storedDataRemote.getAutoBidsForProduct(bidModel.getItemId());
            for (AutoBidModel config : Validate.sortBidConfigs(autoBidders)){
                if (bidModel.getUserId() == config.getUserId()) continue;

                double nextBid = bidModel.getAmount() +50;

                if (nextBid <= config.getMaxBid()){
                    BidModel autoBid = new BidModel(config.getUserId(), bidModel.getItemId(), nextBid);
                    bidManagerRemote.addBid(autoBid);
                    System.out.println("Auto bid sent to memory");

                    config.setLastBidPlaced(nextBid);

                    String autoBidJson = new Gson().toJson(autoBid);
                    BidBroadcaster.broadcast(autoBidJson);
                    System.out.println("Broadcasted auto bid to WebSocket: " + autoBidJson);

                    storedDataRemote.getProductById(bidModel.getItemId()).setMaxBidPrice(nextBid);
                }
            }

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
