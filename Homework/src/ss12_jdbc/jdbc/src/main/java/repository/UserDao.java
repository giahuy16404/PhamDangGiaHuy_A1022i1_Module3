package repository;

import bean.User;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements IUserDAO {


    @Override
    public boolean insertUser(User user) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;


        if (connection != null) {
            try {
                statement = connection.prepareStatement(UnityDB.INSERT_USERS);
                statement.setString(1, user.getName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getCountry());
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                statement.close();
                DBConnection.close();
            }
            return true;
        }
        return false;
    }

    @Override
    public List<User> selectUser(String name) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        User user;
        List<User> userListName = new ArrayList<>();

        if (connection != null) {
            try {
                statement = connection.prepareStatement(UnityDB.SELECT_BY_ID);
                statement.setString(1, "%" + name + "%");
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    user = new User(resultSet.getInt("id"),
                            resultSet.getString("name"),
                            resultSet.getString("email"),
                            resultSet.getString("country"));
                    userListName.add(user);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }

        }
        return userListName;
    }

    @Override
    public List<User> selectAllUser() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;


        List<User> userList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UnityDB.SELECT_ALL);
                resultSet = statement.executeQuery();

                User user;

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    user = new User(id, name, email, country);
                    userList.add(user);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }

        return userList;
    }
    public List<User> arrangeForName() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        List<User> arrangeForName = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UnityDB.SELECT_ARRANGE_FOR_NAME);
                resultSet = statement.executeQuery();

                User user;

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    user = new User(id, name, email, country);
                    arrangeForName.add(user);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }

        return arrangeForName;
    }

    @Override
    public boolean deleteUser(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        boolean rowDelete = false;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UnityDB.DELETE_ROW_USERS);
                statement.setInt(1, id);
                rowDelete = statement.executeUpdate() > 0;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }

        }
        return rowDelete;
    }

    @Override
    public boolean updateUser(User user) {
        boolean rowDelete = false;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(UnityDB.UPDATE_USERS_FR_ID);
                statement.setString(1, user.getName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getCountry());
                statement.setInt(4, user.getId());
                rowDelete = statement.executeUpdate() > 0;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
        return rowDelete;
    }
}
