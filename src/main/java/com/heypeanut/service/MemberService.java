package com.heypeanut.service;

import java.util.List;

import com.heypeanut.domain.LoginVO;
import com.heypeanut.domain.MemberVO;

public interface MemberService {

	boolean join(MemberVO member) throws Exception;
	LoginVO login(MemberVO member);
	MemberVO checkId(String id);
	
	List<MemberVO> userList();
	boolean updateAuthStatus(String id);
}
