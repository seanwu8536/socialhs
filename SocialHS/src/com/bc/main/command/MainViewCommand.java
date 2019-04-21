package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.dao.BasketballDAO;
import com.bc.hobby.dao.HobbyBoardDAO;
import com.bc.hobby.vo.BasketballBoardVO;
import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.vo.ApplyVO;
import com.bc.main.vo.CommentVO;
import com.bc.main.vo.PopUpVO;
import com.bc.share.command.Command;


public class MainViewCommand implements Command {

   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) {
      // TODO Auto-generated method stub
      HttpSession session = request.getSession();
      System.out.println("check MainViewCommand");
      String bb_idx = request.getParameter("bb_idx");
      
      System.out.println("bb_idx : "+bb_idx);
      HobbyBoardVO viewVO = HobbyBoardDAO.getViewVo(bb_idx);
      System.out.println("viewVO"+viewVO);
      //이것도 main으로 공용으로 사용함 getOne은 어차피 bb_idx로 구분하기 때문
      session.setAttribute("viewVO", viewVO);
      
      
      
      //===============댓글 가져오기 ===================================
      List<CommentVO> commentList = HobbyBoardDAO.getCommentVo(bb_idx);
      System.out.println("commentList : "+commentList);
      request.setAttribute("commentList", commentList);
      
      List<ApplyVO> applyList = HobbyBoardDAO.getApplyVo(bb_idx);
      System.out.println("applyList : "+applyList);
      session.setAttribute("applyList", applyList);
      
      //====================popUp() 인원보기에 쓸 데이터 가져오기=======================
      List<PopUpVO> popupList = HobbyBoardDAO.getPopupList(bb_idx);
      System.out.println("popupList : "+popupList);
      request.setAttribute("popupList", popupList);
      
      //==========================조회수 늘리기==============================
      HobbyBoardDAO.updateHit(bb_idx);
      
      
      return "view.jsp";
   }

}