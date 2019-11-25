package com.heypeanut.service;

import java.util.List;

import com.heypeanut.domain.OrderInfo;
import com.heypeanut.domain.ProductVO;
import com.heypeanut.util.Criteria;

public interface ProductService {

	boolean register(ProductVO product);
	List<ProductVO> list(Criteria cri);
	List<ProductVO> nonList(Criteria cri);	
	int listTotalCount(Criteria cri);
	ProductVO detail(int pno);
	
	OrderInfo order(String id, int pno);
}
