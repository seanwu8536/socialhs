package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class QNAoneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		BoardVO bbvo = QNA_DAO.selectOne(bb_idx);
		System.out.println("QNA / bbvo : " + bbvo);
		request.setAttribute("BoardVO", bbvo);
		return "minseong/QNAone.jsp";
	}

}
