package com.heypeanut.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.heypeanut.domain.LoginVO;
import com.heypeanut.domain.MemberVO;
import com.heypeanut.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/")
@SessionAttributes("login")
public class MemberController {

	@Autowired
	MemberService m_service;
	
	@GetMapping("/joinInfo")
	public void joinInfo() {
		log.info("MemberController -> 회원가입 페이지 요청");
	}
	
	@GetMapping("/join")
	public void join() {
		log.info("MemberController -> 회원가입 페이지 요청");
	}
	
	@PostMapping("/join")
	public String join(MemberVO member, RedirectAttributes rttr) throws Exception {
		log.info("MemberController -> 회원가입 요청");
		if(m_service.join(member)) {
			rttr.addFlashAttribute("authmsg" , "이메일 인증 후 사용가능합니다.");
			return "redirect:/member/login";
		}
		
		return "redirect:/member/join";
	}
	
	@GetMapping("/emailConfirm")
	public String emailConfirm(String id, Model model) throws Exception { // 이메일인증
		m_service.updateAuthStatus(id);
		model.addAttribute("id", id);

		return "/member/emailConfirm";
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("MemberController -> 로그인 페이지 요청");
	}
	
	@PostMapping("/login")
	public String login(MemberVO member, Model model) {
		log.info("MemberController -> 로그인 요청");
		
		LoginVO login = m_service.login(member);
		if (login != null) {
			model.addAttribute("login", login);
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("MemberController -> 로그아웃 요청");
		if (!status.isComplete())
			status.setComplete();
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(String id) {
		
		MemberVO member = m_service.checkId(id);
		
		if (member == null)
			return "true";
		else
			return "false";
		
	}
}
