package com.bc.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.comment.dao.CommentDAO;
import com.bc.main.dao.MainDeleteDAO;
import com.bc.share.command.Command;

public class a_delCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String bb_idx = request.getParameter("bb_idx");
		CommentDAO.deleteComBb_idx(bb_idx);
		MainDeleteDAO.deleteB_board(bb_idx);
		
		String path = request.getParameter("path");
		String result = null;
		if (path.equals("all")) {
			result = "Admin/A_allwriteList.jsp";
		} else if (path.equals("stu")) {
			result = "Admin/A_studylist.jsp";
		} else if (path.equals("hob")) {
			result = "Admin/A_hobbylist.jsp";
		}
		return result;
	}
	

}
