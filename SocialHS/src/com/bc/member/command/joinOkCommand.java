package com.bc.member.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.memberDAO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class joinOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String path = null;
		HttpSession session = request.getSession();
		
		String chk = request.getParameter("joinchk");
		if (chk == null) {
			path = "mingyeong/join.jsp";
		} else {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			
			String email = request.getParameter("email");
			String com = request.getParameter("com");
			
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			
			String birthday = request.getParameter("birthday");
			String birthmm = request.getParameter("birthmm");
			String birthdd = request.getParameter("birthdd");
			
			int age = Integer.parseInt(birthday + birthmm + birthdd);
			String birth = birthday + "-" + birthmm + "-" + birthdd;
			
			Date birthDate = Date.valueOf(birth);
			
			System.out.println("age : " + age);
			System.out.println("email : " + email+"@"+com);
			System.out.println("birthDate : " + birthDate);

			memberVO vo = new memberVO();
			vo.setId(id);
			vo.setPw(pw);
			vo.setName(name);
			vo.setAge(age);
			vo.setEmail(email+"@"+com);
			vo.setPhone(phone);
			vo.setAddr(addr);
			vo.setBirth(birthDate);
			
			memberDAO.join(vo);
			request.setAttribute("joinInfo", vo);
			session.removeAttribute("id");
			path = "mingyeong/joinOk.jsp";
			
		}
		
		return path;
		
	}
	

}
