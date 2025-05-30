package lk.sau.ee.ejb.bean;

import jakarta.ejb.Stateless;
import lk.sau.ee.core.model.UserModel;
import lk.sau.ee.ejb.remote.UserRemote;

import java.util.ArrayList;
import java.util.List;

@Stateless
public class UserSessionBean implements UserRemote {

    @Override
    public List<UserModel> getAllUsers() {
        return List.of(
                new UserModel("sau@gmail.com", "123456"),
                new UserModel("sameera@gmail.com", "456789"),
                new UserModel("shashika@gmail.com", "785469")
        );
    }
}
