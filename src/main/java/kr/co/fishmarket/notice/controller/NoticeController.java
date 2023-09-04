package kr.co.fishmarket.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.fishmarket.notice.domain.Notice;
import kr.co.fishmarket.notice.domain.PageData;
import kr.co.fishmarket.notice.serviceInterface.NoticeService;
@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	@RequestMapping(value="/notice/insert.do",method=RequestMethod.GET)
	public String insertNotice() {
		return "notice/insert";
	}
	@RequestMapping(value="/notice/insert.do",method=RequestMethod.POST)
	public String insetNotice(@ModelAttribute Notice notice,
			@RequestParam(value="uploadFile",required=false) MultipartFile uploadFile 
			,Model model,HttpServletRequest  request) {
		try {
			if(uploadFile!=null&&!uploadFile.getOriginalFilename().equals("")) {
				Map<String,Object> nMap = this.saveFile(uploadFile, request);
				String FileName = (String)nMap.get("Filename");
				String fileRename = (String)nMap.get("fileRename");
				String savePath = (String)nMap.get("filePath");
				long filelength=(long)nMap.get("fileLength");
				notice.setNoticeFilename(FileName);
				notice.setFileRename(fileRename);
				notice.setNoticeFilepath(savePath);
				notice.setNoticeFilelength(filelength);
			}
			int result = service.insertNotice(notice);
			if(result>0) {
				return "redirect:/notice/list.do";
			}
			else {
				model.addAttribute("msg", "공지사항 등록이 실패 하였습니다.");
				model.addAttribute("error", "공지사항 등록 실패");
				model.addAttribute("url","/notice/insert.kh");
				return "common/errorpage";
				}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 요망");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url","/notice/insert.do");
			return "common/error";
		}
	}
	@RequestMapping(value="/notice/list.do",method=RequestMethod.GET)
	public String showNoticeList(Model model,@RequestParam(value="currentPage",required=false,defaultValue="1") Integer currentPage
			) {
		try {
			int totalCount = service.getListCount();
			PageData  pInfo = this.getPageInfo(totalCount, currentPage);
			List<Notice> nList =service.selectNoticeList(pInfo);
			if(nList.size()>0) {
			model.addAttribute("pInfo", pInfo);
			model.addAttribute("nList",nList);
			return "notice/list";
			}else {
				model.addAttribute("msg", "관리자에게 문의 요망");
				model.addAttribute("error", "데이터가 입력되지 않았습니다.");
				model.addAttribute("url","/index.jsp");
				return "common/error";	
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 요망");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url","/index.jsp");
			return "common/error";		}
	}
	public PageData  getPageInfo(int totalCount,int currentPage) {
		PageData  page =null;
		int recordCountPerPage =10;
		int naviCountPerPage =10;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		naviTotalCount =(int)((double)totalCount/recordCountPerPage + 0.9);
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage+1;
		endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi>naviTotalCount) {
			endNavi=naviTotalCount;
		}
		page = new PageData(recordCountPerPage, currentPage, startNavi, endNavi, naviCountPerPage, naviTotalCount);

		return page;
	}
		@RequestMapping(value="/notice/search.do",method=RequestMethod.GET)
		public String serachnoticeList(@RequestParam("searchCondition") String searchCondition,@RequestParam("searchKeyword") String searchKeyword,
				@RequestParam(value="page", required=false,defaultValue="1") Integer currentPage
				,Model model) {
			Map<String,String> paraMap = new HashMap<String,String>();
			paraMap.put("searchCondition",searchCondition);
			paraMap.put("searchKeyword",searchKeyword);
			int totalCount=service.getListCount(paraMap);
			PageData  pInfo = this.getPageInfo(totalCount, currentPage);
			List<Notice> searchList = service.searchNoticesByKeyword(pInfo,paraMap);
			if(!searchList.isEmpty()) {
				model.addAttribute("searchCondition", searchCondition);
				model.addAttribute("searchKeyword",searchKeyword);
				model.addAttribute("pInfo",pInfo);
				model.addAttribute("sList",searchList);
				return "notice/search";
			}
			else 
			{
				model.addAttribute("msg", "관리자에게 문의 요망");
			model.addAttribute("error", "데이터가 입력되지 않았습니다.");
			model.addAttribute("url","/notice/list.kh");
			return "common/errorpage";	

			}
		}
		

	
		
		@RequestMapping(value="/notice/delete.do",method=RequestMethod.GET)
		public String deleteNotice(@RequestParam("noticeNo") int noticeNo,Model model) {
			try {
				int result = service.deleteNotice(noticeNo);
				if(result>0) {
					return "notice/list";
				}
				else {
					model.addAttribute("msg", "관리자에게 문의 요망");
					model.addAttribute("error", "데이터가 입력되지 않았습니다.");
					model.addAttribute("url","/notice/list.do");
					return "common/errorpage";	
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("error","수정 실패");
				return "common/errorpage";
			}
		}
		@RequestMapping(value="/notice/detail.do",method=RequestMethod.GET)
		public String detailNotice(@RequestParam("noticeNo") int noticeNo,Model model) {
			try {
				Notice notice = service.noticeDetail(noticeNo);
				if(notice!=null) {
					model.addAttribute("notice",notice);
					return "notice/detail";
				}else {
					model.addAttribute("msg", "관리자에게 문의 요망");
					model.addAttribute("error", "데이터가 입력되지 않았습니다.");
					model.addAttribute("url","/notice/list.do");
					return "common/errorpage";	
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("error","수정 실패");
				return "common/errorpage";
			}
		}
		@RequestMapping(value="/notice/modify.do",method=RequestMethod.GET)
		public String findmodifynotice(@RequestParam("noticeNo") Integer noticeNo,Model model) {
			Notice noticeOne = service.noticeDetail(noticeNo);
			model.addAttribute("notice",noticeOne);
			return "notice/modify";
		}
		@RequestMapping(value="/notice/modify.do",method=RequestMethod.POST)
		public String findmodifyNotice(@ModelAttribute("notice") Notice notice,Model model,@RequestParam(value="uploadFile",required=false) MultipartFile uploadFile,HttpServletRequest request,HttpServletResponse reponse) {
			try {
				String filename = notice.getNoticeFilename();
				if(uploadFile !=null && !uploadFile.isEmpty()) {
					this.deleteFile(request, filename);
				}
				Map<String,Object> infoMap = this.saveFile(uploadFile, request);
				String noticeFilename = (String)infoMap.get("Filename");
				String noticeFilerename =(String)infoMap.get("fileRename");
				long  noticeFilelength = (long)infoMap.get("fileLength");
				notice.setNoticeFilename(noticeFilename);
				notice.setFileRename(noticeFilerename);
				notice.setNoticeFilepath((String)infoMap.get("filePath"));
				notice.setNoticeFilelength(noticeFilelength);
				int result = service.modifyNotice(notice);
				if(result>0) {
					return "reditect:/notice/detail.do?noticeNo="+notice.getNoticeNo();
				}else {
					model.addAttribute("msg", "관리자에게 문의 요망");
					model.addAttribute("error", "정보가 입력되지 않았습니다.");
					model.addAttribute("url","/notice/list.do");
					return "common/errorpage";	
			}} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error","수정 실패");
			return "common/errorpage";
			}
		}
		public Map<String,Object> saveFile(MultipartFile uploadFile,HttpServletRequest request) throws Exception{
			Map<String,Object> infoMap = new HashMap<String,Object>();
			String Filename = uploadFile.getOriginalFilename();
			String root = request.getSession().getServletContext().getRealPath("resources");
			String saveFolder = root+"\\nuploadFiles";
			File folder = new File(saveFolder);
			if(!folder.exists()) {
				folder.mkdir();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMDDHHmmss");
			String strResult = sdf.format(new Date(System.currentTimeMillis()));
			String ext = Filename.substring(Filename.lastIndexOf(".")+1);
			String FileRename = "N"+strResult+"."+ext;
			String savePath = saveFolder+"\\"+Filename;
			File file = new File(savePath);
			uploadFile.transferTo(file);
			long fileLength=uploadFile.getSize();
			infoMap.put("Filename", Filename);
			infoMap.put("fileRename", FileRename);
			infoMap.put("filePath",savePath);
			infoMap.put("fileLength",fileLength);
			return infoMap;
			
		}
		private void deleteFile(HttpServletRequest request, String fileName) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String delFilepath = root+"\\nuploadFiles\\"+fileName;
			File file = new File(delFilepath);
			if(file.exists()) {
				file.delete();
			}
		}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

