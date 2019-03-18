/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.gtt.web;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/**
 *
 * @author USER
 */
@WebFilter(filterName = "CharsetFilter", urlPatterns = { "*.do", "*.jsp" }, initParams = { @WebInitParam(name = "charset", value = "UTF-8") }, dispatcherTypes = { DispatcherType.REQUEST, DispatcherType.ERROR })
public class CharsetFilter implements Filter {

	private FilterConfig filterConfig;
	private String charst = "UTF-8";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		String charst = this.filterConfig.getInitParameter("charst");
		if (charst != null) {
			this.charst = charst;
		}

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 前置處理。鎖定編碼

		request.setCharacterEncoding(charst);
		request.getParameterNames();// 鎖定request的編碼

		response.setCharacterEncoding(charst);
		response.getWriter();// 鎖定response的編碼

		chain.doFilter(request, response);// 交棒程式... 不太懂

		// 後續處理
	}

	@Override
	public void destroy() {
		// 結束程式 不寫
	}

}
