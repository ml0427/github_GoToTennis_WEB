package uuu.gtt.repository;

public class ProductsRepository {

	/**
	 * 修改使用者資料
	 */
	public static final String UPDATE_CUSTOMER_SQL = "UPDATE products SET stock= stock- ?  WHERE id = ?;";

	public static final String SELECT_PRODUCT_BY_NAME_SQL = "SELECT id, name, unit_price, stock, description, photo_url, photo_url2, class, discount, category FROM products WHERE name LIKE ? ";
	
	public static final String SELECT_PRODUCT_BY_CATEGORY_SQL = "SELECT id, name,unit_price,stock,description,photo_url,photo_url2,class,discount,category FROM products WHERE name LIKE ? ";
	
	public static final String SELECT_PRODUCT_BY_ID_SQL = "SELECT id, name,unit_price,stock,description,photo_url,photo_url2,class,discount,category FROM products WHERE id LIKE ?";

}
