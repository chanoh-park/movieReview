package com.movie.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.movie.member.dao.MemberDAO;
import com.movie.member.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;
	
	// 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {

		dao.register(vo);
		
	}
	
	// ID 중복확인
	@Override
	public int idCheck(String userId) {
		
		int cnt = dao.idCheck(userId);
		
		return cnt;
		
	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return dao.login(vo);
		
	}

	// 회원정보 수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		
		dao.memberUpdate(vo);
		
	}
	
	// 비밀번호 확인
	@Override
	public int pwCheck(MemberVO vo) throws Exception {
		
		int result = dao.pwCheck(vo);
		
		return result;
		
	}
	
	// 회원탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		
		dao.memberDelete(vo);
		
	}

}
