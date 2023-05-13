package com.example.mvc.repository;

import com.example.mvc.bean.Product;

import java.util.List;

public interface ProductRepository {
    boolean add(Product product);
    boolean update(Product product);
    Product findById(int id);
    List<Product> findAll();
    boolean delete(int id);
}
