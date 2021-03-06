package uuu.gtt.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uuu.gtt.entity.VGBException;
import uuu.gtt.service.OrderService;

@WebServlet(name = "NotifyServlet", urlPatterns = { "/member/notify.do" })
public class NotifyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * processRequest
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();

		// 1. 取得表單中的資料
		String id = request.getParameter("orderId");
		String bank = request.getParameter("bank");
		String account = request.getParameter("account");
		String amount = request.getParameter("amount");
		String transferDate = request.getParameter("transferDate");
		String transferTime = request.getParameter("transferTime");

		if (id == null || !id.matches("\\d+")) {
			errors.add("訂單編號不正確");
		}

		if (bank == null || bank.length() == 0) {
			errors.add("必須輸入轉帳銀行");
		}

		if (account == null || account.length() == 0) {
			errors.add("必須輸入轉帳帳號後5碼");
		}

		if (amount == null || amount.length() == 0) {
			errors.add("必須輸入轉帳金額");
		}

		if (transferDate == null || transferDate.length() == 0) {
			errors.add("必須輸入轉帳日期");
		}

		if (transferTime == null || transferTime.length() == 0) {
			errors.add("必須輸入轉帳時間");
		}

		// 2. 檢查無誤
		if (errors.isEmpty()) {
			OrderService service = new OrderService();
			try {
				service.updateOrderStatusToNotify(Integer.parseInt(id), bank, account, Double.parseDouble(amount), transferDate, transferTime);

				// 3.1 redirect to orders_history.jsp
				response.sendRedirect(request.getContextPath() + "/member/orders_history.jsp");
			} catch (VGBException ex) {
				this.log("通知已轉帳失敗", ex);
				errors.add(ex.getMessage());
			} catch (Exception ex) {
				this.log("通知已轉帳失敗, 發生非預期錯誤", ex);
				errors.add("通知已轉帳失敗, 發生非預期錯誤:" + ex);
			}
		}

		// 3.2 forward to notify.jsp
		request.setAttribute("errors", errors);
		// request.setAttribute("errors", errors);
		// request.setRequestDispatcher("notify.jsp").forward(request, response);
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
