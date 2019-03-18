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
import javax.servlet.http.Cookie;
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
@WebServlet(name = "LoginServlet", urlPatterns = { "/login.do", "/login.php" }, loadOnStartup = 10)
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println(request.getAttributeNames());
		System.out.println(request.getRemoteAddr());
		System.out.println(request.getQueryString());


		HttpSession session = request.getSession();
		List<String> errors = new ArrayList<>();

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		String remember = request.getParameter("remember");

		if (email == null || email.length() == 0) {
			errors.add("必須輸入帳號");
		}

		if (password == null || password.length() == 0) {
			errors.add("必須輸入密碼");
		}

		if (captcha == null || captcha.length() == 0) {
			errors.add("必須輸入驗證碼");
		} else {
			// 把session的rand字串讀出來與使用者輸入的captcha比對
			Object oldCaptcha = session.getAttribute("captcha");
			if (oldCaptcha instanceof String && captcha.equalsIgnoreCase((String) oldCaptcha)) {
				session.removeAttribute("captcha");
			} else {
				errors.add("驗證碼不正確!");
			}
		}

		if (errors.isEmpty()) {
			CustomerService service = new CustomerService();
			try {
				Customer c = service.login(email, password); // 抓帳號密碼並登入

				// 以下time-out控制程式請小心慎用
				// session.setMaxInactiveInterval(10);
				// 10秒後time-out
				// cookie的程式
				Cookie emailcookie = new Cookie("email", c.getEmail());
				Cookie remeberCookie = new Cookie("remember", "checked");
				int age = 0;

				if (remember != null) {
					age = 7 * 24 * 60 * 60; // 紀錄七天時間(秒)
				}
				emailcookie.setMaxAge(age);
				remeberCookie.setMaxAge(age);
				response.addCookie(emailcookie);
				response.addCookie(remeberCookie);

				// cookie結束
				// 本來是forword到首頁，改成sendRedirect到首頁
				session.setAttribute("member", c);

				String uri = (String) session.getAttribute("previous.uri");
				if (uri != null) {
					session.removeAttribute("previous.uri");
					response.sendRedirect(uri);
				} else {
					response.sendRedirect(request.getContextPath());
				}
				return;

			} catch (VGBException ex) {
				this.log("登入失敗", ex);
				errors.add(ex.getMessage());
			} catch (Exception ex) {
				this.log("登入功能發生非預期錯誤", ex);
				errors.add("登入功能發生非預期錯誤" + ex);
			}
		}

		// forword到login.jsp
		request.setAttribute("errors", errors);
		RequestDispatcher displatcher = request.getRequestDispatcher("/login.jsp");
		displatcher.forward(request, response);
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
