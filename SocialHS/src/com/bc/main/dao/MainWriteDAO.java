package com.bc.main.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.main.vo.MessengerVO;
import com.bc.mybatis.DBService;

public class MainWriteDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	public static List<BbsCodeVO> getBbsCodeList(String bbs_type){
		return getSql().selectList("mainwrite.list",bbs_type);
	}
	
	public static int insertB_Board(HobbyBoardVO vo){
		System.out.println("check1 여기 insert 전");
		return getSql().insert("mainwrite.insert",vo);
	}
	
	public static int updatePoint(String id) {
		return getSql().update("mainwrite.updatePoint", id);
	}
	

	
}
