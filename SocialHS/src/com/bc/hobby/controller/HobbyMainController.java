package com.bc.hobby.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.command.ApplyCommand;
import com.bc.main.command.HobbyMainCommand;
import com.bc.main.command.MainCancelOkCommand;
import com.bc.main.command.MainDeleteOkCommand;
import com.bc.main.command.MainUpdateCommand;
import com.bc.main.command.MainUpdateOkCommand;
import com.bc.main.command.MainViewCommand;
import com.bc.main.command.MainWriteCommand;
import com.bc.main.command.MainWriteOkCommand;
import com.bc.mingyeong.command.PhotoBoardCommand;
import com.bc.share.command.Command;
import com.bc.swan.command.BaseballBoardCommand;




@WebServlet("/HobbyController")
public class HobbyMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		String path = null;
		Command comm;
		System.out.println("type : "+type);
		comm = null;
		
		if(type.equals("main")) {
			comm = new HobbyMainCommand();
		}else if(type.equals("board")) {
			
		}else if(type.equals("base")) {
			comm = new BaseballBoardCommand();
		}else if(type.equals("photo")) {
			comm = new PhotoBoardCommand();
		}else if(type.equals("view")) {
			comm = new MainViewCommand();
			//여기도 Hobby랑 Study랑 공용으로 사용
			//main이라고 쓰여있는건 Hobby랑 Study랑 공용으로 사용한다고 보면됨
		}else if(type.equals("write")) {
			comm = new MainWriteCommand();
		}else if(type.equals("writeOk")) {
			System.out.println("찍힘");
			comm = new MainWriteOkCommand();
		}else if(type.equals("update")) {
			comm = new MainUpdateCommand();
		}else if(type.equals("updateOk")) {
			System.out.println("updateOK check");
			comm = new MainUpdateOkCommand();
		}else if(type.equals("deleteOk")) {
			comm = new MainDeleteOkCommand();
		}else if(type.equals("apply")) {
			comm = new ApplyCommand();
		}else if(type.equals("cancel")) {
			comm = new MainCancelOkCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
