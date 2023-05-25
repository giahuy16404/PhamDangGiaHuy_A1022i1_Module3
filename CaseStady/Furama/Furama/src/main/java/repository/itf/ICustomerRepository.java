package repository.itf;

import bean.Customer;

import java.util.List;

public interface ICustomer {
    boolean add(Customer customer);

    List<Customer> showList();
    List<Customer> findByName(String name);
    List<Customer> findById(int id);
    boolean update(Customer customer);
    boolean delete(int id);

}
