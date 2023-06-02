package repository;

import bean.User;
import bean.UserRole;

import java.util.List;

public interface IUserRoleRepository {
    List<UserRole> showList();
    boolean addUserRole(User user);

    boolean edit(User user);

    boolean remove(int id);
    List<UserRole> showBy(int id, String name);
}
