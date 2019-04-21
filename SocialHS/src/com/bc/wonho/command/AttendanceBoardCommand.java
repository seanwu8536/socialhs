package com.bc.wonho.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;
import com.bc.study.dao.AttendanceDAO;
import com.bc.study.vo.AttendanceBoardVO;

public class AttendanceBoardCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		List<AttendanceBoardVO> list = AttendanceDAO.getAttendList();
		request.setAttribute("list", list);
		return "wonho/attendanceBoard.jsp";
	}
}
