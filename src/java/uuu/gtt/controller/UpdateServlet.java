/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uuu.gtt.entity.Customer;
import uuu.gtt.entity.VGBException;
import uuu.gtt.service.CustomerService;

/**
 *
 * @author USER
 */
@WebServlet(name = "UpdateServlet", urlPatterns = { "/member/update.do" })
public class UpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// HttpSession session = request.getSession();
		List<String> errors = new ArrayList<>();
		request.setCharacterEncoding("UTF-8");
		// 1. 取得request中的form data: id, name, password1, password2, gender, email, birthday,
		// phone, address, married, bloodType, 並檢查之
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		// String remember = request.getParameter("remember");

		if (id == null || id.length() == 0) {
			errors.add("必須輸入帳號");
		}

		if (name == null || name.length() == 0) {
			errors.add("必須輸入姓名");
		}

		// 密碼檢查
		if (!(password1 != null && password1.length() > 0 && password2 != null && password2.length() > 0 && password1.equals(password2))) {
			errors.add("必須輸入一致的密碼與確認密碼");
		}

		if (gender == null || gender.charAt(0) != Customer.MALE && gender.charAt(0) != Customer.FEMALE) {
			errors.add("必須輸入正確的性別");
		}
		if (email == null || email.length() == 0) {
			errors.add("必須輸入Email");
		}
		if (birthday == null || birthday.length() == 0) {
			errors.add("必須輸入生日");
		}

		// 2. 若無誤，則建立Customer object，並將form data指派給對應的屬性，才呼叫CustomerService register(Customer object)
		if (errors.isEmpty()) {
			try {
				Customer c = new Customer();
				c.setId(id);
				c.setName(name);
				c.setGender(gender.charAt(0));
				c.setPassword(password1);
				c.setEmail(email);
				c.setBirthday(birthday);
				c.setPhone(phone);
				c.setAddress(address);
				// c.setMarried(married != null);
				// if (bloodType != null && bloodType.length() > 0) {
				// BloodType bType = BloodType.valueOf(bloodType);
				// c.setBloodType(bType);
				// }

				CustomerService service = new CustomerService();
				service.update(c);//

				// 3.1若成功則forward to register_ok.jsp
				request.setAttribute("customer", c);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/member/update_ok.jsp");
				dispatcher.forward(request, response);

				return;

			} catch (VGBException ex) {
				this.log("修改失敗", ex);
				errors.add(ex.getMessage());
			} catch (Exception ex) {
				this.log("修改失敗-發生非預期錯誤", ex);
				errors.add("修改失敗-發生非預期錯誤:" + ex);
			}
		}

		// 3.2 若失敗則輸出forward to register.jsp
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);

	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
