package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.mybatis.SqlSessionManager;

public class BoardDAO {
	static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 게시글 작성
	public int writeBoard(BoardVO vo) {
		int cnt = 0;
		SqlSession session =sqlSessionFactory.openSession(true);
		
		cnt=session.insert("writeBoard",vo);
		session.close();
		return cnt;
	}

	// 게시글 목록 조회
	public List<BoardVO> allBoard(){
		List<BoardVO> estimate_requests = null;
		SqlSession session =sqlSessionFactory.openSession(true);
		estimate_requests = session.selectList("allBoard");
		session.close();
		
		return estimate_requests;
	}
	
	//게시글 상세 조회
	public BoardVO detailBoard(int est_idx) {
		BoardVO estimate_requests=null;
		SqlSession session =sqlSessionFactory.openSession(true);
		estimate_requests = session.selectOne("detailBoard", est_idx);
		session.close();
		
		return estimate_requests ;
	}
	
	// 게시글 삭제
    public int deleteBoard(int est_idx) {
        int cnt = 0;
        SqlSession session = sqlSessionFactory.openSession(true);
        
        cnt = session.delete("deleteBoard", est_idx);
        session.close();
        return cnt;
    }

	public ArrayList<BoardVO> select_paging(int pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<BoardVO> hotpost() {
		// TODO Auto-generated method stub
		return null;
	}



}
