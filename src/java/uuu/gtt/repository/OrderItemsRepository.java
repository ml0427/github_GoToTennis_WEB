package uuu.gtt.repository;

public class OrderItemsRepository {

	/**
	 * 新增訂單，訂購產品資訊
	 */
	public static final String INSERT_ORDER_ITEMS_SQL = "INSERT INTO order_items ( order_id, product_id, price, quantity ) VALUES ( ?, ?, ?, ? )";

}
