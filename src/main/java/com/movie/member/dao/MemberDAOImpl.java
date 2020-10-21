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
	
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		
		int result = sql.selectOne("MemberMapper.idChk", vo);
		
		return result;
		
	}
	
}
