package com.bc.messenger.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MessengerDAO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class MsnDetailCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String ms_idx = request.getParameter("ms_idx");
		String chk = request.getParameter("chk");
		System.out.println("ms_idx: "+ ms_idx);
		System.out.println("chk: "+ chk);
		
		if (chk.equals("1")) {
			MessengerDAO.updateChk(ms_idx);
		}
		
		MessengerVO vo = MessengerDAO.getOne(ms_idx);
		request.setAttribute("msnVO", vo);
		
		return "swan/msnDetail.jsp";
	}

}
