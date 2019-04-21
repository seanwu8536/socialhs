package com.bc.hobby.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.mybatis.DBService;

public class BaseballDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	
	public static List<BaseballBoardVO> getBaseList() {
		return getSql().selectList("baseball.list");
	}
	
	public static List<BaseballBoardVO> getList(Map<String, Integer> map) {
		return getSql().selectList("baseball.listTest", map);
	}
	
	public static int getCountAll() {
		return getSql().selectOne("baseball.countAll");
	}
	
	
	
	
}
