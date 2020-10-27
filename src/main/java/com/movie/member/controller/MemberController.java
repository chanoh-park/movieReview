package com.movie.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movie.member.model.MemberVO;
import com.movie.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

	@Inject
	MemberService service;
	
	// 회원가입 GET
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void getRegister() throws Exception {
		log.info("get register");
	}
	
	// 회원가입 POST
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		
		log.info("post register");
		
		service.register(vo);
		
		return "/main";
		
	}
	
	// ID 중복확인
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) {
		log.info(userId);
		int cnt = service.idCheck(userId);
		return cnt;
	}
	
	// 로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		log.info("post login ");
		
		HttpSession session = req.getSession();
		
		MemberVO login = service.login(vo);
		
		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/";
		
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	// 회원정보 페이지
	@RequestMapping(value = "/member/user", method=RequestMethod.GET)
	public void getUser() throws Exception {
		
		log.info("get user");
		
	}

}
