package uuu.gtt.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uuu.gtt.entity.Cart;
import uuu.gtt.entity.CartItem;

@WebServlet(name = "UpdateCartServlet", urlPatterns = { "/member/update_cart.do" })
public class UpdateCartServlet extends HttpServlet {

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
		Object objCart = session.getAttribute("cart");
		Cart cart = null;
		if (objCart instanceof Cart) {
			cart = (Cart) objCart;
		}
		if (cart != null && cart.getSize() > 0) {
			Set<CartItem> trashCan = new HashSet<>();
			for (CartItem item : cart.getCartItemSet()) {
				// 1.讀取request中的Form Data
				String quantity = request.getParameter("quantity" + item.getProduct().getId()/* +"_"+item.getColor() */);
				String delete = request.getParameter("delete" + item.getProduct().getId()/* +"_"+item.getColor() */);
				System.out.println("quantity = " + quantity);
				System.out.println("delete = " + delete);

				// 2.執行商業邏輯
				if (delete != null) {
					// 直接從cart移除item
					// cart.remove(item.getProduct(),item.getColor()); //移除[非最後一筆]時會發生: ConcurrentModificationException

					// 改成:將待移除的item暫放至trashCan
					trashCan.add(item);
				} else if (quantity != null && quantity.matches("\\d+")) {
					cart.update(item.getProduct(), /* item.getColor(), */Integer.parseInt(quantity));
				}
			}

			// 間接從trashCan找出待移除的item，到cart移除item
			for (CartItem item : trashCan) {
				cart.remove(item.getProduct()/* , item.getColor() */);
			}
		}

		String submit = request.getParameter("submit");
		// 3. redirect到購物車
		if ("我要結帳".equals(submit)) {
			response.sendRedirect(request.getContextPath() + "/member/check_out.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/member/cart.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
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
