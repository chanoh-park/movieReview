package com.movie.member.dao;

import com.movie.member.model.MemberVO;

public interface MemberDAO {

	// 회원가입
	public void register(MemberVO vo) throws Exception;
	
	/*
	// 아이디 중복 체크
	public int idChk(MemberVO vo) throws Exception;
	*/
	
}
