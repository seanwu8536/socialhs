package com.bc.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.member.memberDAO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class memInfoCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String writer = request.getParameter("writer");
		memberVO vo = memberDAO.selectId(writer);
		request.setAttribute("writer", vo);
		
		return "swan/my_window.jsp";
	}

}
