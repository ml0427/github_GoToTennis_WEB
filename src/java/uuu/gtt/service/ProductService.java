/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.service;

import java.util.List;

import uuu.gtt.dao.ProductsDAO;
import uuu.gtt.entity.Product;
import uuu.gtt.entity.VGBException;

/**
 *
 * @author Administrator
 */
public class ProductService {

	private ProductsDAO productsDAO = new ProductsDAO();

	public List<Product> selectProductByName(String name) throws VGBException {
		return productsDAO.selectProductByName(name);
	}

	public Product selectProductById(int id) throws VGBException {
		return productsDAO.selectProductById(id);
	}

	public List<Product> selectProductByName_Category(String name, String category) throws VGBException {
		return productsDAO.selectProductByNameAndCategory(name, category);
	}

}
