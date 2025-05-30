package lk.sau.ee.ejb.remote;

import jakarta.ejb.Remote;
import lk.sau.ee.core.model.ProductModel;
import lk.sau.ee.core.model.UserModel;

import java.util.List;

@Remote
public interface StoredDataRemote {
    public List<UserModel> getAllUsers();
    public List<ProductModel> getAllProducts();
    public ProductModel getProductById(int id);
}
