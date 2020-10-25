package com.movie.member.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.member.model.MemberVO;
import com.movie.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

	@Inject
	MemberService service;
	
	// 회원가입 GET
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void getRegister() throws Exception {
		log.info("get register");
	}
	
	// 회원가입 POST
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		
		log.info("post register");
		
		service.register(vo);
		
		return null;
		
	}
	
	// ID 중복확인
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) {
		log.info(userId);
		int cnt = service.idCheck(userId);
		return cnt;
	}

}
