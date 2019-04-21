package com.bc.main.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.dao.HobbyBoardDAO;
import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;

public class StudyMainCommand implements Command {

   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) {
      // TODO Auto-generated method stub
      HttpSession session = request.getSession();
      
      String bbs_idx = request.getParameter("bbs_idx2");
      
      List<LocationVO> location = (List<LocationVO>)session.getAttribute("location");
      String hs = (String)session.getAttribute("hs");
      hs = hs.substring(0, 1);
      
      String l_idx = location.get(0).getL_Idx();
      List<SubLocationVO> list = SubLocationDAO.getSubLocation(l_idx);
      
      Map<String, String> map = new HashMap<String, String>();
      
      map.put("l_idx", l_idx);
      map.put("hs", hs); 
      
      if (bbs_idx == null) {               // 일반적인 경우
         System.out.println("bbs_idx가 널임");
         List<HobbyBoardVO> StudyList = HobbyBoardDAO.getMainCategoryList(map);
         System.out.println("StudyList: "+StudyList); //HobbyBoardVO 와 HobbyBoardDAO는 그냥 mainBoardVO로 쓰겠습니다
         request.setAttribute("MainList", StudyList); //main에 쓸 list 저장 제일 중요!!
         //여기서 제대로 출력됨!! HobbyBoardVO를 MainBoardVO로 사용!!!
      }else {                           // 카테고리에서 넘어왔을 경우
         map.put("bbs_idx", bbs_idx);
         System.out.println("bbs_idx가 널이 아님");
         List<HobbyBoardVO> StudyList = HobbyBoardDAO.getCategoryFromCategory(map);
         request.setAttribute("MainList", StudyList); 
      }
      
      
      session.setAttribute("SubLocation", list);
      return "StudyMain.jsp";
   }


}