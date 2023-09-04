package kr.co.fishmarket.notice.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.fishmarket.notice.domain.Notice;
import kr.co.fishmarket.notice.domain.PageData;

public interface NoticeStore {

	int inserNotice(SqlSession session, Notice notice);

	List<Notice> findList(SqlSession session,PageData pInfo);

	int selectListCount(SqlSession session);

	List<Notice> searchBySubject(SqlSession session, String searchKeyword);

	List<Notice> searchContentByKeyword(SqlSession session, String searchKeyword);

	List<Notice> searchWriterByKeyword(SqlSession session, String searchKeyword);

	List<Notice> searchAllByKeyword(SqlSession session, String searchKeyword);

	List<Notice> searchByKeyword(SqlSession session,Map<String,String> paraMap,PageData pInfo );

	int searchforMap(SqlSession session, Map<String, String> paraMap);

	int modifyNotice(SqlSession sqlsession, Notice notice);

	int deleteNotice(SqlSession sqlsession, int noticeNo);

	Notice seeNoticeDetail(SqlSession sqlsession, int noticeNo);
}
