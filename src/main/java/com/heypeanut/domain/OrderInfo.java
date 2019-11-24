package com.heypeanut.domain;

import lombok.Data;

@Data
public class OrderInfo {

	private MemberVO member;
	private ProductVO product;
	private int amount;
}
