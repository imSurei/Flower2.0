package tw.sure.model.member;

import java.util.List;

import tw.sure.model.product.Product;

public class MemberServiceImpl implements MemberService {

	private MemberDao mDao = new MemberDaoImpl();

	@Override
	public boolean existsAccount(String account) {
		Member m = mDao.findMemberByAccount(account);
		if (m.getAccount() == null) {
			return false;
		}
		return true;
	}

	@Override
	public Member loginMember(Member m) {
		return mDao.findMemberByAccountAndPassword(m.getAccount(), m.getPassword());
	}

	@Override
	public void registerMember(Member m,String status) {
		mDao.insertMember(m, status);
	}

	@Override
	public List<Member> findAllMembers() {
		return mDao.findAllMembers();
	}

	@Override
	public Member findMemberByAccount(String account) {
		return mDao.findMemberByAccount(account);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	@Override
	public void deleteMember(int id) {
		mDao.deleteMember(id);
	}

	@Override
	public Member findMemberByAccountAndEmail(String account, String email) {
		return mDao.findMemberByAccountAndEmail(account, email);
	}
	
}
