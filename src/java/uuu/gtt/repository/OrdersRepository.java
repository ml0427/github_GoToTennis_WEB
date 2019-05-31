package uuu.gtt.repository;

import uuu.gtt.entity.PaymentType;
import uuu.gtt.entity.Status;

public class OrdersRepository {

	/**
	 * 查詢訂購資訊，查詢條件為orders.id
	 */
	public static final String SELECT_ORDER_BY_ID = "SELECT orders.id, customer_email, order_time, recipient_name, recipient_email, recipient_phone, recipient_addr, payment_type, payment_fee, shipping_type, shipping_fee, status, payment_note, shipping_note, order_id, product_id, name, photo_url, price, quantity FROM orders LEFT JOIN order_items ON orders.id = order_items.order_id LEFT JOIN products ON order_items.product_id = products.id WHERE orders.id = ? ";

	/**
	 * 查詢訂購資訊，查詢條件為customer_email
	 */
	public static final String SELECT_ORDER_BY_CUSTOMER_EMAIL = "SELECT id, customer_email, order_time, " + "payment_type, payment_fee, shipping_type, shipping_fee, status, ifNull(SUM(price*quantity), 0) as total_amount, payment_note, shipping_note FROM orders LEFT JOIN order_items ON orders.id = order_items.order_id WHERE customer_email=? GROUP BY orders.id ORDER BY order_time DESC";

	/**
	 * 修改訂單狀態
	 */
	public static final String UPDATE_ORDER_STATUS_TO_NOTIFY = "UPDATE orders SET status=" + Status.NOTIFY.ordinal() + ", payment_note=? WHERE id = ? AND payment_type='" + PaymentType.ATM.name() + "' AND status = " + Status.NEW.ordinal();

	/**
	 * 新增訂單，訂購者資訊
	 */
	public static final String INSERT_ORDER_SQL = "INSERT INTO orders ( id, customer_email, order_time, recipient_name, recipient_email, recipient_phone, recipient_addr, payment_type,payment_fee, shipping_type, shipping_fee, status, payment_note, shipping_note) VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, '', '' ) ";

}
