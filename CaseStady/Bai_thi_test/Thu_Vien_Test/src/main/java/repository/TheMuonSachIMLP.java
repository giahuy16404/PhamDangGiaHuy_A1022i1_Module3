package repository;

import bean.TheMuonSach;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TheMuonSachIMLP implements ITheMuonSach {
    @Override
    public List<TheMuonSach> showList() {
        Connection connection = ConnectDB.getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        List<TheMuonSach> theMuonSaches = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.createStatement();
                resultSet = statement.executeQuery(UtilDb.SELECT_THE_MUON_SACH);
                while (resultSet.next()) {
                    int maMuonSach = resultSet.getInt("ma_muon_sach");
                    String tenSach = resultSet.getString("ten_sach");
                    String tacGia = resultSet.getString("tac_gia");
                    String hoTen = resultSet.getString("ho_ten");
                    String lop = resultSet.getString("lop");
                    String ngayMuon = resultSet.getString("ngay_muon");
                    String ngayTra = resultSet.getString("ngay_tra");
                    theMuonSaches.add(new TheMuonSach(maMuonSach, tenSach, tacGia, hoTen, lop, ngayTra, ngayMuon));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return theMuonSaches;
    }

    public void traSach(int maSach){
        Connection connection = ConnectDB.getConnection();
        PreparedStatement statement = null;
        if (connection != null){

            try {
                statement = connection.prepareStatement(UtilDb.DELETE_THE_MUON_SACH);
                statement.setInt(1,maSach);
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDB.close();
            }
        }
    }

    public int getMaSachByName(String name) {
        Connection connection = ConnectDB.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int maSach = 0;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UtilDb.GET_MA_SACH_BY_NAME);
                statement.setString(1, name);
                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    maSach = resultSet.getInt("ma_sach");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDB.close();
            }
        }
        return maSach;
    }

    public int getMaHocSinhByName(String name) {
        Connection connection = ConnectDB.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int maHocSinh = 0;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UtilDb.GET_MA_HOC_SINH_BY_NAME);
                statement.setString(1, name);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    maHocSinh = resultSet.getInt("ma_hoc_sinh");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDB.close();
            }
        }
        return maHocSinh;
    }

    @Override
    public boolean addTheMuonSach(TheMuonSach theMuonSach) {
        Connection connection = ConnectDB.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UtilDb.ADD_THE_MUON_SACH);
                statement.setInt(1, theMuonSach.getMaMuonSach());
                statement.setInt(2, theMuonSach.getMaSach());
                statement.setInt(3, theMuonSach.getMaHocSinh());
                statement.setBoolean(4, theMuonSach.getTrangThai());
                statement.setString(5, theMuonSach.getNgayMuon());
                statement.setString(6, theMuonSach.getNgayTra());
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDB.close();
            }
            return true;
        }
        return false;
    }
    public void updateSoLuongSachTang(int maSach){
        Connection connection = ConnectDB.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(UtilDb.UPDATE_SO_LUONG_SACH_TANG);
                statement.setInt(1,maSach);
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                try {
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                ConnectDB.close();
            }
        }


    }
}
