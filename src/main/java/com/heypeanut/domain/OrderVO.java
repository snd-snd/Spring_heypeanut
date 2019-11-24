package com.heypeanut.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {

	private int ono;
	private String id;
	private int pno;
	private String pname;
	private int amount;
	private int total;
	private Date regDate;
	private int status;
	
}
