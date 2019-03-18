package uuu.gtt.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uuu.gtt.entity.Customer;
import uuu.gtt.entity.Product;
import uuu.gtt.entity.VGBException;
import uuu.gtt.entity.ViewLog;
import uuu.gtt.service.ViewLogService;

@WebServlet(name = "AddViewLogServlet", urlPatterns = { "/add_view_log.do" })
public class AddViewLogServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 讀取請求中的資料，並檢查之
		Customer member = (Customer) request.getSession().getAttribute("member");
		String id = request.getParameter("productId");

		if (member != null && id != null && id.length() > 0) {
			ViewLogService service = new ViewLogService();
			ViewLog viewlog = new ViewLog();
			// 若檢查無誤，則呼叫商業邏輯
			try {
				viewlog.setCustomer_email(member.getEmail());
				viewlog.setViewtime(LocalDateTime.now());
				Product p = new Product();
				p.setId(Integer.parseInt(id));
				viewlog.setProduct(p);
				service.insert(viewlog);
				
				// redirect to viewlog.jsp
				response.sendRedirect("viewlog.jsp");
				
				return;
			} catch (VGBException ex) {
				this.log("建立觀看紀錄失敗", ex);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	} // </editor-fold>

}
