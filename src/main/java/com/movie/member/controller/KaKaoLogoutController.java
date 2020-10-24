package com.movie.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;

@Controller
public class KaKaoLogoutController {
	
	@RequestMapping(value = "/logout", produces = "application/json")
	public String Logout(HttpSession session) {
	    //kakao restapi 객체 선언
		KakaoRestApi kr = new KakaoRestApi();
	    //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
	    JsonNode node = kr.Logout(session.getAttribute("token").toString());
	    //결과 값 출력
	    System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
	    return "redirect:/main";
	}    

}
