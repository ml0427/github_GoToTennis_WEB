/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uuu.gtt.entity.Customer;
import uuu.gtt.entity.VGBException;
import uuu.gtt.service.CustomerService;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "RegisterServlet", urlPatterns = { "/register.do" })
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		List<String> errors = new ArrayList<>();
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		if (id == null || id.length() == 0) {
			errors.add("必須輸入帳號");
		}

		if (name == null || name.length() == 0) {
			errors.add("必須輸入姓名");
		}

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

		// 若無誤，則建立Customer object，並將form data指派給對應的屬性，才呼叫CustomerService
		// register(Customer object)
		if (errors.isEmpty()) {
			try {
				Customer c = new Customer();
				c.setId(id);
				c.setName(name);
				c.setGender(gender.charAt(0));
				c.setPassword(password1);
				c.setEmail(email);
				c.setBirthday(LocalDate.parse(birthday));
				c.setPhone(phone);
				c.setAddress(address);

				CustomerService service = new CustomerService();
				service.register(c);

				// 若成功則forward to register_ok.jsp
				session.setAttribute("member", c); // 註冊成功直接登入

				RequestDispatcher dispatcher = request.getRequestDispatcher("register_ok.jsp");
				dispatcher.forward(request, response);
				
				return;
			} catch (VGBException ex) {
				this.log("註冊失敗", ex);
				errors.add(ex.getMessage());
			} catch (Exception ex) {
				this.log("註冊失敗-發生非預期錯誤", ex);
				errors.add("註冊失敗-發生非預期錯誤:" + ex);
			}
		}

		// 若失敗則輸出forward to register.jsp
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}


	@Override
	public String getServletInfo() {
		return "Short description";
	}

}
