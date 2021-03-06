package com.heypeanut.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.heypeanut.domain.ProductVO;
import com.heypeanut.util.Criteria;

public interface ProductMapper {

	boolean register(ProductVO product);
	List<ProductVO> list(Criteria cri);
	List<ProductVO> nonList(Criteria cri);	
	List<ProductVO> topList();	
	List<ProductVO> newList();	
	List<ProductVO> weekList();	
	int listTotalCount(Criteria cri);
	ProductVO detail(@Param("pno") int pno);
	
	boolean scoreUp(@Param("score") int score,@Param("pno") int pno);
	boolean weekUp(@Param("amount") int amount,@Param("pno") int pno);
	boolean weekSet();
}
