package kr.co.fishmarket.notice.store.noticelogic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.fishmarket.notice.domain.Reply;
import kr.co.fishmarket.notice.store.ReplyStore;

@Repository
public class ReplyStoreLogic implements ReplyStore{

	@Override
	public int insertReply(SqlSession sqlSession, Reply reply) {
		int result = sqlSession.insert("ReplyMapper.insertReply", reply);
		return result;
	}

	@Override
	public List<Reply> selectReplyList(SqlSession sqlSession, int refBoardNo) {
		List<Reply> rList = sqlSession.selectList("ReplyMapper.selectReplyList", refBoardNo);
		return rList;
	}

	@Override
	public int updateReply(SqlSession sqlSession, Reply reply) {
		int result = sqlSession.update("ReplyMapper.updateReply", reply);
		return result;
	}

}