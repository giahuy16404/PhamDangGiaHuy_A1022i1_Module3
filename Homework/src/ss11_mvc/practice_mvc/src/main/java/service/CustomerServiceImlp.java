package service;

import bean.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImlp implements CustomerService {
    private static Map<Integer, Customer> customerMap;

    static {
        customerMap = new HashMap<>();
        customerMap.put(1, new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        customerMap.put(2, new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        customerMap.put(3, new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        customerMap.put(4, new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        customerMap.put(5, new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        customerMap.put(6, new Customer(6, "Rose", "rose@codegym.vn", "Newyork"));
    }


    @Override
    public List<Customer> finAll() {
        return new ArrayList<>(customerMap.values());
    }

    @Override
    public Boolean add(Customer customer) {
        if (customerMap.containsKey(customer.getId())) {
            return false;
        }
        customerMap.put(customer.getId(), customer);
        return true;
    }

    @Override
    public Customer findById(int id) {
        return customerMap.get(id);
    }

    @Override
    public Boolean update(Customer customer) {
        if (customerMap.containsKey(customer.getId())) {
            customerMap.put(customer.getId(), customer);
            return true;
        }
        return false;
    }

    @Override
    public Boolean remove(int id) {
        if (customerMap.containsKey(id)) {
            customerMap.remove(id);
            return true;
        }
        return false;
    }
}
