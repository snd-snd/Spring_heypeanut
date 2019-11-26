package com.heypeanut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heypeanut.domain.LoginVO;
import com.heypeanut.domain.MemberVO;
import com.heypeanut.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper m_mapper;
	
	@Override
	public boolean join(MemberVO member) {
		return m_mapper.join(member);
	}
	
	@Override
	public LoginVO login(MemberVO member) {
		return m_mapper.login(member);
	}
	
	@Override
	public MemberVO checkId(String id) {
		return m_mapper.checkId(id);
	}

}
