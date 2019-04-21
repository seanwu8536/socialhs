package com.bc.hobby.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.hobby.dao.BasketballDAO;
import com.bc.hobby.vo.BasketballBoardVO;
import com.bc.share.command.Command;


public class BasketballBoardCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("check2");
		List<BasketballBoardVO> list = BasketballDAO.getBasketList();
		System.out.println("list : "+ list);
		request.setAttribute("basket_list", list);
		return "giyeon/basketballBBS.jsp";
	}

}
