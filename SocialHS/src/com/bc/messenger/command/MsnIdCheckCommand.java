package com.bc.messenger.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MessengerDAO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberDAO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class MsnIdCheckCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		memberVO vo = memberDAO.selectId(id);
		
		String result = "";
		if (vo == null) {
			result = "0";	// 조회 아이디 없음
		} else {
			result = "1";	// 조회 아이디 있음
		}
		
		return result;	// 1이면 조회 있음 0이면 없음
	}

}
