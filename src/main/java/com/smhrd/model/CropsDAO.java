package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class CropsDAO {
	
static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	
	public static ArrayList<CropsDTO> selectCrops(){
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<CropsDTO> cropsList= (ArrayList)session.selectList("selectCrops");
		
		System.out.println("crops의 사이즈 : "+cropsList.size());
		session.close();
		
		return cropsList;
	}
}
