package com.bc.hobby.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.PhotoBoardVO;
import com.bc.mybatis.DBService;

public class PhotoDAO {
	private static SqlSession ss;
	
	// �̱��� ����: �ϳ��� ��ü���� ����� ���
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	//��ü ������ ��ȸ
	public static List<PhotoBoardVO> getPhotoList() {
		List<PhotoBoardVO> list = getSql().selectList("photo.list");
		return list;
	}
	
	//�Խñ� �󼼺���
	public static PhotoBoardVO photoSelectOne(String phot_idx)  {
		return getSql().selectOne("one", phot_idx);
	}
}
