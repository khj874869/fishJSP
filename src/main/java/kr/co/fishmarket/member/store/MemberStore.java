package kr.co.fishmarket.member.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.fishmarket.member.domain.Member;

public interface MemberStore {
	public int insertMember(SqlSession session, Member member) ;
	

	public int deleteMemeber(SqlSession session, String memberId) ;
		

	public int updateMember(SqlSession session, Member member) ;
	

	public Member selectChecklogin(SqlSession session,Member member) ;
	

	public Member selectOneById(SqlSession session, String memberId) ;
		
}
