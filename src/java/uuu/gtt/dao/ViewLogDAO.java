package uuu.gtt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import uuu.gtt.connection.RDBConnection;
import uuu.gtt.entity.Product;
import uuu.gtt.entity.VGBException;
import uuu.gtt.entity.ViewLog;
import uuu.gtt.repository.ViewLogRepository;
import uuu.gtt.service.ViewLogService;

public class ViewLogDAO {

	public static void main(String[] args) throws VGBException {

		List<ViewLog> list = null;
		ViewLogService vl = new ViewLogService();

		list = vl.selectViewLogById(1);

		System.out.println(" vl.selectViewLogById(1)==" + list);
	}

	/**
	 * selectViewLogById
	 * 
	 * @param product_id
	 * @return
	 * @throws VGBException
	 */
	public List<ViewLog> selectViewLogById(int product_id) throws VGBException {

		List<ViewLog> list = new ArrayList<>();
		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(ViewLogRepository.SELECT_VIEWLOG_BY_ID)) {
			pstmt.setInt(1, product_id);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					ViewLog viewlog = new ViewLog();
					viewlog.setCustomer_email(rs.getString("customer_email"));
					Product p = new Product();
					p.setId(rs.getInt("product_id"));
					viewlog.setProduct(p);
					list.add(viewlog);
				}
				return list;
			}
		} catch (SQLException ex) {
			throw new VGBException("查詢遊覽紀錄錯誤", ex);
		}
	}

	/**
	 * insert
	 * 
	 * @param v
	 * @throws VGBException
	 */
	public void insert(ViewLog v) throws VGBException {

		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(ViewLogRepository.INSERT_VIEWLOG_SQL);) {
			pstmt.setString(1, v.getCustomer_email());
			pstmt.setString(2, v.getViewtime().toString().replace('T', ' '));
			pstmt.setInt(3, v.getProduct().getId());
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			throw new VGBException("新增觀看紀錄失敗", ex);
		}
	}

	/**
	 * selectViewLogByCustomerEmail
	 * 
	 * @param customerEmail
	 * @return
	 * @throws VGBException
	 */
	public List<ViewLog> selectViewLogByCustomerEmail(String customerEmail) throws VGBException {

		List<ViewLog> list = new ArrayList<>();
		try (Connection connection = RDBConnection.getConnection(); PreparedStatement pstmt = connection.prepareStatement(ViewLogRepository.SELECT_VIEWLOG_BY_CUSTOMER_EMAIL)) {
			pstmt.setString(1, customerEmail);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					ViewLog viewlog = new ViewLog();
					viewlog.setCustomer_email(rs.getString("customer_email"));
					Product p = new Product();
					p.setId(rs.getInt("product_id"));
					p.setName(rs.getString("name"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					viewlog.setProduct(p);
					viewlog.setViewtime(LocalDateTime.parse(rs.getString("viewtime").replace(' ', 'T')));
					list.add(viewlog);
				}
				return list;
			}
		} catch (SQLException ex) {
			throw new VGBException("查詢遊覽紀錄錯誤", ex);
		}
	}

}
