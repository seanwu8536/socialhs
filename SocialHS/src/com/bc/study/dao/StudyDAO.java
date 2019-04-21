package com.bc.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.bc.study.vo.JapaneseBoardVO;
import com.bc.study.vo.StudyVO;

public class StudyDAO {
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	
	public static List<StudyVO> getStudyList() {
		List<StudyVO> list = getSql().selectList("study.list");
		System.out.println(list);
		return list;
	}
	
	
}
