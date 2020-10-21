package com.movie.member.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.member.model.MemberVO;
import com.movie.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
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
		
		int result = service.idChk(vo);
		
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {
				service.register(vo);
			} 
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		return "redirect:/";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		
		int result = service.idChk(vo);
		
		return result;
		
	}
	
}
