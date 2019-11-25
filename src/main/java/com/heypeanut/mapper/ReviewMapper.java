package com.heypeanut.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.heypeanut.domain.ReviewVO;
import com.heypeanut.util.Criteria;

public interface ReviewMapper {

	boolean add(ReviewVO review);
	List<ReviewVO> list(@Param("cri") Criteria cri,@Param("pno") int pno);
	int totalCount(int pno);
}
