package kr.co.fishmarket.member.serviceInterface.servicelogic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fishmarket.member.domain.Member;
import kr.co.fishmarket.member.serviceInterface.MemberService;
import kr.co.fishmarket.member.store.MemberStore;
import kr.co.fishmarket.member.store.logic.MemberStorelogic;
@Service
public class Memberservicelmpl implements MemberService {
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	private MemberStore mStore;
	public Memberservicelmpl() {
		mStore = new MemberStorelogic();
		}

	@Override
	public int insertMember(Member member) {
		int result = mStore.insertMember(sqlsession, member);
		
		
		return result;
	}

	@Override
	public int deleteMemeber(String memberId) {
		int result = mStore.deleteMemeber(sqlsession, memberId);
		
		return result;
	}

	@Override
	public int updateMember(Member member) {
		int result = mStore.updateMember(sqlsession, member);
		return result;
	}

	@Override
	public Member selectCheckLogin(Member member) {
		Member mOne = mStore.selectChecklogin(sqlsession, member);
		return mOne;
	}

	@Override
	public Member selectOneById(String memberId) {
		Member mOne = mStore.selectOneById(sqlsession, memberId);
		return mOne;
	}

}
