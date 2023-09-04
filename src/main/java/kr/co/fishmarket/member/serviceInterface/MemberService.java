package kr.co.fishmarket.member.serviceInterface;

import kr.co.fishmarket.member.domain.Member;

public interface MemberService {
	public int insertMember(Member member);
	public int deleteMemeber(String memberId);
	public int updateMember(Member member);
	public Member selectCheckLogin(Member member);
	public Member selectOneById(String memberId);
}
