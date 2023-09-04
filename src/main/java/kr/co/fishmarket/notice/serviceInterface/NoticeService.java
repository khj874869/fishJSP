package kr.co.fishmarket.notice.serviceInterface;

import java.util.List;
import java.util.Map;

import kr.co.fishmarket.notice.domain.Notice;
import kr.co.fishmarket.notice.domain.PageData;

public interface NoticeService {
	int insertNotice(Notice notice);

	List<Notice> selectNoticeList(PageData pInfo);

	int getListCount();
	

	List<Notice> searchNoticeByTitle(String searchKeyword);

	List<Notice> searchContentByCotent(String searchKeyword);

	List<Notice> searchWriterBysearch(String searchKeyword);

	List<Notice> searchAllData(String searchKeyword);

	List<Notice> searchNoticesByKeyword(PageData pInfo, Map<String,String> paraMap );
	
	int getListCount(Map<String, String> paraMap);

	int modifyNotice( Notice notice);

	int deleteNotice(int noticeNo);

	Notice noticeDetail(int noticeNo);

}
