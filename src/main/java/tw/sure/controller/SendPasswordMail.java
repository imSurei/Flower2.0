package tw.sure.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.sure.model.member.Member;
import tw.sure.model.member.MemberService;
import tw.sure.model.member.MemberServiceImpl;

/**
 * Servlet implementation class SendPasswordMail
 */
@WebServlet("/SendPasswordMail")
public class SendPasswordMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService mService = new MemberServiceImpl();

	public SendPasswordMail() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
//		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Origin", "http://localhost:8080");

		String account = request.getParameter("account");
		String email = request.getParameter("email");

		Member m = mService.findMemberByAccountAndEmail(account, email);
		String s = "Success," + m.getName() + "," + m.getStatus() + "," + m.getAccount() + "," + m.getPassword()
		+ "," + m.getEmail()+ "," + m.getBirthDate()+ "," + m.getGender()+ "," + m.getAddress()+ "," + m.getPhone();
		
		
//		String s = m.getSinglaMember(account);
		String[] result = s.split(",");

		PrintWriter out = response.getWriter();

		if (result[0].equals("Success")) {	
			if (result[5].equals(email)) {
				out.print("Success," + result[5] + "," + result[4]);
			} else {
				out.print("Fail,Email錯誤");
			}
		} else {
			out.print("Fail,帳號錯誤");
		}
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
