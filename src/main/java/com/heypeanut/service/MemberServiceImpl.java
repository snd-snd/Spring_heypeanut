package com.heypeanut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.heypeanut.domain.LoginVO;
import com.heypeanut.domain.MemberVO;
import com.heypeanut.mapper.MemberMapper;
import com.heypeanut.util.MailHandler;
import com.heypeanut.util.TempKey;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper m_mapper;
	@Autowired
	JavaMailSender mailSender;
	
	@Transactional
	@Override
	public boolean join(MemberVO member) throws Exception {
			
		boolean result = m_mapper.join(member);

		String key = new TempKey().getKey(50, false); // 인증키 생성
		member.setAuthkey(key);
		m_mapper.updateAuthKey(member); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Hey! Peanut! 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>").append("<a href='http://localhost:8090/member/emailConfirm?id=").append(member.getId()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("hyssop9734", "야땅콩");
		sendMail.setTo(member.getEmail());
		sendMail.send();
		
		return result;
	}
	
	@Override
	public LoginVO login(MemberVO member) {
		return m_mapper.login(member);
	}
	
	@Override
	public MemberVO checkId(String id) {
		return m_mapper.checkId(id);
	}
	
	@Override
	public List<MemberVO> userList() {
		return m_mapper.userList();
	}
	
	@Override
	public boolean updateAuthStatus(String id) {
		return m_mapper.updateAuthStatus(id);
	}

}
