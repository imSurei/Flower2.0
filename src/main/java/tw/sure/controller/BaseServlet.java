package tw.sure.controller;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getParameter("action");

//		if ("login".equals(action)) {
//			login(request, response);
//
//		} else if ("register".equals(action)) {
//			register(request, response);
//		}

		// 使用反射機制，優化大量if else判斷程式碼
		try {
				Method method = this.getClass().getDeclaredMethod(action, HttpServletRequest.class,
						HttpServletResponse.class);
				method.invoke(this, request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
