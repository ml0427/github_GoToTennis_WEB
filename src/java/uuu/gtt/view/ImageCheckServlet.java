package uuu.gtt.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageCheckServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private int len = 6, width = 16 * 2 + 12 * len, height = 20;
	private int style = Font.PLAIN;

	@Override
	public void init() {
		String length = this.getInitParameter("length");
		String style = this.getInitParameter("font-style");
		if (length != null && length.matches("\\d+")) {
			this.len = Integer.parseInt(length);
		}

		if (style != null && style.equalsIgnoreCase("BOLD")) {
			this.style = Font.BOLD;
		}

		width = 16 * 2 + 12 * len;
	}

	private BufferedImage generateImage(String rand, int width, int height) {
		// 開始建立圖片
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics(); // 取得影像繪圖區

		// 畫出背景方塊
		g.setColor(getRandomColor(200, 250)); // 設定繪圖區背景色
		g.fillRect(0, 0, width, height); // 在繪圖區畫個長方型

		// 畫干擾線讓背景雜亂
		Random random = new Random();
		g.setColor(getRandomColor(170, 210));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			g.drawLine(x, y, x + xl, y + yl);
		}

		// 畫出認證文字
		g.setFont(new Font("Arial", style, 18));// 設定字體
		g.setColor(getRandomColor(20, 140));
		// 將認證文字畫到image中
		g.drawString(rand, 16, 16);
		g.dispose();
		return image;
	}

	private Color getRandomColor(int fc, int bc) {
		// 在參數設定的範圍內，隨機產生顏色
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	/**
	 * processRequest
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rand = "";
		// 2.執行商業邏輯: 用Random產生len碼的大寫英數字字串0~9, 10~35->A~Z
		Random random = new Random();
		for (int i = 0; i < len; i++) {
			int data = random.nextInt(35);
			char c = (char) (data < 10 ? data + '0' : data - 10 + 'A');
			rand += c;
		}
		System.out.println("rand = " + rand);
		// 把rand字串寫到session，給LoginServlet檢查時使用
		request.getSession().setAttribute("captcha", rand);

		// 將rand字串繪製成圖
		BufferedImage image = this.generateImage(rand, width, height);

		// 3. 將image輸出至http response
		response.setContentType("image/jpeg");
		try (OutputStream out = response.getOutputStream()) {
			ImageIO.write(image, "JPEG", out);
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
