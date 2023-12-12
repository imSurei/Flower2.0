package tw.sure.test;

import java.util.List;

import tw.sure.model.member.Member;
import tw.sure.model.member.MemberDao;
import tw.sure.model.member.MemberDaoImpl;
import tw.sure.model.member.MemberService;
import tw.sure.model.member.MemberServiceImpl;

public class TestUserDao {

	public static void main(String[] args) {

		MemberDao m = new MemberDaoImpl();
//		Member m2 = m.findMemberByAccountAndEmail("sure", "pitipalaa@gmail.com");
//		System.out.println(m2);
		
		
//		Member member = m.findMemberByAccount("admin");

		// ok
//		System.out.println(member.getAccount() + member.getName() + member.getAddress());
		
		MemberService memberService = new MemberServiceImpl();
		
		Member member = memberService.findMemberByAccountAndEmail("sure", "pitipalaa@gmail.com");
		System.out.println(member);
		
		// ok
//		System.out.println(memberService.existsAccount("admin123")); 

//		// ok
//		Member member = new Member();
//		member.setAccount("admin2");
//		member.setPassword("123");
//		Member loginMember = memberService.loginMember(member);
//		
//		System.out.println(loginMember.getAccount());
//		System.out.println(loginMember.getName());
		
		// ok
//		Member member = new Member("Adam","admin3","123","adam@gmail.com","2020-01-16","m","taiwan","0987654321","admin");
//		memberService.registerMember(member, "member");
		
		// ok
//		List<Member> findAllMembers = memberService.findAllMembers();
//		for(Member m:findAllMembers) {
//			System.out.println(m);
//		}
		
//		Member member = new Member("Adam520","admin","123","adam@gmail.com","2020-01-16","m","taiwan","0987654321","admin");
//		System.out.println(memberService.updateMember(member));
		
	}

}
