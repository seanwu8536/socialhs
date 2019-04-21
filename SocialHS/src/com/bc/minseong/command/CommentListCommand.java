package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.dao.CommentDAO;
import com.bc.main.vo.CommentVO;
import com.bc.share.command.Command;

public class CommentListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<CommentVO> cList = CommentDAO.getCommList("bb_idx");
		System.out.println("cList : "+cList);
		request.setAttribute("cList", cList);
		return "minseong/bullteinBoardOne.jsp";
	}

}
