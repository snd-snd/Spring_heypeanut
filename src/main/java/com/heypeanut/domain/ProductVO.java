package com.heypeanut.domain;

import lombok.Data;

@Data
public class ProductVO {

	private int pno;
	private String category;
	private String pname;
	private int price;
	
	private AttachVO attach;
	
}
