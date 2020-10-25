package com.movie.member.service;

import com.movie.member.model.MemberVO;

public interface MemberService {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;

	// ID 중복확인
	public int idCheck(String userId);

}
