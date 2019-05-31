/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uuu.gtt.entity;

import java.util.Objects;

public class CartItem {
	
	private Product product;

	public CartItem() {
	}

	public CartItem(Product product) {
		this.setProduct(product);
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		if (product == null) {
			throw new IllegalArgumentException("購物項目的產品不得為null");
		} else {
			this.product = product;
		}
	}

	@Override
	public String toString() {
		return this.getClass().getName() + "產品名稱=" + product.getName();
	}

	@Override
	public int hashCode() {
		int hash = 7;
		hash = 53 * hash + Objects.hashCode(this.product);
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
		final CartItem other = (CartItem) obj;
		if (!Objects.equals(this.product, other.product)) {
			return false;
		}
		return true;
	}

}
