package com.heypeanut.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int rno;
	private String title;
	private String content;
	private String writer;
	private String name;
	private Date regDate;
	private int score;
	private int pno;
	
}