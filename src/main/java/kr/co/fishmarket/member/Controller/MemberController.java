package kr.co.fishmarket.member.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.fishmarket.member.domain.Member;
import kr.co.fishmarket.member.serviceInterface.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/index.do",method=RequestMethod.GET)
	public String showindex() {
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/member/register.do",method=RequestMethod.GET)
	public String ShowmemberRegistration(Model model) {
		return "member/memberRegistration";
	}
	
	@RequestMapping(value="/member/register.do",method=RequestMethod.POST)
	public String registerMember(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("username") String memberId,
			@RequestParam("password") String memberPw,
			@RequestParam("member-name") String memberName,
			@RequestParam("age") int memberAge,
			@RequestParam("email") String memberEmail,
			@RequestParam("member-phone") String memberPhone,
			@RequestParam("member-address") String memberAddress,
			Model model
			)
	{
		try {
			Member member = new Member(memberId, memberPw, memberName, memberAge, memberEmail, memberPhone, memberAddress);
			int result = service.insertMember(member);
			if(result>0) {
				return "redirect:/index.jsp";
			}
			else {
				return "member/loginFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "index";
		}
	}
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public String login(Model model) {
		return"member/login";
	}
	@RequestMapping(value="/member/login.do",method=RequestMethod.POST)
	public String memberlogin(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			HttpSession session) {
		try {
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			Member mOne = service.selectCheckLogin(member);
			if(mOne != null) {
				model.addAttribute("memberId",mOne.getMemberId());
				model.addAttribute("memberName",mOne.getMemberName());
				return "member/loginAfter";				
			}
			else {
				return "member/loginFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "member/loginFailed";			
			}
		
		
		
	}
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request, HttpServletResponse response,Model model,SessionStatus session){
		if(session!=null) {
			session.setComplete();
			if(session.isComplete()) {
				
			}
			return "member/login";
		}else {
			model.addAttribute("msg","로그인에 실패하셨습니다.");
			return "member/loginFailed";
			
		}
		
	}
	
	@RequestMapping(value="/member/myinfo.do",method=RequestMethod.GET)
	public String selectDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("memberId") String memberId,Model model) {
		try {
			Member member= service.selectOneById(memberId);
			Member mOne = member;
			if(mOne!=null) {
				model.addAttribute("member",mOne);
				return "member/myInfo";
			}else {
				
				return "redirect:/index.jsp";
			
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
			return "member/loginFailed";
		}
	}
	@RequestMapping(value="/member/delete.do",method=RequestMethod.GET)
	public String deletemember(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("memberId") String memberId,Model model) {
		try {
		int result = service.deleteMemeber(memberId);
		
		if(result>0)
		{
			return "redirect:/member/login.do";
		}else {
			model.addAttribute("msg","삭제에 실패 했습니다.");
			model.addAttribute("error","탈퇴실패");
			model.addAttribute("url", "/index.jsp");
			return  "common/error";
		}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 요망");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url","/index.jsp");			
			return "common/error";
		}
		
	}
	@RequestMapping(value="/member/update.do",method=RequestMethod.GET)
	public String updateMember(Model model,@RequestParam("memberId") String memberId) {
		try {
			
			Member mOne = service.selectOneById(memberId);
			if(mOne!=null) {
				model.addAttribute("member", mOne);
				return "member/modify";
			}else {
				model.addAttribute("msg","수정조회실패");
				model.addAttribute("error","수정조회실패");
				model.addAttribute("url", "/index.jsp");
				return "common/errorpage";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관리자에게 문의 요망");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url","/member/register.do");
			return "common/errorpage";
		}
	}
	@RequestMapping(value="/member/update.do",method=RequestMethod.POST)
	public String modifyMember(@ModelAttribute Member member, Model model) {
		try {
			int result = service.updateMember(member);
			if(result>0) {
				return "redirect:/index.jsp";
			}else {
				model.addAttribute("msg","수정실패");
				model.addAttribute("error","수정실패");
				model.addAttribute("url", "/member/myinfo.do?memberId"+member.getMemberId());
				return "member/myinfo";
			}
		} catch (Exception e) {
			model.addAttribute("msg","수정실패");
			model.addAttribute("error","수정실패");
			model.addAttribute("url", "/index.jsp");
			return "common/errorpage";
		}
	}
	}
	

