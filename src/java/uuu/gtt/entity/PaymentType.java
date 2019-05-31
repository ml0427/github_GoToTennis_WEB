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
public enum PaymentType {

	FACE("到店付款", ShippingType.SELF), ATM("ATM轉帳", ShippingType.SELF, ShippingType.HOME), HOME("貨到付款", ShippingType.HOME), CARD("信用卡", ShippingType.SELF, ShippingType.HOME);

	private final double fee;
	private final String description;
	private final ShippingType shippingType[];

	private PaymentType(String description, ShippingType... shippingType) {
		this(0, description, shippingType);
	}

	private PaymentType(double fee, String description, ShippingType... shippingType) {
		this.fee = fee;
		this.description = description;
		this.shippingType = shippingType;
	}

	public ShippingType[] getShippingType() {
		return shippingType;
	}

	public double getFee() {
		return fee;
	}

	public String getDescription() {
		return description;
	}

	@Override
	public String toString() {
		return description + (fee == 0 ? "" : "-" + fee + '元');
	}
}
