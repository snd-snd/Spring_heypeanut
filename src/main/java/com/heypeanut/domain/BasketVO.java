package com.heypeanut.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BasketVO {

	private int bno;
	private String id;
	private int pno;
	private String pname;
	private int price;
	private int amount;
	private Date regDate;

}
