package com.movie.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.movie.member.model.MemberVO;
import com.movie.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

	@Inject
	MemberService service;

	// 회원가입 GET
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		log.info("get register");
	}

	// 회원가입 POST
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {

		log.info("post register");

		service.register(vo);

		return "redirect:/";

	}

	// ID 중복확인
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) {

		log.info(userId);

		int cnt = service.idCheck(userId);

		return cnt;

	}

//	@RequestMapping(value = "/login", method = RequestMethod.GET) 
//	public ModelAndView memberLoginForm(HttpSession session) {
//		
//		ModelAndView mav = new ModelAndView(); 
//		
//		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
//		
//		/* 생성한 인증 URL을 View로 전달 */ 
//		mav.setViewName("main"); 
//		
//		// 카카오 로그인 
//		mav.addObject("kakao_url", kakaoUrl); 
//		
//		return mav; 
//		
//	}// end memberLoginForm()
	
	
	// 카카오 로그인
	@RequestMapping(value = "/kakaologin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		// 결과값을 node에 담아줌
		JsonNode node = KakaoController.getAccessToken(code);

		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");

		// 사용자의 정보
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);

		String kid = null;
		String kemail = null;
		String kname = null;
		String kimage = null;

		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");

		kid = userInfo.path("id").asText();
		kemail = kakao_account.path("email").asText();
		kname = properties.path("nickname").asText();
		kimage = properties.path("profile_image").asText();
		
		session.setAttribute("kid", kid);
		session.setAttribute("kemail", kemail);
		session.setAttribute("kname", kname);
		session.setAttribute("kimage", kimage);

		mav.setViewName("main");
		
		System.out.println("kid : " + kid);
		
		System.out.println("kemail : " + kemail);

		System.out.println("kname : " + kname);

		System.out.println("kimage : " + kimage);

		return mav;

	}// end kakaoLogin()

	// 로그인 POST
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		log.info("post login");

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
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";

	}

	// 회원정보 페이지
	@RequestMapping(value = "/member/user", method = RequestMethod.GET)
	public void getUser(MemberVO vo) throws Exception {

		log.info("get user");

	}

	// 회원정보 수정
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(MemberVO vo, HttpSession session) throws Exception {

		service.memberUpdate(vo);

		session.invalidate();

		return "redirect:/";

	}

	// 비밀번호 확인
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	@ResponseBody
	public int pwCheck(MemberVO vo) throws Exception {

		int result = service.pwCheck(vo);

		return result;

	}

	// 아이디 비밀번호 확인
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public int loginCheck(MemberVO vo) throws Exception {

		int result = service.loginCheck(vo);

		return result;

	}

	// 회원탈퇴
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
//		
//		// 세션에 있는 member를 가져와 member 변수에 넣는다.
//		MemberVO member = (MemberVO) session.getAttribute("member");
//		
//		// 세션에 있는 비밀번호
//		String sessionPw = member.getUserPw();
//		
//		// vo로 들어오는 비밀번호
//		String voPw = vo.getUserPw();
//		
//		if (!(sessionPw.equals(voPw))) {
//			rttr.addFlashAttribute("msg", false);
//			return "redirect:/";
//		}
//		
		service.memberDelete(vo);

		session.invalidate();

		return "redirect:/";

	}

}
