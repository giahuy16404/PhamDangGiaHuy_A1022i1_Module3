package repository;

import bean.User;
import bean.UserRole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserImlp implements IUser{

    @Override
    public boolean addUser(User user) {
        Connection connection = ConnectDB.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(QueryDB.ADD_USER);
                statement.setInt(1,user.getId());
                statement.setString(2,user.getName());
                statement.setString(3,user.getCode());
                statement.setString(4,user.getNgaySinh());
                statement.setString(5,user.getNgayKhoiTao());
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDB.close();
            }
            return true;
        }
        return false;
    }

    @Override
    public boolean addUserRole(UserRole userRole) {
        Connection connection = ConnectDB.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(QueryDB.ADD_USER_ROLE);
                statement.setInt(1,userRole.getUser().getId());
                statement.setInt(2,userRole.getRole().getId());
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDB.close();
            }
            return true;
        }
        return false;
    }
}
