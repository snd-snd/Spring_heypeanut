package com.heypeanut.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/review/")
public class ReviewController {

	public ResponseEntity<String> reviewList(){
		log.info("ReviewController -> 리뷰 리스트 GET");
		
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
