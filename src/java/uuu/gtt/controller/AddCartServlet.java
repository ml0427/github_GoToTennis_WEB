package uuu.gtt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.gtt.entity.Cart;
import uuu.gtt.entity.Product;
import uuu.gtt.entity.VGBException;
import uuu.gtt.service.ProductService;

@WebServlet(name = "AddCartServlet", urlPatterns = { "/add_cart.do" })
public class AddCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * processRequest
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @throws VGBException
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1.讀取request的parameter
		String productId = request.getParameter("productId");
		String quantityStr = request.getParameter("quantity");
		try {
			if (productId != null && productId.matches("\\d+")) {
				// 2.呼叫商業邏輯
				int id = Integer.parseInt(productId);
				ProductService service = new ProductService();

				Product product = service.selectProductById(id);
				if (product != null) {
					int quantity = 1;
					if (quantityStr != null && quantityStr.matches("\\d+")) {
						quantity = Integer.parseInt(quantityStr);
					}

					HttpSession session = request.getSession();
					Object obj = session.getAttribute("cart");
					Cart cart;
					if (obj instanceof Cart) {
						cart = (Cart) obj;
					} else {
						cart = new Cart();
						session.setAttribute("cart", cart);
					}
					cart.add(product, quantity);
				}
			}else {
				this.log("加入購物車失敗-productId");
			}
		} catch (VGBException ex) {
			this.log("加入購物車失敗!", ex);
		}

		// 3.redirect到購物車
		response.sendRedirect(request.getContextPath() + "/member/cart.jsp");
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
		return "AddCartServlet";
	}

}
