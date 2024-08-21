package com.smhrd.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	
	// static 블록:해당 클래스를 생성했을 때 무조건 실행되는 영역
	// sqlSession == Connection 
	// DB연결을 '미리' 하는 것 -> Connection Pool:CP
	// why? 시스템의 성능을 향상시키기위해 CP를 사용,
	// 성능이 가장 떨어지는 부분이 DB연결하는 connection 객체를 생성하는 부분
	// 사용자 요청이 들어오면 CP에 만들어진 Connection객체를 빌려주고 반납하는 형식으로 진행
	// 
	
	// mybatis에서 성능이 떨어지는걸 방지하기위해서 Connection pool을 이용해
	// DB연결을 미리 해둬서 성능을 향상시키기위함.
	static SqlSessionFactory sqlSessionFactory;// 전역변수로선언
	
	static {
		try {
			String resource = "com/smhrd/mybatis/mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			 sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DAO에서 sqlSession을 사용할 수 있도록 return해주는 메소드 생성
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}
