package repository;

import bean.Role;
import bean.User;
import bean.UserRole;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRoleRepositoryImlp implements IUserRoleRepository {

    @Override
    public List<UserRole> showList() {
        Connection connection = ConnectDb.getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        List<UserRole> list = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.createStatement();
                resultSet = statement.executeQuery(QueryDb.SELECT_USER_ROLE);
                while (resultSet.next()) {
                    int id = resultSet.getInt("idUser");
                    String name = resultSet.getString("name");
                    String code = resultSet.getString("code");
                    String birthday = resultSet.getString("birthday");
                    String thoiGianKhoiTao = resultSet.getString("thoiGianKhoiTao");

                    // Tạo danh sách vai trò mới cho mỗi người dùng
                    Role role1 = new Role();
                    role1.setName(resultSet.getString("nameRole"));
                    User user = new User(id, name, code, birthday, thoiGianKhoiTao, null);
                    list.add(new UserRole(user, role1));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    @Override
    public boolean addUserRole(User user) {
        PreparedStatement statement = null;
        Connection connection = ConnectDb.getConnection();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(QueryDb.ADD_USER);
                // insert user
                statement.setInt(1, user.getId());
                statement.setString(2, user.getName());
                statement.setString(3, user.getCode());
                statement.setString(4, user.getBirthday());
                statement.setString(5, user.getThoiGianKhoiTao());
                statement.executeUpdate();
                // insert role
                for (Role role : user.getRoles()) {
                    statement = connection.prepareStatement(QueryDb.ADD_USER_ROLE);
                    statement.setInt(1, user.getId());
                    statement.setInt(2, role.getIdRole());
                    statement.executeUpdate();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDb.close();
            }

            return true;
        }
        return false;

    }

    @Override
    public boolean edit(User user) {
        Connection connection = ConnectDb.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {

            try {
                statement = connection.prepareStatement(QueryDb.UPDATE_USER);
                statement.setString(1, user.getName());
                statement.setString(2, user.getCode());
                statement.setString(3, user.getBirthday());
                statement.setString(4, user.getThoiGianKhoiTao());
                statement.setInt(5, user.getId());
                statement.executeUpdate();

                for (Role role : user.getRoles()) {
                    statement = connection.prepareStatement(QueryDb.UPDATE_USER_ROLE);
                    statement.setInt(1, role.getIdRole());
                    statement.setInt(2, user.getId());
                    statement.setInt(3, role.getIdRole());
                    statement.executeUpdate();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDb.close();
            }
            return true;

        }

        return false;
    }

    @Override
    public boolean remove(int id) {
        Connection connection = ConnectDb.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {

                statement = connection.prepareStatement(QueryDb.REMOVE_USER_ROLE);
                statement.setInt(1, id);
                statement.executeUpdate();

                statement = connection.prepareStatement(QueryDb.REMOVE_USER);
                statement.setInt(1, id);
                statement.executeUpdate();


            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDb.close();
            }
            return true;
        }
        return false;
    }

    @Override
    public List<UserRole> showBy(int id, String name) {
        Connection connection = ConnectDb.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<UserRole> list = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(QueryDb.SHOW_BY);
                statement.setInt(1,id);
                statement.setString(2,name);
               resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int idd = resultSet.getInt("idUser");
                    String namee = resultSet.getString("name");
                    String code = resultSet.getString("code");
                    String birthday = resultSet.getString("birthday");
                    String thoiGianKhoiTao = resultSet.getString("thoiGianKhoiTao");
                    Role role1 = new Role();
                    List<Role> roleList = new ArrayList<>();
                    role1.setName(resultSet.getString("nameRole"));
                    roleList.add(role1);
                    User user = new User(idd,namee,code,birthday,thoiGianKhoiTao,roleList);
                    list.add(new UserRole(user,role1));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDb.close();
            }
        }
        return list;
    }
}
