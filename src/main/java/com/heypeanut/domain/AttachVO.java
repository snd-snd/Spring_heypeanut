package com.heypeanut.domain;

import lombok.Data;

@Data
public class AttachVO {
	
	private String uploadPath;
	private String uuid;
	private String fileName;
	private int pno;
}
