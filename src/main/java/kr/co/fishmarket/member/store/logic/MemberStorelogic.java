package kr.co.fishmarket.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.fishmarket.member.domain.Member;
import kr.co.fishmarket.member.store.MemberStore;
@Repository
public class MemberStorelogic implements MemberStore{

	@Override
	public int insertMember(SqlSession session, Member member) {
		int result = session.insert("MemberMapper.insertMember",member);
		return result;
	}

	@Override
	public int deleteMemeber(SqlSession session, String memberId) {
		int result = session.delete("MemberMapper.deleteMember",memberId);
		return result;
	}

	@Override
	public int updateMember(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateMember",member);
		
		return result;
	}

	@Override
	public Member selectChecklogin(SqlSession session, Member member) {
		Member mOne= session.selectOne("MemberMapper.selectCheckLogin",member);
		return mOne;
	}

	@Override
	public Member selectOneById(SqlSession session, String memberId) {
		Member mOne = session.selectOne("MemberMapper.selectOneById",memberId);
		return mOne;
	}

}
