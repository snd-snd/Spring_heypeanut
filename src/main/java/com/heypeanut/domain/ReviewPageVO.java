package com.heypeanut.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReviewPageVO {

	private List<ReviewVO> list;
	private int totalCount;
}
