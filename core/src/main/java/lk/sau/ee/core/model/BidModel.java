package lk.sau.ee.core.model;

import java.io.Serializable;

public class BidModel implements Serializable {

    private int userId;
    private int itemId;
    private double amount;

    public BidModel() {
    }

    public BidModel(int userId, int itemId, double amount) {
        this.userId = userId;
        this.itemId = itemId;
        this.amount = amount;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}
