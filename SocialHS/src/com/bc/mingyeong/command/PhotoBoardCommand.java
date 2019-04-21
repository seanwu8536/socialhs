package com.bc.mingyeong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.hobby.dao.PhotoDAO;
import com.bc.hobby.vo.PhotoBoardVO;
import com.bc.share.command.Command;

public class PhotoBoardCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<PhotoBoardVO> list = PhotoDAO.getPhotoList();
		request.setAttribute("list", list);
		return "mingyeong/photoBoard.jsp";
	}
	

}
