package lk.sau.ee.core.model;

import java.io.Serializable;
import java.util.Date;

public class AutoBidModel implements Serializable {
    private Integer userId;
    private Integer productId;
    private double maxBid;
    private Date registerdAt;
    private double lastBidPlaced;

    public AutoBidModel() {
    }

    public AutoBidModel(Integer userId, Integer productId, double maxBid, Date registerdAt, double lastBidPlaced) {
        this.userId = userId;
        this.productId = productId;
        this.maxBid = maxBid;
        this.registerdAt = registerdAt;
        this.lastBidPlaced = lastBidPlaced;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public double getMaxBid() {
        return maxBid;
    }

    public void setMaxBid(double maxBid) {
        this.maxBid = maxBid;
    }

    public Date getRegisterdAt() {
        return registerdAt;
    }

    public void setRegisterdAt(Date registerdAt) {
        this.registerdAt = registerdAt;
    }

    public double getLastBidPlaced() {
        return lastBidPlaced;
    }

    public void setLastBidPlaced(double lastBidPlaced) {
        this.lastBidPlaced = lastBidPlaced;
    }
}
