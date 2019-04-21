package com.bc.dongwu.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;
import com.bc.study.dao.JapaneseDAO;
import com.bc.study.vo.JapaneseBoardVO;

public class JapaneseCommand implements Command {
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		List<JapaneseBoardVO> list = JapaneseDAO.getJapList();
		request.setAttribute("list", list);
		
		return "dongwu/japaneseBoard.jsp";
	}
}
