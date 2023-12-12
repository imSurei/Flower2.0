package tw.sure.model.member;

import java.util.List;

public interface MemberDao {
	
	// Read
	Member findMemberByAccount(String account); // 註冊時先查找用戶名是否存在、重複
	Member findMemberByAccountAndEmail(String account,String email); // 忘記密碼時，驗證帳戶和信箱是否存在、正確
	Member findMemberByAccountAndPassword(String account,String password); // 登陸時驗證用戶名及密碼 
	
	// Read All
	List<Member> findAllMembers();
	
	// Create 
	int insertMember(Member m,String status);
	
	// Update
	int updateMember(Member m);
	
	// Delete
	void deleteMember(int id);

}
