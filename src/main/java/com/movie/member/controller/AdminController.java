package com.movie.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.member.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AdminController {

	// 관리자 페이지
	@RequestMapping(value = "/member/admin", method=RequestMethod.GET)
	public void getAdmin(MemberVO vo) throws Exception {
		
		log.info("get admin");
		
	}
	
}
