package com.bc.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.dongwu.command.JapaneseCommand;
import com.bc.jieun.command.EnglishBoardCommand;
import com.bc.main.command.MainWriteCommand;
import com.bc.main.command.StudyMainCommand;
import com.bc.minseong.command.BullteinBoardDeleteCommand;
import com.bc.minseong.command.BullteinBoardListCommand;
import com.bc.minseong.command.BullteinBoardOneCommand;
import com.bc.minseong.command.BullteinBoardUpdateCommand;
import com.bc.minseong.command.BullteinBoardWriteCommand;
import com.bc.minseong.command.FreeBoardListCommand;
import com.bc.minseong.command.StockBoardCommand;
import com.bc.share.command.Command;
import com.bc.study.command.CategoryCommand;
import com.bc.wonho.command.AttendanceBoardCommand;




@WebServlet("/StudyController")
public class StudyMainController extends HttpServlet {
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
		String b_idx = request.getParameter("b_idx");
		System.out.println("b_idx : "+b_idx);
		String path = null;
		System.out.println("type : "+type);
		Command comm = null;
		 
		if(type.equals("main")) {
			comm = new StudyMainCommand();
		}else if(type.equals("board")) {
			//�썝�븯�뒗 �쐞移섎줈 �꽆湲� command �깮�꽦
		}else if(type.equals("jap")) {
			comm = new JapaneseCommand();
		}else if(type.equals("atte")) {
			comm = new AttendanceBoardCommand();
		}else if(type.equals("eng")) {
			System.out.println(">> eng 체크");
			comm = new EnglishBoardCommand();
		}else if(type.equals("stoc")) {
			comm = new StockBoardCommand();
		}else if(type.equals("write")) {
			comm = new MainWriteCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
