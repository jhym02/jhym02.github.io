package com.smhrd.controllerClass;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class JoinCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("[JoinCon]");
		
		
		//2. 회원가입 데이터 꺼내오기
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		String name= request.getParameter("name");
		String phone= request.getParameter("phone");
		String address= request.getParameter("address");
		String nick= request.getParameter("nick");
		String birth= request.getParameter("birth");
		String type= request.getParameter("type");
		String gender= request.getParameter("gender");
		
		
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);
		System.out.println("name : "+name);
		System.out.println("phone : "+phone);
		System.out.println("address : "+address);
		System.out.println("nick : "+nick);
		System.out.println("birth : "+birth);
		System.out.println("type : "+type);
		System.out.println("gender : "+gender);
		
		//3. DTO로 묶기 -> DB에 한 사람에대한 것을 저장해야하기때문에 한 객체로 묶어서 저장한다.
		MemberDTO dto= new MemberDTO(id, pw, name, phone,address,nick,birth,gender,type);
		
		//4. DB에 회원정보를 입력할 메소드 호출
		int row = new MemberDAO().join(dto);
		
		//5. 실행한 결과에 따라 페이지 이동
		String moveURL;
		if(row>0) {
			System.out.println("회원가입 성공");
			moveURL = "Real_Main.jsp";
			
			request.setAttribute("id", id);
		}else {
			System.out.println("회원가입 실패");
			moveURL="Real_Join.jsp";
		}
		
		
		return moveURL;
	}

}
