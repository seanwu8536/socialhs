package com.bc.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.bc.study.vo.AttendanceBoardVO;

public class AttendanceDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	public static List<AttendanceBoardVO> getAttendList() {
		List<AttendanceBoardVO> list = getSql().selectList("attendance.list");
		return list;
	}
}
