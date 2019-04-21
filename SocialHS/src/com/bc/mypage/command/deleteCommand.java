package com.bc.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.bc.member.memberDAO;
import com.bc.share.command.Command;

public class deleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String chk = request.getParameter("infochk");
		String id = request.getParameter("id");
		String from = request.getParameter("from");
		String path = "";
//		HttpSession session = request.getSession();
//		session.removeAttribute("memberVO");
		memberDAO.delete(id);
			
		System.out.println("회원탈퇴가 되었습니다!");
		if (from.equals("admin")) {
			path = "AdminPage.jsp";
		} else {
			path = "memberController?type=logout";
		}
		System.out.println(path);
		return path;
		
	}
	

}
