package repository;

import bean.Sach;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SachIMLP implements ISach {
    @Override
    public List<Sach> showList() {
        Connection connection = ConnectDB.getConnection();
        Statement statement = null;
        ResultSet  resultSet = null;
        List<Sach> sachList = new ArrayList<>();
        if (connection != null){
            try {
                statement = connection.createStatement();
                resultSet = statement.executeQuery(UtilDb.SELECT_SACH);
                while (resultSet.next()){
                    int maSach = resultSet.getInt("ma_sach");
                    String tenSach = resultSet.getString("ten_sach");
                    String tacGia = resultSet.getString("tac_gia");
                    String moTa = resultSet.getString("mo_ta");
                    int soLuong = resultSet.getInt("so_luong");
                    sachList.add(new Sach(maSach,tenSach,tacGia,moTa,soLuong));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDB.close();
            }

        }
        return sachList;
    }
}
