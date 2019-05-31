package uuu.gtt.entity;

import java.time.LocalDateTime;

public class ViewLog {

	private String customer_email;
	private LocalDateTime viewtime;
	private Product product;

	public ViewLog() {
		super();
	}

	public ViewLog(String customer_email, LocalDateTime viewtime, Product product) {
		this.customer_email = customer_email;
		this.viewtime = viewtime;
		this.product = product;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public LocalDateTime getViewtime() {
		return viewtime;
	}

	public void setViewtime(LocalDateTime viewtime) {
		this.viewtime = viewtime;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "ViewLog{" + "customer_email=" + customer_email + ", viewtime=" + viewtime + ", product_name=" + product
				+ '}';
	}

}
