package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.dao.CommentDAO;
import com.bc.main.vo.CommentVO;
import com.bc.share.command.Command;

public class CommentDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bbc_idx = request.getParameter("bbc_idx");
		String chk = request.getParameter("chk");
		
		CommentVO cvo = new CommentVO();
		System.out.println("cvo : " + cvo);
		CommentDAO.deleteComment(bbc_idx);
		return "minseong/bullteinBoardOne.jsp";
	}

}
