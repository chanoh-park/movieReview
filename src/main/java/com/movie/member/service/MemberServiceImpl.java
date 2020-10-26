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
	
}
