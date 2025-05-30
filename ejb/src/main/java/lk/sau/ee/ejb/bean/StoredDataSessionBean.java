package lk.sau.ee.ejb.bean;

import jakarta.annotation.PostConstruct;
import jakarta.ejb.Singleton;
import jakarta.ejb.Startup;
import lk.sau.ee.core.model.ProductModel;
import lk.sau.ee.core.model.UserModel;
import lk.sau.ee.ejb.remote.StoredDataRemote;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@Singleton
@Startup
public class StoredDataSessionBean implements StoredDataRemote {
    private List<UserModel> userModelList;
    private Map<Integer,ProductModel> productModelMap;

    @PostConstruct
    public void init(){
        userModelList = new ArrayList<>();
        productModelMap = new HashMap<>();

        userModelList.add(new UserModel(1,"Saumya","sau@gmail.com","123456"));
        userModelList.add(new UserModel(2,"Sameera","sameera@gmail.com","123456"));
        userModelList.add(new UserModel(3,"Shashika","shashika@gmail.com","123456"));

        Date now = new Date();

        productModelMap.put(1, new ProductModel(
                1,
                "Eternal Brilliance Ring",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjeYLyk23-4_0qzq0D15ltRNQ5viBNJ8q_r9Zhve-d2u8kBNIAX0x_ytIWr8wdgJk_m3A&usqp=CAU",
                "rrrrrrrrrrrrrrrrrr",
                2500.00,
                new Date(now.getTime() + 20 * 60 * 1000),
                8));

        productModelMap.put(2, new ProductModel(
                2,
                "Harmonic Serenity Ring",
                "https://whitegold.money/content/cms/image-68-compressed-scaled.jpg",
                "rrrrrrrrrrrrrrrrrr",
                1950.00,
                new Date(now.getTime() + 20 * 60 * 1000),
                8));

        productModelMap.put(3, new ProductModel(
                3,
                "Stellar Voyage Earrings",
                "https://www.joyalukkas.in/media/wysiwyg/Mobile_1_Earring_S2_1.jpg",
                "rrrrrrrrrrrrrrrrrr",
                1675.00,
                new Date(now.getTime() + 20 * 60 * 1000),
                8));
    }

    @Override
    public List<UserModel> getAllUsers() {
        return userModelList;
    }

    @Override
    public List<ProductModel> getAllProducts() {
        return new ArrayList<>(productModelMap.values());
    }

    @Override
    public ProductModel getProductById(int id) {
        return productModelMap.get(id);
    }
}
