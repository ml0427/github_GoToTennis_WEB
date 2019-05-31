package uuu.gtt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.gtt.connection.RDBConnection;
import uuu.gtt.entity.Product;
import uuu.gtt.entity.VGBException;
import uuu.gtt.repository.ProductsRepository;

public class ProductsDAO {

	public static void main(String[] args) {
		
		ProductsDAO dao = new ProductsDAO();
		try {
			Product p = dao.selectProductById(1); // 先選擇產品
			p.setStock(20);
			System.out.println("p====" + p);
		} catch (VGBException ex) {
			Logger.getLogger(ProductsDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	/**
	 * selectProductByName 查詢產品(用名稱)
	 * 
	 * @param name
	 * @return
	 * @throws VGBException
	 */
	public List<Product> selectProductByName(String name) throws VGBException {

		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(ProductsRepository.SELECT_PRODUCT_BY_NAME_SQL)) {
			List<Product> list = new ArrayList<>();
			pstmt.setString(1, '%' + name + '%');
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					String classStr = rs.getString("class");
					Product p = createProductObject(classStr);
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));// 原價
					p.setDiscount(rs.getInt("discount"));// 折扣
					p.setStock(rs.getInt("stock"));
					p.setDescription(rs.getString("description"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setPhotoUrl2(rs.getString("photo_url2"));
					p.setCategory(rs.getString("category"));
					list.add(p);
				}
			}
			return list;
		} catch (SQLException ex) {
			throw new VGBException("用名稱查詢產品失敗", ex);
		}
	}

	/**
	 * 查詢產品(用名稱+品牌)
	 * 
	 * @param name
	 * @param category
	 * @return
	 * @throws VGBException
	 */
	public List<Product> selectProductByNameAndCategory(String name, String... category) throws VGBException {

		List<Product> list = new ArrayList<>();
		String sql = ProductsRepository.SELECT_PRODUCT_BY_CATEGORY_SQL;

		if (category != null && category.length > 0) {
			sql += " AND (";
			for (int i = 0; i < category.length; i++) {
				if (i == 0) {
					sql += "category LIKE ? ";
				} else {
					sql += "OR category LIKE ? ";
				}
			}
			sql += ")";
		}

		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(sql);) {
			pstmt.setString(1, '%' + name + '%');
			if (category != null && category.length > 0) {
				for (int i = 0; i < category.length; i++) {
					pstmt.setString(2 + i, '%' + category[i] + '%');
				}
			}
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					String classStr = rs.getString("class");
					Product p = createProductObject(classStr);
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));// 原價
					p.setDiscount(rs.getInt("discount"));// 折扣
					p.setStock(rs.getInt("stock"));
					p.setDescription(rs.getString("description"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setPhotoUrl2(rs.getString("photo_url2"));
					p.setCategory(rs.getString("category"));

					list.add(p);
				}
			}
			return list;
		} catch (SQLException ex) {
			throw new VGBException("用名稱查詢(名稱+產品種類)失敗", ex);
		}
	}

	/**
	 * selectProductById
	 * 
	 * @param id
	 * @return
	 * @throws VGBException
	 */
	public Product selectProductById(int id) throws VGBException {

		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(ProductsRepository.SELECT_PRODUCT_BY_ID_SQL);) {
			pstmt.setInt(1, +id);
			try (ResultSet rs = pstmt.executeQuery()) {
				Product p = null;
				while (rs.next()) {
					String classStr = rs.getString("class");
					p = this.createProductObject(classStr);
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));// 定價
					p.setDiscount(rs.getInt("discount"));// 折扣
					p.setStock(rs.getInt("stock"));
					p.setDescription(rs.getString("description"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setPhotoUrl2(rs.getString("photo_url2"));
					p.setCategory(rs.getString("category"));
				}
				return p;
			}

		} catch (SQLException ex) {
			throw new VGBException("用名稱查詢標號失敗", ex);
		}
	}

	/**
	 * createProductObject
	 * 
	 * @param classStr
	 * @return
	 */
	private Product createProductObject(String classStr) {

		String className = Product.class.getName();

		if (classStr != null) {
			className = className.replace("Product", classStr);
		}
		Product p;
		try {
			p = (Product) Class.forName(className).newInstance();
		} catch (Exception ex) {
			p = new Product();
		}
		return p;
	}

}
