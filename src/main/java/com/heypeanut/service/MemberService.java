package com.heypeanut.service;

import com.heypeanut.domain.LoginVO;
import com.heypeanut.domain.MemberVO;

public interface MemberService {

	boolean join(MemberVO member);
	LoginVO login(MemberVO member);
}
