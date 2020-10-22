package com.movie.member.service;

import com.movie.member.model.MemberVO;

public interface MemberService {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;
	
	/*
	// 아이디 중복 체크
	public int idChk(MemberVO vo) throws Exception;
	*/
	
}
