/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.service;

import java.util.List;

import uuu.gtt.dao.OrdersDAO;
import uuu.gtt.entity.Order;
import uuu.gtt.entity.OrderItem;
import uuu.gtt.entity.Product;
import uuu.gtt.entity.VGBException;

public class OrderService {

	private OrdersDAO ordersDAO = new OrdersDAO();
	private ProductService productService = new ProductService();

	/**
	 * insert
	 * 
	 * @param order
	 * @throws VGBException
	 */
	public void insert(Order order) throws VGBException {
		if (order == null || order.getOrderItemSet() == null || order.getOrderItemSet().isEmpty()) {
			throw new IllegalArgumentException("建立訂單時，訂單與訂單明細必須有值");
		}
		// 檢查庫存
		for (OrderItem item : order.getOrderItemSet()) {
			Product product = productService.selectProductById(item.getProduct().getId());
			if (product.getStock() < item.getProduct().getStock()) {
				throw new IllegalArgumentException(product.getName() + " 庫存不足");
			}
		}
		ordersDAO.insert(order);
	}

	/**
	 * selectOrdersByEmail
	 * 
	 * @param customerEmail
	 * @return
	 * @throws VGBException
	 */
	public List<Order> selectOrdersByEmail(String customerEmail) throws VGBException {
		return ordersDAO.selectOrdersByEmail(customerEmail);
	}

	/**
	 * selectOrderById
	 * 
	 * @param orderId
	 * @return
	 * @throws VGBException
	 */
	public Order selectOrderById(int orderId) throws VGBException {
		return ordersDAO.selectOrderById(orderId);
	}

	/**
	 * updateOrderStatusToNotify
	 * 
	 * @param orderId
	 * @param bank
	 * @param account
	 * @param amount
	 * @param transferDate
	 * @param transferTime
	 * @throws VGBException
	 */
	public void updateOrderStatusToNotify(int orderId, String bank, String account, double amount, String transferDate, String transferTime) throws VGBException {
		String paymentNote = "銀行:" + bank + ", 後5碼: " + account + ", 金額: " + amount + ", 日期時間:" + transferDate + " " + transferTime;
		ordersDAO.updateOrderStatusToNotify(orderId, paymentNote);
	}

}
