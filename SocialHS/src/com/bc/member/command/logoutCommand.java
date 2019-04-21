package com.bc.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.memberDAO;
import com.bc.share.command.Command;

public class logoutCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		String path = null;
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("로그아웃 되었습니다!");
		
		return "index.jsp";
		
	}
	
}
