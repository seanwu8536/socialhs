package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class QNAupdateCommand  implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		
		BoardVO bvo = QNA_DAO.selectOne(bb_idx);
		request.setAttribute("BoardVO", bvo);
		
		String path = "minseong/QNAupdate.jsp";
		
		return path;
	}

}
