package com.bc.hobby.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.PhotoBoardVO;
import com.bc.mybatis.DBService;

public class PhotoDAO {
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	//전체 데이터 조회
	public static List<PhotoBoardVO> getPhotoList() {
		List<PhotoBoardVO> list = getSql().selectList("photo.list");
		return list;
	}
	
	//게시글 상세보기
	public static PhotoBoardVO photoSelectOne(String phot_idx)  {
		return getSql().selectOne("one", phot_idx);
	}
}
