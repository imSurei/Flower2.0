package tw.sure.test;

import java.lang.reflect.Method;

public class UserServletTest {

	public void login() {
		System.out.println("login");
	}

	public void register() {
		System.out.println("register");
	}

	public void update() {
		System.out.println("update");
	}

	public void delete() {
		System.out.println("delete");
	}

	public void checkUser() {
		System.out.println("checkUser");
	}

	public static void main(String[] args) {
		
		String action = "login";	
				
		try {
			Method method = UserServletTest.class.getDeclaredMethod(action);
			method.invoke(new UserServletTest());	
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		
	}

}
