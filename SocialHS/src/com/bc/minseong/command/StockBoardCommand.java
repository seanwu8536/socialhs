package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;
import com.bc.study.dao.StockDAO;
import com.bc.study.vo.StockBoardVO;

public class StockBoardCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<StockBoardVO> list = StockDAO.getStockList();
		request.setAttribute("list", list);
		return "minseong/stockBoard.jsp";
	}

}
