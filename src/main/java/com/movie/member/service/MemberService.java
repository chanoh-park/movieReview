package com.movie.member.service;

import com.movie.member.model.MemberVO;

public interface MemberService {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;

	// ID 중복확인
	public int idCheck(String userId);
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 회원정보 수정
	public void memberUpdate(MemberVO vo) throws Exception;
	
	// 비밀번호 확인
	public int pwCheck(MemberVO vo) throws Exception;
	
	// 회원탈퇴
	public void memberDelete(MemberVO vo) throws Exception;

}
