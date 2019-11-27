package com.heypeanut.mapper;

import java.util.List;

import com.heypeanut.domain.LoginVO;
import com.heypeanut.domain.MemberVO;

public interface MemberMapper {

	boolean join(MemberVO member);
	LoginVO login(MemberVO member);
	MemberVO read(String id);
	MemberVO checkId(String id);
	
	List<MemberVO> userList();
	boolean updateAuthKey(MemberVO member);
	boolean updateAuthStatus(String id);

}
