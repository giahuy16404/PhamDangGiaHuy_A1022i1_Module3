package repository;

public class QueryDb {
    public static String ADD_USER = "INSERT INTO user(idUser,name,code,birthday,thoiGianKhoiTao) VALUES (?,?,?,?,?);";
    public static String ADD_USER_ROLE = "INSERT INTO user_role(idUser,idRole) VALUES (?,?);";

    public static String SELECT_USER_ROLE = "SELECT user.idUser , user.name , user.code , user.birthday , user.thoiGianKhoiTao , role.nameRole \n" +
            "FROM user_role JOIN user ON user.idUser = user_role.idUser \n" +
            "JOIN role ON user_role.idRole = role.idRole;";

    public static String UPDATE_USER_ROLE = "UPDATE user_role SET  user_role.idRole = ? WHERE user_role.idUser = ? AND user_role.idRole = ?;";

    public static String UPDATE_USER = "UPDATE user SET\n" +
            "user.name = ? , user.code = ? , user.birthday = ? , user.thoiGianKhoiTao = ? WHERE user.idUser = ?;";

    public static String REMOVE_USER_ROLE = "DELETE FROM user_role WHERE user_role.idUser = ?;";
    public static String REMOVE_USER = "DELETE FROM user WHERE user.idUser = ?;";

    public static String SHOW_BY = "SELECT user.idUser , user.name , user.code , user.birthday , user.thoiGianKhoiTao , role.nameRole \n" +
            "FROM user_role JOIN user ON user.idUser = user_role.idUser \n" +
            "JOIN role ON user_role.idRole = role.idRole WHERE (user.idUser = ? OR user.name = ? );";
}
