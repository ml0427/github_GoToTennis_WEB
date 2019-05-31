package uuu.gtt.repository;

public class ViewLogRepository {

	public static final String SELECT_VIEWLOG_BY_ID = "SELECT * FROM view_log WHERE product_id = ? ";
	
	public static final String INSERT_VIEWLOG_SQL = "INSERT INTO view_log ( customer_email, viewtime, product_id ) VALUES( ?, ?, ? )";

	public static final String SELECT_VIEWLOG_BY_CUSTOMER_EMAIL = "SELECT customer_email, viewtime, product_id, description, photo_url, name FROM view_log JOIN products ON products.id = view_log.product_id WHERE customer_email =?";

}
