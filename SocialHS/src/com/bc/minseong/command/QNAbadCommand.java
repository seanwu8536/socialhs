package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class QNAbadCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String bb_idx = request.getParameter("bb_idx");
		QNA_DAO.updateBad(bb_idx);
		BoardVO bbvo = QNA_DAO.selectOne(bb_idx);
		session.setAttribute("BoardVO", bbvo);
		return "minseong/QNAone.jsp";
	}

}
