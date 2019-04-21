package com.bc.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.member.memberDAO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class memWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String recv_id = request.getParameter("recv_id");
		System.out.println("recv_id: "+ recv_id);
		request.setAttribute("recv_id", recv_id);
		return "swan/msnWrite_window.jsp";
	}

}
