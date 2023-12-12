package tw.sure.model.member;

import java.util.List;

import tw.sure.model.product.Product;

/**
 * 在Dao基礎上拉高一層
 * 每個業務 對應 一個方法
 * @author sure
 *
 */
public interface MemberService {
	
	boolean existsAccount(String account);
	
	Member loginMember(Member m);
	
	void registerMember(Member m,String status);
	
	List<Member> findAllMembers();
	
	Member findMemberByAccount(String account);
	
	Member findMemberByAccountAndEmail(String account,String email); 
	
	int updateMember(Member m);
	
	void deleteMember(int id);
}
