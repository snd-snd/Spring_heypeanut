package com.heypeanut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heypeanut.domain.PageVO;
import com.heypeanut.domain.QNAVO;
import com.heypeanut.service.QNAService;
import com.heypeanut.util.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna/")
public class QNAController {

	@Autowired
	QNAService q_service;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("QNAController -> QNA 게시판 요청");
		
		List<QNAVO> list = q_service.list(cri);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("page", new PageVO(cri, q_service.listTotalCount(cri)));		
		}
		
	}
	
	@GetMapping("/register")
	public void register() {
		log.info("QNAController -> QNA 글쓰기 요청");
	}
	
	@PostMapping("/register")
	public String register(QNAVO qna) {
		log.info("QNAController -> QNA 글쓰기");
		
		q_service.register(qna);
	
		return "redirect:/qna/list";
	}
	
	@GetMapping("/read")
	public void read(Model model, int qno) {
		log.info("QNAController -> QNA 긁읽기 요청");
		
		QNAVO qna = q_service.read(qno);
		if (qna != null) {
			model.addAttribute("qna", qna);
		}
	}
	
}
