package lk.sau.ee.ejb.remote;

import jakarta.ejb.Remote;
import lk.sau.ee.core.model.BidModel;

import java.util.List;

@Remote
public interface BidManagerRemote {
    void addBid(BidModel bid);
    List<BidModel> getBidsForProduct(int productId);
}
