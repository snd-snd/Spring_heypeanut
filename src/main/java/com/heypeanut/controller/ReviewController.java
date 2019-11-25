package com.heypeanut.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.heypeanut.domain.ReviewPageVO;
import com.heypeanut.domain.ReviewVO;
import com.heypeanut.service.ReviewService;
import com.heypeanut.util.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/review/")
public class ReviewController {

	@Autowired
	ReviewService r_service;
	
	@GetMapping("/list")
	public ResponseEntity<ReviewPageVO> reviewList(int pno, int page){
		log.info("ReviewController -> 리뷰 리스트 GET: "+pno+","+page);
		
		ReviewPageVO instance = r_service.list(new Criteria(page, 5), pno);
		
		return new ResponseEntity<ReviewPageVO>(instance, HttpStatus.OK);
	}
	
	@GetMapping("/read")
	public ResponseEntity<ReviewVO> reviewList(int rno){
		log.info("ReviewController -> 리뷰 디테일 GET: "+rno);
		
		ReviewVO review = r_service.read(rno);
		
		return new ResponseEntity<ReviewVO>(review, HttpStatus.OK);
	}
	
	@PostMapping("/add")
	public ResponseEntity<String> add(@RequestBody ReviewVO review){
		log.info("ReviewController -> 리뷰 작성: "+review);
		
		return r_service.add(review)
				? new ResponseEntity<String>("success", HttpStatus.OK)
						: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
}
