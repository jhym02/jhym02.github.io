package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class OrgsDAO {
	static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	
	
	public static ArrayList<OrgsDTO> selectOrgs(){
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<OrgsDTO> orgsList= (ArrayList)session.selectList("selectOrgs");
		
		System.out.println("orgs의 사이즈 : "+orgsList.size());
		session.close();
		
		return orgsList;
	}
}
