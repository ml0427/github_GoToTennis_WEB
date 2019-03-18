
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

/**
 *
 * @author USER
 */
@WebFilter(filterName = "PerformanceFilter", urlPatterns = { "/*" }, initParams = { @WebInitParam(name = "prefix", value = "效能監控訊息") })
public class PerformanceFilter implements Filter {

	private FilterConfig filterConfig;
	private String prefix = "PerformanceFilter";// 宣告幾個初始化參數就要幾個屬性

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		String prefix = filterConfig.getInitParameter("prefix");// 抓到"效能監控訊息" 這幾個字傳給 prefix
		if (prefix != null) {
			this.prefix = prefix;
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 前置處理
		long begin = System.currentTimeMillis();// 現在時間的長整數值 以毫秒為單位

		chain.doFilter(request, response);

		// 後續處理
		long end = System.currentTimeMillis();

		String logMsg = this.prefix + ":" + (end - begin) + "ms.   url:" + ((HttpServletRequest) request).getRequestURI();

		this.filterConfig.getServletContext().log(logMsg);// 送到前端

	}

	@Override
	public void destroy() {

	}

}
