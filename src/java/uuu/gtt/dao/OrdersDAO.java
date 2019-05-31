/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import uuu.gtt.connection.RDBConnection;
import uuu.gtt.entity.Customer;
import uuu.gtt.entity.Order;
import uuu.gtt.entity.OrderItem;
import uuu.gtt.entity.PaymentType;
import uuu.gtt.entity.Product;
import uuu.gtt.entity.ShippingType;
import uuu.gtt.entity.VGBException;
import uuu.gtt.repository.OrderItemsRepository;
import uuu.gtt.repository.OrdersRepository;
import uuu.gtt.repository.ProductsRepository;

public class OrdersDAO {

	public static void main(String[] args) throws VGBException {

		// List<Order> list = null;
		// Order order = null;
		// OrderService service = new OrderService();
		//
		// // list = service.findOrdersByCustomerEmail("ml0427@gmail.com");
		// // System.out.println("ml0427的訂單列表" + list);
		//
		// int id = 58;
		// order = service.selectOrderById(id);
		// Order orderNwe = new Order();
		// order.setId(0);
		// System.out.println("訂單編號" + id + "的內容" + order);
		//
		// service.insert(order);
	}

	/**
	 * insert
	 * 
	 * @param order
	 * @throws VGBException
	 */
	public void insert(Order order) throws VGBException {

		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(OrdersRepository.INSERT_ORDER_SQL, PreparedStatement.RETURN_GENERATED_KEYS);) {
			// 取得transacton的控制權
			connection.setAutoCommit(false);
			try {
				pstmt.setInt(1, order.getId());
				pstmt.setString(2, order.getRecipientEmail());
				pstmt.setString(3, order.getOrderTime().toString().replace('T', ' '));
				pstmt.setString(4, order.getRecipientName());
				pstmt.setString(5, order.getRecipientEmail());
				pstmt.setString(6, order.getRecipientPhone());
				pstmt.setString(7, order.getRecipientAddr());
				pstmt.setString(8, order.getPaymentType().name());
				pstmt.setDouble(9, order.getPaymentType().getFee());
				pstmt.setString(10, order.getShippingType().name());
				pstmt.setDouble(11, order.getShippingType().getFee());
				pstmt.executeUpdate();

				// 取得自動給號的號碼
				try (ResultSet rs = pstmt.getGeneratedKeys()) {
					int id = 0;
					while (rs.next()) {
						id = rs.getInt(1);
					}
					if (id > 0) {
						order.setId(id);
					}
				}

				if (order.getOrderItemSet() != null && order.getOrderItemSet().size() > 0) {
					try (PreparedStatement pstmt2 = connection.prepareStatement(OrderItemsRepository.INSERT_ORDER_ITEMS_SQL) // 準備指令
					) {
						for (OrderItem item : order.getOrderItemSet()) {
							pstmt2.setInt(1, order.getId());
							pstmt2.setInt(2, item.getProduct().getId());
							pstmt2.setDouble(3, item.getPrice());
							pstmt2.setInt(4, item.getQuantity());
							pstmt2.executeUpdate();
						}
					}
				}
				connection.commit();

				if (order.getOrderItemSet() != null && order.getOrderItemSet().size() > 0) {
					try (PreparedStatement pstmt3 = connection.prepareStatement(ProductsRepository.UPDATE_CUSTOMER_SQL) // 準備指令
					) {
						for (OrderItem item : order.getOrderItemSet()) {
							pstmt3.setInt(1, item.getQuantity());
							pstmt3.setInt(2, item.getProduct().getId());
							pstmt3.executeUpdate();
						}
					}
				}
				connection.commit();

			} catch (Exception ex) {
				connection.rollback();
				throw ex;
			} finally {
				connection.setAutoCommit(true);
			}
		} catch (SQLException ex) {
			throw new VGBException("建立訂單失敗", ex);
		}
	}

	/**
	 * selectOrdersByEmail
	 * 
	 * @param customerId
	 * @return
	 * @throws VGBException
	 */
	public List<Order> selectOrdersByEmail(String customerId) throws VGBException {

		List<Order> list = new ArrayList<>();
		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(OrdersRepository.SELECT_ORDER_BY_CUSTOMER_EMAIL);) {
			pstmt.setString(1, customerId);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					Order order = new Order();
					Customer c = new Customer();

					c.setEmail(rs.getString("customer_email"));
					order.setMember(c);
					order.setId(rs.getInt("id"));
					order.setOrderTime(rs.getString("order_time"));

					String pType = rs.getString("payment_type");
					String shType = rs.getString("shipping_type");
					if (pType != null) {
						order.setPaymentType(PaymentType.valueOf(pType));
					}
					if (shType != null) {
						order.setShippingType(ShippingType.valueOf(shType));
					}

					order.setPaymentFee(rs.getDouble("payment_fee"));
					order.setShippingFee(rs.getDouble("shipping_fee"));
					order.setStatus(rs.getInt("status"));
					order.setTotalAmount(rs.getDouble("total_amount"));
					order.setPaymentNote(rs.getString("payment_note"));
					order.setShippingNote(rs.getString("shipping_note"));

					list.add(order);
				}
				return list;
			}
		} catch (SQLException ex) {
			throw new VGBException("查詢客戶歷史訂單失敗", ex);
		}
	}

	/**
	 * selectOrderById
	 * 
	 * @param orderId
	 * @return
	 * @throws VGBException
	 */
	public Order selectOrderById(int orderId) throws VGBException {

		Order order = null;
		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(OrdersRepository.SELECT_ORDER_BY_ID);) {
			pstmt.setInt(1, orderId);
			try (ResultSet rs = pstmt.executeQuery()) {
				double totalAmount = 0;
				while (rs.next()) {
					if (order == null) {
						order = new Order();
						order.setId(rs.getInt("id"));

						Customer c = new Customer();
						c.setEmail(rs.getString("customer_email"));

						order.setMember(c);

						order.setOrderTime(rs.getString("order_time"));
						order.setRecipientName(rs.getString("recipient_name"));
						order.setRecipientEmail(rs.getString("recipient_email"));
						order.setRecipientPhone(rs.getString("recipient_phone"));
						order.setRecipientAddr(rs.getString("recipient_addr"));

						String pType = rs.getString("payment_type");
						order.setPaymentType(PaymentType.valueOf(pType));
						order.setPaymentFee(rs.getDouble("payment_fee"));
						order.setPaymentNote(rs.getString("payment_note"));

						String shType = rs.getString("shipping_type");
						order.setShippingType(ShippingType.valueOf(shType));
						order.setShippingFee(rs.getDouble("shipping_fee"));
						order.setShippingNote(rs.getString("shipping_note"));
						order.setStatus(rs.getInt("status"));
					}

					OrderItem item = new OrderItem();
					item.setOrderId(rs.getInt("order_id"));

					Product p = new Product();
					p.setId(rs.getInt("product_id"));
					p.setName(rs.getString("name"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setPrice(rs.getInt("price"));

					item.setProduct(p);
					item.setPrice(rs.getDouble("price"));
					item.setQuantity(rs.getInt("quantity"));

					order.add(item);

					totalAmount = totalAmount + item.getPrice() * item.getQuantity();
				}
				if (order != null) {
					order.setTotalAmount(totalAmount);
				}
				return order;
			}
		} catch (SQLException ex) {
			throw new VGBException("查詢訂單失敗", ex);
		}
	}

	public void updateOrderStatusToNotify(int orderId, String paymentNote) throws VGBException {

		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(OrdersRepository.UPDATE_ORDER_STATUS_TO_NOTIFY)) {
			pstmt.setString(1, paymentNote);
			pstmt.setInt(2, orderId);
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			throw new VGBException("[通知轉帳]失敗，訂單編號:" + orderId, ex);
		}
	}

}
