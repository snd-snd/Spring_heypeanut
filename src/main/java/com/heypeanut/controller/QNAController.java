package com.heypeanut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		log.info("QNAController -> QNA 게시판 요청: "+cri);
		
		List<QNAVO> list = q_service.list(cri);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("page", new PageVO(cri, q_service.listTotalCount(cri)));		
		}
		
	}
	
	@GetMapping("/register")
	public void register(@ModelAttribute("cri") Criteria cri) {
		log.info("QNAController -> QNA 글쓰기 요청: "+cri);
		
	}
	
	@PostMapping("/register")
	public String register(QNAVO qna) {
		log.info("QNAController -> QNA 글쓰기: "+qna);
		
		q_service.register(qna);
	
		return "redirect:/qna/list";
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(Model model, int qno, @ModelAttribute("cri") Criteria cri) {
		log.info("QNAController -> QNA 긁읽기/글수정 요청: "+qno+","+cri);
		
		QNAVO qna = q_service.read(qno);
		if (qna != null) {
			String temp = qna.getContent();
			temp = temp.replace("\n","");//공백제거 
			temp = temp.replace("\r","");//공백제거 		
			qna.setContent(temp);		
			
			model.addAttribute("qna", qna);
		}
	}
	
	@PostMapping("/modify")
	public String modify(QNAVO qna, Criteria cri, RedirectAttributes rttr) {
		log.info("QNAController -> QNA 글수정: "+qna+","+cri);
			
		if (q_service.modify(qna)) {
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());		
			rttr.addAttribute("type", cri.getType());			
			rttr.addAttribute("keyword", cri.getKeyword());
		}	
	
		return "redirect:/qna/list";
	}
	
	@PostMapping("/remove")
	public String remove(int qno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("QNAController => 글삭제: "+qno+","+cri);
				
		if (q_service.remove(qno)) {
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
		}	
	
		return "redirect:/qna/list";
	}
	
}
