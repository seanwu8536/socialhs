package com.bc.hobby.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.hobby.vo.BasketballBoardVO;
import com.bc.mybatis.*;

public class BasketballDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	
	public static List<BasketballBoardVO> getBasketList() {
		return getSql().selectList("basketballbbs.list");	
	}
	
	
	
	
	
}
