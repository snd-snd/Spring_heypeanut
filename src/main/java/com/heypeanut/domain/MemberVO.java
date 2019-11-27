package com.heypeanut.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String name;
	private String password;
	private String confirmPassword;
	private String email;
	private String phone;
	private String postcode;
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	private Date regDate;
	private String authkey;
	private int authstatus;
	
	
	
}
