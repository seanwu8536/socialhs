package com.bc.mingyeong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.dao.PhotoDAO;
import com.bc.hobby.vo.PhotoBoardVO;
import com.bc.share.command.Command;

public class PhotoOneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String phot_idx = request.getParameter("phot_idx");
		
		PhotoBoardVO vo = PhotoDAO.photoSelectOne(phot_idx);
		HttpSession session = request.getSession();
		session.setAttribute("PhotoBoardVO", vo);
		
		return "mingyeong/photoOnelist.jsp"; 
	}
	
 
}
