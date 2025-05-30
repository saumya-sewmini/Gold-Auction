package lk.sau.ee.ejb.remote;

import jakarta.ejb.Remote;
import lk.sau.ee.core.model.UserModel;

import java.util.List;

@Remote
public interface UserRemote {
    List<UserModel> getAllUsers();
}
