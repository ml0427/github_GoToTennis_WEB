/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.web;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uuu.gtt.entity.Customer;

/**
 *
 * @author Administrator
 */
@WebFilter(filterName = "MemberAuthorizationFilter", urlPatterns = { "/member/*" }, initParams = {
		@WebInitParam(name = "name", value = "member") })
public class MemberAuthorizationFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String name = filterConfig.getInitParameter("name");
		if (name != null) {
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 前置處理
		HttpSession session = ((HttpServletRequest) request).getSession();
		Object objMember = session.getAttribute("member");
		Customer member = null;
		if (objMember instanceof Customer) {
			member = (Customer) objMember;
		}

		if (member == null) { // 若尚未登入，就外部轉交給login.jsp
			session.setAttribute("previous.uri", ((HttpServletRequest) request).getRequestURI());
			((HttpServletResponse) response)
					.sendRedirect(((HttpServletRequest) request).getContextPath() + "/login.jsp");
			return;
		}

		chain.doFilter(request, response);
		// 後置處理
	}

	@Override
	public void destroy() {
	}

}
