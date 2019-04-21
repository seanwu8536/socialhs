package com.bc.messenger.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MessengerDAO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class MsnDelCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String ms_idx = request.getParameter("ms_idx");
		System.out.println("ms_idx: "+ ms_idx);
		MessengerDAO.deleteMsg(ms_idx);
		
		
		return "MessengerController?type=msnList";
	}

}
