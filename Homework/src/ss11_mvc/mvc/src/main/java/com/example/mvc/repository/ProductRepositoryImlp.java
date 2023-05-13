package com.example.mvc.repository;



import com.example.mvc.bean.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImlp implements ProductRepository {
    private static final Map<Integer,Product>  productMap;
    static {
        productMap = new HashMap<>();
        productMap.put(1,new Product(1,"Victus Gaming",17000000,16,"Japan"));
        productMap.put(2,new Product(2,"Asus",15000000,6,"Japan"));
        productMap.put(3,new Product(3,"Ideapad Lenovo",17550000,9,"CN"));
        productMap.put(4,new Product(4,"Dell",25000000,26,"USA"));
        productMap.put(5,new Product(5,"HP",12000000,0,"Korea"));
    }

    @Override
    public boolean add(Product product) {
        if (productMap.containsKey(product.getId())){
            return false;
        }
        productMap.put(product.getId(),product);
        return true;
    }

    @Override
    public boolean update(Product product) {
        if (productMap.containsKey(product.getId())){
            productMap.put(product.getId(),product);
            return true;
        }
        return false;
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values()) ;
    }

    @Override
    public boolean delete(int id) {
        if (productMap.containsKey(id)){
            productMap.remove(id);
            return true;
        }
        return false;
    }
}