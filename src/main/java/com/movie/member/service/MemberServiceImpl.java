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
	
	/*
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		
		int result = dao.idChk(vo);
		
		return result;
		
	}
	*/ 
	
}
