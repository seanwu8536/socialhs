package com.bc.mypage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.memberDAO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class updateMyinfoCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String path = null;
		HttpSession session = request.getSession();
		
		String chk = request.getParameter("infochk");
		String id = request.getParameter("id");
		
		if (chk == null) {
			path = "mingyeong/myPage.jsp";
		} else {
			
			String pw = request.getParameter("pw");
			String email = request.getParameter("email");
			String com = request.getParameter("com");
			String phone = request.getParameter("phone");
			String address = request.getParameter("addr");
			
			memberVO vo = new memberVO();
			vo.setId(id);
			vo.setPw(pw);
			vo.setEmail(email+"@"+com);
			vo.setPhone(phone);
			vo.setAddr(address);
			
			memberDAO.update(vo);
			System.out.println("정보가 수정되었습니다.");
			path = "mingyeong/myPage.jsp";
			
		}
		
		return path;
		
	}
	

}
