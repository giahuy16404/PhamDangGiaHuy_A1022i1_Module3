package repository;

import bean.HocSinh;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class HocSinhIMLP implements IHocSinh{
    @Override
    public List<HocSinh> showList() {
        Connection connection = ConnectDB.getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        List<HocSinh> hocSinhList = new ArrayList<>();
        if ( connection != null){
            try {
                statement = connection.createStatement();
                resultSet = statement.executeQuery(UtilDb.SELECT_HOCSINH);
                while (resultSet.next()){
                    int maHocSinh = resultSet.getInt("ma_hoc_sinh");
                    String hoTen = resultSet.getString("ho_ten");
                    String lop = resultSet.getString("lop");
                    hocSinhList.add(new HocSinh(maHocSinh,hoTen,lop));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return hocSinhList;
    }

}
