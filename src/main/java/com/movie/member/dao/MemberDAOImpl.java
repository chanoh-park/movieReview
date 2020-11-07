package com.movie.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.member.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sql;

	// 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		
		sql.insert("MemberMapper.register", vo);
		
	}
	
	// ID 중복확인
	@Override
	public int idCheck(String userId) {
		
		int cnt = sql.selectOne("MemberMapper.idCheck", userId);
		
		return cnt;
		
	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return sql.selectOne("MemberMapper.login", vo);
		
	}
	
	// 회원정보 수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		
		sql.update("MemberMapper.memberUpdate", vo);
		
	}
	
	// 비밀번호 확인
	@Override
	public int pwCheck(MemberVO vo) throws Exception {
		
		int result = sql.selectOne("MemberMapper.pwCheck", vo);
		
		return result;
		
	}
	
	// 회원탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		
		sql.delete("MemberMapper.memberDelete", vo);
		
	}
	
	// 아이디 비밀번호 확인
	@Override
	public int loginCheck(MemberVO vo) throws Exception {
		
		int result = sql.selectOne("MemberMapper.loginCheck", vo);
		
		return result;
		
	}

}
