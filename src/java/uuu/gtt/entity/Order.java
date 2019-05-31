/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Administrator
 */
public class Order {

	private int id;
	private Customer member;
	private LocalDateTime orderTime = LocalDateTime.now();
	private String recipientName;
	private String recipientEmail;
	private String recipientPhone;
	private String recipientAddr;
	private PaymentType paymentType;
	private double paymentFee;
	private String paymentNote; // allow null
	private ShippingType shippingType;
	private double shippingFee;
	private String shippingNote; // allow null
	private double totalAmount;
	private int status; // 0-訂單待處理,1-訂單處理中, 2-訂單已出貨

	private Set<OrderItem> orderItemSet = new HashSet<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Customer getMember() {
		return member;
	}

	public void setMember(Customer member) {
		this.member = member;
	}

	public LocalDateTime getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(LocalDateTime orderTime) {
		this.orderTime = orderTime;
	}

	public void setOrderTime(String orderTime) {
		if (orderTime != null) {
			LocalDateTime time = LocalDateTime.parse(orderTime.replace(' ', 'T'));
			this.setOrderTime(time);
		}
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientEmail() {
		return recipientEmail;
	}

	public void setRecipientEmail(String recipientEmail) {
		this.recipientEmail = recipientEmail;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public String getRecipientAddr() {
		return recipientAddr;
	}

	public void setRecipientAddr(String recipientAddr) {
		this.recipientAddr = recipientAddr;
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	public double getPaymentFee() {
		return paymentFee;
	}

	public void setPaymentFee(double paymentFee) {
		this.paymentFee = paymentFee;
	}

	public String getPaymentNote() {
		return paymentNote;
	}

	public void setPaymentNote(String paymentNote) {
		this.paymentNote = paymentNote;
	}

	public ShippingType getShippingType() {
		return shippingType;
	}

	public void setShippingType(ShippingType shippingType) {
		this.shippingType = shippingType;
	}

	public double getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}

	public String getShippingNote() {
		return shippingNote;
	}

	public void setShippingNote(String shippingNote) {
		this.shippingNote = shippingNote;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	// orderItemSet的mutator
	public void add(OrderItem item) { // 是從order_items資料表格讀取明細後加入orderItem
		this.orderItemSet.add(item);
	}

	public void add(Cart cart) { // 是從結帳讀取明細後寫入orderItem
		if (cart != null && cart.getSize() > 0) {
			for (CartItem item : cart.getCartItemSet()) {
				OrderItem orderItem = new OrderItem();
				orderItem.setProduct(item.getProduct());
				orderItem.setPrice(item.getProduct().getPrice());
				orderItem.setQuantity(cart.getItemQuantity(item));
				this.orderItemSet.add(orderItem);
			}
			this.totalAmount = cart.getTotalDiscountedAmount();
		} else {
			throw new IllegalArgumentException("加入訂單的cart物件不得為null");
		}
	}

	public List<OrderItem> getOrderItemSet() {
		return new ArrayList<OrderItem>(orderItemSet);
	}

}