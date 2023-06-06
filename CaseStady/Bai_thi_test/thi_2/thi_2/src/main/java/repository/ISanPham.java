package repository;

import bean.Category;
import bean.SanPham;

import java.util.List;

public interface ISanPham {
    List<SanPham> showListSanPham();
    List<Category> showListCategory();
    boolean add(SanPham sanPham);
    boolean edit(SanPham sanPham);
    boolean remove(int id);
}
