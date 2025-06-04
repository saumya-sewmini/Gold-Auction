package lk.sau.ee.web.servlet;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.sau.ee.core.model.AutoBidModel;
import lk.sau.ee.core.model.UserModel;
import lk.sau.ee.ejb.remote.BidManagerRemote;
import lk.sau.ee.ejb.remote.StoredDataRemote;

import java.io.IOException;
import java.util.Date;

@WebServlet("/autobid")
public class AutoBidServlet extends HttpServlet {

    @EJB
    private StoredDataRemote storedDataRemote;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        AutoBidModel autoBidModel = new AutoBidModel();
        autoBidModel.setMaxBid(Double.parseDouble(request.getParameter("maxBid")));
        autoBidModel.setProductId(Integer.parseInt(request.getParameter("productId")));

        HttpSession session = request.getSession(false);
        UserModel user = (session != null) ? (UserModel) session.getAttribute("user") : null;

        autoBidModel.setUserId(user.getId());

        autoBidModel.setRegisterdAt(new Date());

        storedDataRemote.registerAutoBid(autoBidModel);

    }
}
