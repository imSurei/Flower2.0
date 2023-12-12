package tw.sure.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.sure.model.member.Member;
import tw.sure.model.member.MemberService;
import tw.sure.model.member.MemberServiceImpl;
import tw.sure.utils.WebUtils;

//@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private MemberService mService = new MemberServiceImpl();

	/**
	 * 處理login的請求
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 獲取請求參數
		String account = request.getParameter("account");
		String password = request.getParameter("password");

		// 調用service方法，處理業務
		Member member = new Member();
		member.setAccount(account);
		member.setPassword(password);

		Member loginMember = mService.loginMember(member);

		// 根據用戶名及密碼，進行判斷
		if (loginMember.getAccount() == null || loginMember.getPassword() == null) {
			// 用戶不存在 -> 帳號或密碼錯誤，提示錯誤信息，回顯帳號，並重新跳轉到登陸頁面
			request.setAttribute("msg", "帳號或密碼輸入錯誤，請重新輸入");
			request.setAttribute("account", account);
			request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
		} else {
			// 登陸成功，跳轉到首頁
			// 保存用戶登陸信息到session，登陸後在header中顯示用戶帳號名
			request.getSession().setAttribute("member", loginMember);

			request.getRequestDispatcher("/pages/index.jsp").forward(request, response);
		}
	}

	/**
	 * 登出用戶 --> 銷毀session --> 重定向到首頁
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getSession().invalidate();

		response.sendRedirect(request.getContextPath() + "/pages/index.jsp");
	}

	/**
	 * 處理register的請求
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 獲取請求參數
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");

		// 僅調用Service 檢查用戶名是否可用（Web層不能直接操作Dao）
		if (mService.existsAccount(account)) {
			// -->帳號存在 輸入帳號不可用：跳回註冊頁面,並顯示錯誤信息，及回顯已填寫的部分信息
			request.setAttribute("msg", "帳號已存在，請重新輸入另一帳號");
			request.setAttribute("name", name);
			request.setAttribute("birthDate", birthDate);
			request.setAttribute("gender", gender);
			request.setAttribute("email", email);
			request.setAttribute("address", address);
			request.setAttribute("phone", phone);

			System.out.println("帳號 " + account + "已存在，請重新輸入另一帳號");
			request.getRequestDispatcher("/pages/register.jsp").forward(request, response);
		} else {
			// -->可用：調用service保存到數據庫，跳轉到登陸頁面
			Member member = new Member();
//			WebUtils.copyParamsToBean(request, member);
			member.setAccount(account);
			member.setName(name);
			member.setPassword(password);
			member.setBirthDate(birthDate);
			member.setGender(gender);
			member.setEmail(email);
			member.setAddress(address);
			member.setPhone(phone);
			member.setStatus(status);

			mService.registerMember(member, member.getStatus());
			request.setAttribute("msg", "註冊成功，請登陸");
			System.out.println("註冊成功，跳轉到登陸頁面");
			request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
		}

	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 獲取請求參數
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");

		// 僅調用Service 檢查用戶名是否可用（Web層不能直接操作Dao）
		if (mService.existsAccount(account)) {
			// -->帳號存在 輸入帳號不可用：跳回註冊頁面,並顯示錯誤信息，及回顯已填寫的部分信息
			request.setAttribute("msg", "帳號已存在，請重新輸入另一帳號");
			request.setAttribute("name", name);
			request.setAttribute("birthDate", birthDate);
			request.setAttribute("gender", gender);
			request.setAttribute("email", email);
			request.setAttribute("address", address);
			request.setAttribute("phone", phone);

			System.out.println("帳號 " + account + "已存在，請重新輸入另一帳號");
			request.getRequestDispatcher("/pages/member_insert.jsp").forward(request, response);
		} else {
			// -->可用：調用service保存到數據庫，跳轉到登陸頁面
			Member member = new Member();
//			WebUtils.copyParamsToBean(request, member);
			member.setAccount(account);
			member.setName(name);
			member.setPassword(password);
			member.setBirthDate(birthDate);
			member.setGender(gender);
			member.setEmail(email);
			member.setAddress(address);
			member.setPhone(phone);
			member.setStatus(status);

			mService.registerMember(member, member.getStatus());
			System.out.println("用戶新增成功，跳轉到會員管理頁面");
			response.sendRedirect(request.getContextPath() + "/manager/UserServlet?action=list");

		}

	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Member> members = mService.findAllMembers();

		request.setAttribute("members", members);

		request.getRequestDispatcher("/pages/adminMember.jsp").forward(request, response);

	}

	protected void getMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String account = request.getParameter("account");

		Member member = mService.findMemberByAccount(account);

		request.setAttribute("member", member);

		request.getRequestDispatcher("/pages/member_edit.jsp").forward(request, response);

	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member member = new Member();

		member.setId(WebUtils.parseInt(request.getParameter("id"), 0));
		member.setAccount(request.getParameter("account"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setBirthDate(request.getParameter("birthDate"));
		member.setGender(request.getParameter("gender"));
		member.setEmail(request.getParameter("email"));
		member.setAddress(request.getParameter("address"));
		member.setPhone(request.getParameter("phone"));
		member.setStatus(request.getParameter("status"));

		mService.updateMember(member);

		response.sendRedirect(request.getContextPath() + "/manager/UserServlet?action=list");
	}

	protected void updateData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member member = new Member();

		member.setId(WebUtils.parseInt(request.getParameter("id"), 0));
		member.setAccount(request.getParameter("account"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setBirthDate(request.getParameter("birthDate"));
		member.setGender(request.getParameter("gender"));
		member.setEmail(request.getParameter("email"));
		member.setAddress(request.getParameter("address"));
		member.setPhone(request.getParameter("phone"));
		member.setStatus(request.getParameter("status"));

		mService.updateMember(member);

		request.getSession().setAttribute("member", member); // update sessionScope's member info

		response.sendRedirect(request.getHeader("Referer"));

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = WebUtils.parseInt(request.getParameter("id"), 0);
		mService.deleteMember(id);
		response.sendRedirect(request.getContextPath() + "/manager/UserServlet?action=list");

	}

	/**
	 * 忘記密碼時，驗證用戶帳號及郵箱是否存在、正確
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected String forgetPwd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 獲取請求參數
		String account = request.getParameter("account");
		String email = request.getParameter("email");
		System.out.println(account+" ===11111 "+email);

		Member member = mService.findMemberByAccountAndEmail(account, email);
//		System.out.println(member);

		if (member != null) {
			
			System.out.println(member.getEmail()+" ===22222 "+ member.getPassword());
			return "Success," + member.getEmail() + "," + member.getPassword();
			
		} else {
			System.out.println("驗證失敗，無此會員及email信息");
			return "Fail";
		}
	}

}
