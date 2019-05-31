/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.entity;

/**
 *
 * @author Administrator
 */
public class Outlet extends Product {

	private int discount;

	public Outlet() {
		super();
	}

	public Outlet(int id, String name, double unitPrice, int discount) {
		super(id, name, unitPrice);
		this.discount = discount;
	}

	public Outlet(int id, String name, double unitPrice) {
		super(id, name, unitPrice);
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getDiscountString() {
		int mod = (100 - discount) % 10;
		String rtn = (mod == 0 ? (100 - discount) / 10 : (100 - discount)) + "折";
		return rtn;
	}

	@Override
	public double getUnitPrice() { // 查詢售價
		return super.getUnitPrice() * (100 - this.discount) / 100;
	}

	public double getPrice() { // 查詢定價
		return super.getPrice();
	}

	@Override
	public String toString() {
		return super.toString() + ",折扣=" + discount + ",折扣後售價:" + this.getUnitPrice();
	}

}
