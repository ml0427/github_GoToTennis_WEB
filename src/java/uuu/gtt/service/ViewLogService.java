/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.service;

import java.util.List;

import uuu.gtt.dao.ViewLogDAO;
import uuu.gtt.entity.VGBException;
import uuu.gtt.entity.ViewLog;

/**
 *
 * @author Administrator
 */
public class ViewLogService {

	private ViewLogDAO viewLogDAO = new ViewLogDAO();

	public void insert(ViewLog viewlog) throws VGBException {
		viewLogDAO.insert(viewlog);
	}

	public List<ViewLog> findViewLOgByCustomerEmail(String customerEmail) throws VGBException {
		return viewLogDAO.selectViewLogByCustomerEmail(customerEmail);
	}

	public List<ViewLog> selectViewLogById(int product_id) throws VGBException {
		return viewLogDAO.selectViewLogById(product_id);
	}

}
