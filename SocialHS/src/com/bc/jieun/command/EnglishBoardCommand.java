package com.bc.jieun.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;
import com.bc.study.dao.EnglishDAO;
import com.bc.study.vo.EnglishBoardVO;

public class EnglishBoardCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println(">> EnglishBoardCommand 까지 옴");
		List<EnglishBoardVO> list = EnglishDAO.getEngList();
		System.out.println(">> 매퍼");
		System.out.println("list : "+list);
		request.setAttribute("list", list);
		return "jieun/englishBoard.jsp";
	}

}
