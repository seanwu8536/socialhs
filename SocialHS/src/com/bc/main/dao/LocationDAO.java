package com.bc.main.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.mybatis.*;

public class LocationDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	
	public static List<LocationVO> getLocation(String location) {
		return getSql().selectList("Location.list",location);
	}
	
	public static List<LocationVO> getAll(){
		return getSql().selectList("Location.all");
	}
	
	
	
	
	
}
