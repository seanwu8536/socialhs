package com.bc.member.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.bc.member.memberDAO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class loginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "mingyeong/loginidchk.jsp";
		
	}
	
}
