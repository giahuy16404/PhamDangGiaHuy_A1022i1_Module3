package com.example.mvc.service;

import com.example.mvc.bean.Product;
import com.example.mvc.repository.ProductRepository;
import com.example.mvc.repository.ProductRepositoryImlp;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    ProductRepository repository = new ProductRepositoryImlp();
    @Override
    public boolean add(Product product) {

        return  repository.add(product);
    }

    @Override
    public boolean update(Product product) {
        return repository.update(product);
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public boolean delete(int id) {
        return repository.delete(id);
    }
}
