package service;

import bean.User;
import bean.UserRole;

import java.util.List;

public interface IUserRoleService {
    boolean addUser(User user);
    List<UserRole> showList();
    boolean edit(User user);
    boolean remove(int id);
    List<UserRole> showBy(int id, String name);


}
