package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MainDAO;
import com.bc.main.vo.BbsCodeVO;
import com.bc.share.command.Command;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String type = request.getParameter("type");
		String result = "";
		List<BbsCodeVO> list = null; 
		
		if (type.equals("hobby")) {
			list = MainDAO.getHobbyList();
		} else if (type.equals("study")) {
			list = MainDAO.getStudyList();
		}
		
		session.setAttribute("hsList", list);
		
		
		
		return result;
	}

}
