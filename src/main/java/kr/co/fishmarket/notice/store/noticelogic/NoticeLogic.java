package kr.co.fishmarket.notice.store.noticelogic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.fishmarket.notice.domain.Notice;
import kr.co.fishmarket.notice.domain.PageData;
import kr.co.fishmarket.notice.store.NoticeStore;
@Repository
public class NoticeLogic implements NoticeStore{
	
	@Override
	public int inserNotice(SqlSession session, Notice notice) {
		int result = session.insert("NoticeMapper.insertNotice",notice);
		return result;
	}

	@Override
	public List<Notice> findList(SqlSession session,PageData pInfo) {
		int limit =10 ;
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Notice>nList = session.selectList("NoticeMapper.selectList",null,rowBounds);
		return nList;
	}

	@Override
	public int selectListCount(SqlSession session) {
		int result =session.selectOne("NoticeMapper.selectListCount");
		return result;
	}

	@Override
	public List<Notice> searchBySubject(SqlSession session, String searchKeyword) {
		List<Notice> nList = session.selectList("NoticeMapper.selectConditionSubject", searchKeyword);
		return nList;
	}

	@Override
	public List<Notice> searchContentByKeyword(SqlSession session, String searchKeyword) {
		List<Notice> sList = session.selectList("NoticeMapper.selectNoticeContent",searchKeyword);
		return sList;
	}

	@Override
	public List<Notice> searchWriterByKeyword(SqlSession session, String searchKeyword) {
		List<Notice> sList = session.selectList("NoticeMapper.selectWriterByKeyword",searchKeyword);
		return sList;
	}

	@Override
	public List<Notice> searchAllByKeyword(SqlSession session, String searchKeyword) {
		List<Notice> sList = session.selectList("NoticeMapper.selectAllData",searchKeyword);
		return sList;
	}

	@Override
	public List<Notice> searchByKeyword(SqlSession session,Map<String,String> paraMap ,PageData pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<Notice> sList = session.selectList("NoticeMapper.selectAllDataKeyword",paraMap,rowBounds);

		return sList;
	}

	@Override
	public int searchforMap(SqlSession session, Map<String, String> paraMap) {
		int result = session.selectOne("NoticeMapper.selectListCount", paraMap);
		return result;
	}

	@Override
	public int modifyNotice(SqlSession sqlsession, Notice notice) {
		int result = sqlsession.update("NoticeMapper.modifyNotice",notice);
		return result;
	}

	@Override
	public int deleteNotice(SqlSession sqlsession, int noticeNo) {
		int result =sqlsession.delete("NoticeMapper.deleteNotice",noticeNo);
		return result;
	}

	@Override
	public Notice seeNoticeDetail(SqlSession sqlsession,int noticeNo) {
		Notice notice = sqlsession.selectOne("NoticeMapper.selectOnenotice",noticeNo);
		return notice;
	}
}
