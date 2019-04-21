package com.bc.admin.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.admin.A_AllBoardVO;
import com.bc.admin.AdminDAO;
import com.bc.member.Paging;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class searchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Paging p = new Paging();
		
		String search = request.getParameter("search");
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			cPage ="1";
		}
		
		System.out.println("검색 내용 : " + search);
		
		int num = Integer.parseInt(request.getParameter("select"));
		System.out.println("select : " + num);
		String path = "";
		
		if (search == null || search.equals("")) {
			path = "AdminController?type=allList";
		} else {
			switch (num) {
			case 1: //제목/내용
				List<A_AllBoardVO> searchCnt = AdminDAO.searchlist(search);
				int result = searchCnt.size();
				System.out.println("!!확인!! : " + result);
				
				p.setTotalRecord(result);
				p.setTotalPage(); //전체 페이지 수 구하기
				
				System.out.println("전체 게시글 수 : " + p.getTotalRecord());
				System.out.println("전체 페이지 수 : " + p.getTotalPage());
				System.out.println("cPage : " + cPage);
				
				//3.현재 페이지의 시작번호와 끝 번호 
				p.setBegin((p.getNowPage() - 1) * p.getNumPerpage() +1);
				p.setEnd(p.getBegin() + p.getNumPerpage() -1);
				
				//4. 블록의 시작 페이지, 끝페이지 번호
				p.setBeginPage((p.getNowPage()-1) / p.getPagePerBlock() * p.getPagePerBlock() +1);
				p.setEndPage(p.getBeginPage() + p.getPagePerBlock()-1);
				
				System.out.println("=============================");
				System.out.println("시작 페이지번호 : " + p.getBeginPage());
				System.out.println("끝 페이지번호 : " + p.getEndPage());
				System.out.println("시작 : " + p.getBegin() + ", 끝 : " + p.getEnd());
				System.out.println("=============================");
				
				if (p.getEndPage() > p.getTotalPage()) {
					p.setEndPage(p.getTotalPage());
				}
				
				String beginNum = String.valueOf(p.getBegin());
				String endNum = String.valueOf(p.getEnd());
				
				Map<String, String> map = new HashMap<>();
				map.put("title", search);
				map.put("content", search);
				map.put("begin", beginNum);
				map.put("end", endNum);
				
				List<A_AllBoardVO> searchlist = AdminDAO.getSearchWrite(map);
				System.out.println("searchCnt : " + searchCnt);
				
				session.setAttribute("searchlist", searchlist);
				request.setAttribute("cnt", searchCnt);
				request.setAttribute("pvo", p);
				request.setAttribute("cPage", cPage);
				request.setAttribute("search", search);
				
				path = "Admin/searchWrite.jsp";
				break;
				
			case 2: //아이디
				List<memberVO> idcnt = AdminDAO.searchId(search);
				int cnt = idcnt.size();
				System.out.println("!!확인(id)!! : " + cnt);
				
				p.setTotalRecord(cnt);
				p.setTotalPage(); //전체 페이지 수 구하기
				
				System.out.println("전체 게시글 수 : " + p.getTotalRecord());
				System.out.println("전체 페이지 수 : " + p.getTotalPage());
				System.out.println("cPage : " + cPage);
				
				//3.현재 페이지의 시작번호와 끝 번호 
				p.setBegin((p.getNowPage() - 1) * p.getNumPerpage() +1);
				p.setEnd(p.getBegin() + p.getNumPerpage() -1);
				
				//4. 블록의 시작 페이지, 끝페이지 번호
				p.setBeginPage((p.getNowPage()-1) / p.getPagePerBlock() * p.getPagePerBlock() +1);
				p.setEndPage(p.getBeginPage() + p.getPagePerBlock()-1);
				
				System.out.println("=============================");
				System.out.println("시작 페이지번호 : " + p.getBeginPage());
				System.out.println("끝 페이지번호 : " + p.getEndPage());
				System.out.println("시작 : " + p.getBegin() + ", 끝 : " + p.getEnd());
				System.out.println("=============================");
				
				if (p.getEndPage() > p.getTotalPage()) {
					p.setEndPage(p.getTotalPage());
				}
				
				String beginNumid = String.valueOf(p.getBegin());
				String endNumid = String.valueOf(p.getEnd());
				
				Map<String, String> mapid = new HashMap<>();
				mapid.put("id", search);
				mapid.put("begin", beginNumid);
				mapid.put("end", endNumid);
				
				List<memberVO> searchId = AdminDAO.getsearchId(mapid);
				System.out.println("검색 아이디 search : " + searchId);
				session.setAttribute("searchlist", searchId);
				request.setAttribute("idcnt", idcnt);
				request.setAttribute("pvo", p);
				request.setAttribute("cPage", cPage);
				request.setAttribute("search", search);
				path="Admin/searchMember.jsp";
				break;
			}
			
		}
		
		return path;
		
	}
	

}
