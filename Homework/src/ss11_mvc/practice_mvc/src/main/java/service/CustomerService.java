package service;

import bean.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> finAll();
    Boolean add(Customer customer);
    Customer findById(int id);
    Boolean update(Customer customer);
    Boolean remove(int id);
}
