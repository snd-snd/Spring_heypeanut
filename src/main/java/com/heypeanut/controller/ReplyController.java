package com.heypeanut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.heypeanut.domain.ReplyVO;
import com.heypeanut.service.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/reply/")
public class ReplyController {

	@Autowired
	ReplyService r_service;
	
	@PostMapping("/add")
	public ResponseEntity<String> add(@RequestBody ReplyVO reply){
		log.info("ReplyController -> 관리자 답글 등록: "+reply);
		
		return r_service.add(reply)
				? new ResponseEntity<String>("success", HttpStatus.OK)
						: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@DeleteMapping("/delete/{rno}")
	public ResponseEntity<String> delete(@PathVariable("rno") int rno){
		log.info("ReplyController -> 관리자 답글 삭제: "+rno);
		
		return r_service.delete(rno)
				? new ResponseEntity<String>("success", HttpStatus.OK)
						: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@GetMapping("/select")
	public ResponseEntity<List<ReplyVO>> select(int qno){
		log.info("ReplyController -> 관리자 답글 리스트 GET: "+qno);
		
		List<ReplyVO> list = r_service.select(qno);
		
		return new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
	}
}
