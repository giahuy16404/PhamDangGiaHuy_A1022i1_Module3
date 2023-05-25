package service;

import bean.Customer;
import repository.CustomerRepositoryImlp;
import service.itf.ICustomerService;

import java.util.List;

public class CustomerServiceImlp implements ICustomerService {
    CustomerRepositoryImlp customerRepositoryImlp = new CustomerRepositoryImlp();
    @Override
    public Boolean add(Customer customer) {
        if (customerRepositoryImlp.add(customer)){
            return true;
        }
        return false;
    }

    @Override
    public List<Customer> showList() {
        List
        return null;
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
