package com.bc.minseong.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class QNAupdateOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		String path = null;

		BoardVO bbvo = new BoardVO();
		bbvo.setTitle(request.getParameter("title"));
		bbvo.setContent(request.getParameter("content"));
		bbvo.setBb_idx(Integer.parseInt(bb_idx));
		int result = QNA_DAO.update(bbvo);
 
		path = "QNA?type=QNAone&bb_idx="+bb_idx;

		return path;

	}
}
