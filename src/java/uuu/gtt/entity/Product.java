package uuu.gtt.entity;

public class Product extends Object {

	private int id;
	private String name;
	private int discount = 10;// 折扣
	private double unitPrice; // 定價
	private double price;// 售價
	private int stock = 10;// 庫存
	private String description;// 說明
	private String photoUrl;// 圖片url
	private String photoUrl2;// 圖片url
	private String category;// 產品種類

	public Product() {
	}

	public Product(int id, String name, double unitPrice) {
		this.id = id;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	public Product(int id, String name, double unitPrice, int stock) {
		this(id, name, unitPrice);
		this.stock = stock;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String Category) {
		this.category = Category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getUnitPrice() { // 定價
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public double getPrice() { // 查詢售價
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getDiscount() { // 折扣
		return discount;
	}

	public void setDiscount(int discount) throws VGBException {
		if (discount >= 0 && discount <= 100) {
			this.discount = discount;
			this.price = unitPrice * (100 - discount) / 100;
		} else {
			throw new VGBException("折扣必須在0~100之間");
		}
	}

	public String getPhotoUrl2() {
		return photoUrl2;
	}

	public void setPhotoUrl2(String photoUrl2) {
		this.photoUrl2 = photoUrl2;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;

	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return this.getClass().getSimpleName() + "編號=" + id + ",名稱=" + name + "\n,(定價)=" + unitPrice + "\n,(售價)=" + price + "\n,(折扣)=" + discount + ",庫存=" + stock + "\n,描述=" + description + "\n,圖片網址=" + photoUrl + "\n,圖片網址2=" + photoUrl2 + "\n產品種類=" + category;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
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
		Product other = (Product) obj;
		if (id != other.id) {
			return false;
		}
		return true;
	}

}
