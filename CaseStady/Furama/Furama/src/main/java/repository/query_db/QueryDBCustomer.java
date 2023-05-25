package repository.query_db;

public class QueryDBCustomer {
    public static String ADD_CUSTOMER = "INSERT INTO customer(customer_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,\n" +
            "customer_email,customer_address,customer_type_id) VALUES(?,?,?,?,?,?,?,?,?);";

    public static String SELECT_CUSTOMER = "SELECT customer.customer_id,customer_type.customer_type_id,customer.customer_name,customer.customer_birthday,customer.customer_gender,\n" +
            "customer.customer_id_card,customer.customer_phone,customer.customer_email,customer.customer_address \n" +
            "FROM customer JOIN customer_type ON customer.customer_type_id = customer_type.customer_type_id;";
}
