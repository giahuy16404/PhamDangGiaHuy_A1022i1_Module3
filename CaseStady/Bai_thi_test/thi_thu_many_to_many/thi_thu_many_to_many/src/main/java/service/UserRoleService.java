package service;

import bean.User;
import bean.UserRole;
import repository.UserRoleRepositoryImlp;

import java.util.List;

public class UserRoleService implements IUserRoleService{
    UserRoleRepositoryImlp userRoleRepositoryImlp = new UserRoleRepositoryImlp();
    @Override
    public boolean addUser(User user) {
        if (userRoleRepositoryImlp.addUserRole(user)){
            return true;
        }
        return false;
    }

    @Override
    public List<UserRole> showList() {
        List<UserRole> userList = userRoleRepositoryImlp.showList();
        for (UserRole userRole : userList) {
            String formattedId = String.format("%04d", Integer.parseInt(userRole.getUser().getCode())); // Định dạng số với 3 chữ số
            userRole.getUser().setCode(formattedId);
        }
        return userList;
    }

    @Override
    public boolean edit(User user) {
        if (userRoleRepositoryImlp.edit(user)){
            return true;
        }
        return false;
    }

    @Override
    public boolean remove(int id) {
        if (userRoleRepositoryImlp.remove(id)){
            return true;
        }
        return false;
    }

    @Override
    public List<UserRole> showBy(int id, String name) {
        return userRoleRepositoryImlp.showBy(id,name);
    }


}
