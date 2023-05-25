package repository;

import bean.Customer;
import repository.itf.ICustomerRepository;
import repository.query_db.QueryDBCustomer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImlp implements ICustomerRepository {
    @Override
    public boolean add(Customer customer) {
        Connection connection = ConnectDB.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(QueryDBCustomer.ADD_CUSTOMER);
                statement.setInt(1, customer.getId());
                statement.setString(2, customer.getName());
                statement.setString(3, customer.getBirthday());
                statement.setString(4, customer.getGender());
                statement.setString(5, customer.getIdCard());
                statement.setString(6, customer.getPhone());
                statement.setString(7, customer.getEmail());
                statement.setString(8, customer.getAddress());
                statement.setInt(9, customer.getTypeID());
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
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
    public List<Customer> showList() {
        Connection connection = ConnectDB.getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        List<Customer> list = new ArrayList<>();
        Customer customer = null;
        if (connection != null){
            try {
                statement = connection.createStatement();
                resultSet = statement.executeQuery(QueryDBCustomer.SELECT_CUSTOMER);
                while (resultSet.next()){
                    int id = resultSet.getInt("customer_id");
                    int typeId = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    String gender = resultSet.getString("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    customer = new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address);
                    list.add(customer);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDB.close();
            }
        }
        return list;
    }

    @Override
    public List<Customer> findByName(String name) {
        return null;
    }

    @Override
    public List<Customer> findById(int id) {
        return null;
    }

    @Override
    public boolean update(Customer customer) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}
