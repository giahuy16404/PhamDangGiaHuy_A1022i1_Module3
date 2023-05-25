package repository;

public class UtilDb {
    public static String SELECT_SACH = "SELECT * FROM sach;";
    public static String SELECT_HOCSINH = "SELECT * FROM hoc_sinh;";

    public static String ADD_THE_MUON_SACH = "INSERT INTO the_muon_sach(ma_muon_sach, ma_sach, ma_hoc_sinh, trang_thai, ngay_muon, ngay_tra) VALUES(?, ?, ?, ?, ?, ?);";
    public static String GET_MA_SACH_BY_NAME = "SELECT sach.ma_sach from sach WHERE ten_sach = ?;";
    public static String GET_MA_HOC_SINH_BY_NAME = "SELECT hoc_sinh.ma_hoc_sinh from hoc_sinh WHERE ho_ten = ?;";

    public static String SELECT_THE_MUON_SACH = "SELECT the_muon_sach.ma_muon_sach, sach.ten_sach, sach.tac_gia, " +
            "hoc_sinh.ho_ten , hoc_sinh.lop, the_muon_sach.ngay_muon, the_muon_sach.ngay_tra " +
            "FROM hoc_sinh JOIN the_muon_sach ON hoc_sinh.ma_hoc_sinh =" +
            " the_muon_sach.ma_hoc_sinh JOIN sach ON sach.ma_sach = the_muon_sach.ma_sach" +
            " WHERE the_muon_sach.trang_thai = TRUE;";

    public static String UPDATE_SO_LUONG_SACH_TANG = "    UPDATE sach SET so_luong = so_luong -1 WHERE ma_sach = ?;";

    public static String DELETE_THE_MUON_SACH = "DELETE from the_muon_sach where the_muon_sach.ma_muon_sach = ?;";
}
