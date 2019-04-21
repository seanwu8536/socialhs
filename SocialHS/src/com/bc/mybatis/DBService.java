package com.bc.mybatis;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//MyBatis 사용해서 작업할 SqlSession 객체를 만들어 줄
//SqlSessionFactory 객체 생성을 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	//static 초기화 구문
	static {
		try {
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/bc/mybatis/config.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//factory 요청하면 제공하는 메소드
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
}








