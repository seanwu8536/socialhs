package com.bc.messenger.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MessengerDAO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class MsnWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "swan/msnWrite.jsp";
	}

}
