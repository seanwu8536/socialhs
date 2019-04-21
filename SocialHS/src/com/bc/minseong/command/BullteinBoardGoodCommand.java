package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class BullteinBoardGoodCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String bb_idx = request.getParameter("bb_idx");
		System.out.println("bb_idx123 : "  + bb_idx);
		
		int result = BullteinBoardDAO.updateGood(bb_idx);
		BoardVO bbvo = BullteinBoardDAO.selectOne(bb_idx);
		
		System.out.println("result : " + result);
		session.setAttribute("BoardVO", bbvo);
		return "minseong/bullteinBoardOne.jsp";
	}

}
