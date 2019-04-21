package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class BullteinBoardBadCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String bb_idx = request.getParameter("bb_idx");
		System.out.println("bb_idx bad : "  + bb_idx);
		
		int result = BullteinBoardDAO.updateBad(bb_idx);
		BoardVO bbvo = BullteinBoardDAO.selectOne(bb_idx);
		
		System.out.println("result : " + result);
		session.setAttribute("BoardVO", bbvo);
		return "minseong/bullteinBoardOne.jsp";
	}

}
