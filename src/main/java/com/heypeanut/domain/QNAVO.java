package com.heypeanut.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QNAVO {

	private int qno;
	private String title;
	private String content;
	private String writer;
	private String name;
	private Date regDate;
	private int hit;
	
}
