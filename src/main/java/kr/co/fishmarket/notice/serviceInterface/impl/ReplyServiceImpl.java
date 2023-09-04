package kr.co.fishmarket.notice.serviceInterface.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fishmarket.notice.domain.Reply;
import kr.co.fishmarket.notice.serviceInterface.ReplyService;
import kr.co.fishmarket.notice.store.ReplyStore;
@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyStore rStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertReply(Reply reply) {
		int result = rStore.insertReply(sqlSession, reply);
		return result;
	}
	
	@Override
	public List<Reply> selectReplyList(int refBoardNo) {
		List<Reply> rList = rStore.selectReplyList(sqlSession, refBoardNo);
		return rList;
	}

	@Override
	public int updateReply(Reply reply) {
		int result = rStore.updateReply(sqlSession, reply);
		return result;
	}

}
