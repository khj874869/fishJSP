package kr.co.fishmarket.notice.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.fishmarket.notice.domain.Reply;

public interface ReplyStore {

	/**
	 * 게시글 댓글 등록 Store
	 * @param sqlSession
	 * @param reply
	 * @return
	 */
	int insertReply(SqlSession sqlSession, Reply reply);

	/**
	 * 게시글 댓글 수정 Store
	 * @param sqlSession
	 * @param reply
	 * @return
	 */
	int updateReply(SqlSession sqlSession, Reply reply);

	/**
	 * 댓글 전체 조회 Store
	 * @param sqlSession
	 * @return
	 */
	List<Reply> selectReplyList(SqlSession sqlSession, int refBoardNo);

}