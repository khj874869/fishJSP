package kr.co.fishmarket.notice.serviceInterface.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fishmarket.notice.domain.Notice;
import kr.co.fishmarket.notice.domain.PageData;
import kr.co.fishmarket.notice.serviceInterface.NoticeService;
import kr.co.fishmarket.notice.store.NoticeStore;

@Service
public class NoticeServiceimpl implements NoticeService{
	@Autowired
	private NoticeStore store ;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int insertNotice(Notice notice) {
		int result = store.inserNotice(sqlsession,notice);
		return result;
	}
	@Override
	public List<Notice> selectNoticeList(PageData pInfo) {
		List<Notice> nList = store.findList(sqlsession, pInfo);
		return nList;
	}
	@Override
	public int getListCount() {
		int result = store.selectListCount(sqlsession);
		return result;
	}
	@Override
	public List<Notice> searchNoticeByTitle(String searchKeyword) {
		List<Notice> nList = store.searchBySubject(sqlsession,searchKeyword);
		return nList;
	}
	@Override
	public List<Notice> searchContentByCotent(String searchKeyword) {
		List<Notice> sList = store.searchContentByKeyword(sqlsession,searchKeyword);
		return sList;
	}
	@Override
	public List<Notice> searchWriterBysearch(String searchKeyword) {
		List<Notice> sList = store.searchWriterByKeyword(sqlsession,searchKeyword);
		return sList;
	}
	@Override
	public List<Notice> searchAllData(String searchKeyword) {
		List<Notice> sList = store.searchAllByKeyword(sqlsession,searchKeyword);
		return sList;
	}
	@Override
	public List<Notice> searchNoticesByKeyword(PageData pInfo,Map<String,String> paraMap ) {
		List<Notice> sList = store.searchByKeyword(sqlsession,paraMap,pInfo);
		return sList;
	}
	@Override
	public int getListCount(Map<String, String> paraMap) {
		int result = store.searchforMap(sqlsession,paraMap);
		return result;
	}
	@Override
	public int modifyNotice(Notice notice) {
		int result = store.modifyNotice(sqlsession,notice);
		return result;
	}
	@Override
	public int deleteNotice(int noticeNo) {
		int result = store.deleteNotice(sqlsession,noticeNo);
		return result;
	}
	@Override
	public Notice noticeDetail(int noticeNo) {
		Notice notice = store.seeNoticeDetail(sqlsession,noticeNo);
		return notice;
	}

	}

