package com.heypeanut.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.heypeanut.domain.LoginVO;

public class LoginHandler extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		LoginVO login = (LoginVO) session.getAttribute("login");		
		
		if (login == null) {		
			response.sendRedirect("/member/login");
			return false;
		}
		
		String uri = request.getRequestURI().substring(1);

		if (uri.contains("admin")) {
			String id = login.getId();
			if (!id.equals("admin")) {
				response.sendRedirect("/error/error403");
				return false;
			}
		}

		return true;
	}
}
