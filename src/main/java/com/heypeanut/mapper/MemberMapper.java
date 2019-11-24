package com.heypeanut.mapper;

import com.heypeanut.domain.LoginVO;
import com.heypeanut.domain.MemberVO;

public interface MemberMapper {

	boolean join(MemberVO member);
	LoginVO login(MemberVO member);
	MemberVO read(String id);
}
