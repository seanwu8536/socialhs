package com.bc.jieun.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.BoardSearchDAO;
import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class SearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String hs = (String) session.getAttribute("hs");
		String sl_idx = request.getParameter("sl_idx");
		System.out.println("hs : " + hs);
		System.out.println("command sl_idx : " + sl_idx);

		int v = Integer.parseInt(request.getParameter("select"));
		System.out.println("v : " + v);

		String keyword = request.getParameter("keyword");
		System.out.println("keyword : " + keyword);

		String path = "";

		if (keyword == null || keyword.equals("")) {
			path = "MainController?type=" + hs;
		} else {

			switch (v) {
			case 0: // 제목 title
				if (sl_idx == null) {
					System.out.println("hs: " + hs);
					System.out.println("keyword: " + keyword);
					List<BoardVO> t_list = BoardSearchDAO.getTitle(hs, keyword);
					session.setAttribute("s_list", t_list);
					System.out.println(">>리스트 받아옴");
					// List<BoardVO> s_list = (List<BoardVO>) session.getAttribute("s_list");
					// System.out.println(s_list);
				} else {
					List<BoardVO> t_list2 = BoardSearchDAO.getTitle2(hs, keyword, sl_idx);
					session.setAttribute("s_list", t_list2);
					// List<BoardVO> s2_list = (List<BoardVO>) session.getAttribute("s_list");
				}
				break;
			case 1: // 작성자 id
				if (sl_idx == null) {
					List<BoardVO> i_list = BoardSearchDAO.getId(hs, keyword);
					session.setAttribute("s_list", i_list);
				} else {
					List<BoardVO> i2_list = BoardSearchDAO.getId2(hs, keyword, sl_idx);
					session.setAttribute("s_list", i2_list);
				}
				break;
			case 2: // 내용 content
				if (sl_idx == null) {
					List<BoardVO> c_list = BoardSearchDAO.getContent(hs, keyword);
					session.setAttribute("s_list", c_list);
				} else {
					List<BoardVO> c2_list = BoardSearchDAO.getContent2(hs, keyword, sl_idx);
					session.setAttribute("s_list", c2_list);
				}
				break;
			case 3:
				if (sl_idx == null) {
					List<BoardVO> ic_list = BoardSearchDAO.getIdContent(hs, keyword);
					session.setAttribute("s_list", ic_list);
				} else {
					List<BoardVO> ic2_list = BoardSearchDAO.getIdContent2(hs, keyword, sl_idx);
					session.setAttribute("s_list", ic2_list);
				}

				break;
			}

			path = "jieun/search.jsp";
		}

		return path;

	}

}
