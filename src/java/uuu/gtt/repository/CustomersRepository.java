package uuu.gtt.repository;

public class CustomersRepository {

	/**
	 * 修改客戶資料SQL
	 */
	public static final String UPDATE_CUSTOMER_SQL = "UPDATE customers SET name = ? , password = ? , gender = ? , birthday = ? , id = ? , phone = ? , address = ? , class = ? WHERE email = ? ";

	/**
	 * 新增客戶資料SQL
	 */
	public static final String INSERT_CUSTOMER_SQL = "INSERT INTO customers (id, name, password, gender, birthday, email, phone, address ) VALUES( ?, ?, ?, ?, ?, ?, ?, ? )";

	/**
	 * 查詢資料SQL 查詢條件為Email (pk)
	 */
	public static final String SELECT_CUSTOMER_BY_ID_SQL = "SELECT * FROM customers WHERE email= ? ";

}
