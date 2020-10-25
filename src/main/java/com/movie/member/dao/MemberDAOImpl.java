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
	
}
