package com.heypeanut.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int rno;
	private String content;
	private Date regDate;
	private int qno;
	
}
