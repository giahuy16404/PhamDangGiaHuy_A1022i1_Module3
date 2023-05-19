package repository;

public class UnityDB {
    public static String INSERT_USERS = "insert into users(name, email, country) values(?,?,?);";

    public static String SELECT_ALL = "select * from users;";
    public static String SELECT_ARRANGE_FOR_NAME  = "SELECT  users.id, users.name, users.email, users.country FROM users  ORDER BY name DESC;";


    public static String DELETE_ROW_USERS = "delete  from users where id = ?;";

    public static String UPDATE_USERS_FR_ID = "UPDATE  users SET name = ?,  email = ?,  country = ? where id = ?;";

    public static String SELECT_BY_ID = "SELECT * FROM users WHERE SUBSTRING_INDEX(name, ' ', -1)  like  ?;";
}
