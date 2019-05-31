package uuu.gtt.service;

import uuu.gtt.dao.CustomersDAO;
import uuu.gtt.entity.Customer;
import uuu.gtt.entity.VGBException;
import uuu.gtt.service.VerifyService;

public class CustomerService {

	private CustomersDAO customersDAO = new CustomersDAO();

	/**
	 * 新增
	 * 
	 * @param c
	 * @throws VGBException
	 */
	public void register(Customer customer) throws VGBException {

		VerifyService.verifyAll(customer.getBirthday().toString(), customer.getPassword(), customer.getEmail(), customer.getId());
		customersDAO.insert(customer);
	}

	/**
	 * 修改
	 * 
	 * @param c
	 * @throws VGBException
	 */
	public void update(Customer customer) throws VGBException {

		VerifyService.verifyAll(customer.getBirthday().toString(), customer.getPassword(), customer.getEmail(), customer.getId());
		customersDAO.update(customer);
	}

	/**
	 * 登入
	 * 
	 * @param email
	 * @param pwd
	 * @return
	 * @throws VGBException
	 */
	public Customer login(String email, String pwd) throws VGBException {

		Customer customer = customersDAO.selectByEmail(email);
		if (customer == null) {
			throw new VGBException("查無此帳號");
		}
		if (customer.getPassword().equals(pwd)) {
			throw new VGBException("登入失敗，帳號或密碼不正確");
		}
		return customer;
	}

}
