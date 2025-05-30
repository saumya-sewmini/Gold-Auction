package lk.sau.ee.ejb.bean;

import jakarta.annotation.PostConstruct;
import jakarta.ejb.Singleton;
import jakarta.ejb.Startup;
import lk.sau.ee.core.model.UserModel;
import lk.sau.ee.ejb.remote.StoredDataRemote;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Singleton
@Startup
public class StoredDataSessionBean implements StoredDataRemote {
    private List<UserModel> userModelList;

    @PostConstruct
    public void init(){
        userModelList = new ArrayList<>();

        userModelList.add(new UserModel(1,"Saumya","sau@gmail.com","123456"));
        userModelList.add(new UserModel(2,"Sameera","sameera@gmail.com","123456"));
        userModelList.add(new UserModel(3,"Shashika","shashika@gmail.com","123456"));
    }

    @Override
    public List<UserModel> getAllUsers() {
        return userModelList;
    }
}
