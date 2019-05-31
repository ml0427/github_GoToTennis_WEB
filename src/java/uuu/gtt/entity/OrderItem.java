/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uuu.gtt.entity;

import java.util.Objects;

/**
 *
 * @author Administrator
 */
public class OrderItem {

	private int orderId;
	private Product product;
	private double price;
	private int quantity;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		if (quantity > 0) {
			this.quantity = quantity;
		} else {
			throw new IllegalArgumentException("數量必須大於0");
		}
	}

	@Override
	public int hashCode() {
		int hash = 7;
		hash = 97 * hash + this.orderId;
		hash = 97 * hash + Objects.hashCode(this.product);
		return hash;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final OrderItem other = (OrderItem) obj;
		if (this.orderId != other.orderId) {
			return false;
		}
		if (!Objects.equals(this.product, other.product)) {
			return false;
		}
		return true;
	}

}
