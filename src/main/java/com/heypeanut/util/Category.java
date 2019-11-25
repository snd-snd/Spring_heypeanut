package com.heypeanut.util;

import lombok.AllArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
public class Category {

	String category;
	
	public String getCategory() {
		
		String result = "";
		
		if (category.equals("nuts")) {
			result = "견과류";
		} else if (category.equals("fruit")) {
			result = "건과류";
		} else if (category.equals("fish")) {
			result = "건어물";
		} else if (category.equals("powder")) {
			result = "건강분말";
		} else if (category.equals("snacks")) {
			result = "스낵류";
		} else if (category.equals("all")) {
			result = "전체상품";
		} else {
			result = category;
		}

		return result;
	}
	
	
}
