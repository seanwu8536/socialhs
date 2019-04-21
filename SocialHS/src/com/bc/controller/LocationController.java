package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.command.HobbyMainCommand;
import com.bc.main.command.StudyMainCommand;
import com.bc.main.dao.LocationDAO;
import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;
import com.bc.study.command.CategoryCommand;





@WebServlet("/LocationController")
public class LocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		String hs = (String)session.getAttribute("hs");
		String location = (String)request.getParameter("location");
		
		if(location == null) {
			location = "1";
		}
		
		session.setAttribute("l_idx", Integer.parseInt(location));
		
		List<LocationVO> list = LocationDAO.getLocation(location);
		session.setAttribute("location", list);
		
		List<LocationVO> listAll = LocationDAO.getAll();
		System.out.println("listAll : "+listAll);
		session.setAttribute("locationAll", listAll);
		List<SubLocationVO> listSubAll2 = (List<SubLocationVO>)SubLocationDAO.getSubAll();
		session.setAttribute("listSubAll2", listSubAll2);
		
		List<SubLocationVO> listSubAll = SubLocationDAO.getSubAll();
		session.setAttribute("listSubAll", listSubAll);
		
		String path = null;
		System.out.println("hs : "+hs);
		
		Command comm = null;
		
		if(hs.equals("hobby")) {
			comm = new HobbyMainCommand();
		}
		else if(hs.equals("study")) {
			comm = new StudyMainCommand();
		} 
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
