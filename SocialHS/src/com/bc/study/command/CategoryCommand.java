package com.bc.study.command;


import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;
import com.bc.study.dao.StudyDAO;
import com.bc.study.vo.StudyVO;

@WebServlet("/Category")
public class CategoryCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		List<StudyVO> list = StudyDAO.getStudyList();
		request.setAttribute("list", list);
		
		return "dongwu/category.jsp";
	}


}
