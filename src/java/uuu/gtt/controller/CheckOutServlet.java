package uuu.gtt.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.gtt.entity.Cart;
import uuu.gtt.entity.Customer;
import uuu.gtt.entity.Order;
import uuu.gtt.entity.PaymentType;
import uuu.gtt.entity.ShippingType;
import uuu.gtt.entity.VGBException;
import uuu.gtt.service.OrderService;

@WebServlet(name = "CheckOutServlet", urlPatterns = { "/member/check_out.do" })
public class CheckOutServlet extends HttpServlet {

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
		HttpSession session = request.getSession();
		Customer member = (Customer) session.getAttribute("member");
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null || cart.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/member/cart.jsp");
			return;
		}

		List<String> errors = new ArrayList<>();
		// request.setCharacterEncoding("UTF-8"); //已經用CharSetFilter處理編碼了
		// 1.讀取請求中的Form Data並檢查之
		String paymentType = request.getParameter("paymentType");// 付款方式
		String shippingType = request.getParameter("shippingType");// 運送方式
		String recipientName = request.getParameter("recipientName");// 收件人名稱
		String recipientEmail = request.getParameter("recipientEmail");// 收件人信箱
		String recipientPhone = request.getParameter("recipientPhone");// 收件人電話
		String recipientAddr = request.getParameter("recipientAddr");// 收件人地址

		if (paymentType == null || paymentType.length() == 0) {
			errors.add("必須選擇付款方式");
		}

		// 2.若Form Data檢查無誤，則呼叫商業邏輯
		if (errors.isEmpty()) {
			try {
				Order order = new Order();
				order.setMember(member);
				order.add(cart);
				order.setPaymentType(PaymentType.valueOf(paymentType));
				order.setPaymentFee(PaymentType.valueOf(paymentType).getFee());
				order.setShippingType(ShippingType.valueOf(shippingType));
				order.setShippingFee(ShippingType.valueOf(shippingType).getFee());

				order.setRecipientName(recipientName);
				order.setRecipientEmail(recipientEmail);
				order.setRecipientPhone(recipientPhone);
				order.setRecipientAddr(recipientAddr);

				OrderService service = new OrderService();
				service.insert(order);

				// 3.1 redirect to orders_history.jsp
				session.removeAttribute("cart");// 清除購物車
				response.sendRedirect("orders_history.jsp");// 導向到訂單明細
				return;
			} catch (VGBException ex) {
				this.log(ex.getMessage(), ex);
				errors.add(ex.getMessage());
			} catch (Exception ex) {
				this.log("建立訂單發生非預期錯誤", ex);
				errors.add("建立訂單發生非預期錯誤:" + ex.getMessage());
			}
		}

		// 3.2 forwrd to check_out.jsp
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("check_out.jsp").forward(request, response);

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
