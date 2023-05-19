package repository;

import bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
     boolean insertUser(User user) throws SQLException, ClassNotFoundException;
     List<User> selectUser(String name);
     List<User> selectAllUser();
     boolean deleteUser(int id);
     boolean updateUser(User user);
}
