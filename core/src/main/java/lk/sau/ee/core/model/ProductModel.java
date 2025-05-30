package lk.sau.ee.core.model;

import java.io.Serializable;
import java.util.Date;

public class ProductModel implements Serializable {
    private int id;
    private String name;
    private String image;
    private String description;
    private double maxBidPrice;
    private Date date;
    private int bidderQty;

    public ProductModel() {
    }

    public ProductModel(int id, String name, String image, String description, double maxBidPrice, Date date, int bidderQty) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.maxBidPrice = maxBidPrice;
        this.date = date;
        this.bidderQty = bidderQty;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getMaxBidPrice() {
        return maxBidPrice;
    }

    public void setMaxBidPrice(double maxBidPrice) {
        this.maxBidPrice = maxBidPrice;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getBidderQty() {
        return bidderQty;
    }

    public void setBidderQty(int bidderQty) {
        this.bidderQty = bidderQty;
    }
}
