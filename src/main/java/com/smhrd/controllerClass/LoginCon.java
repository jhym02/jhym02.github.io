package com.smhrd.controllerClass;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class LoginCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//2.데이터 가져오기
				String id=request.getParameter("id");
				String pw=request.getParameter("pw");
				//콘솔창 찍어서 데이터 잘 가져오는지 미리 확인.
				System.out.println("id : "+id );
				System.out.println("pw : "+pw);
				
				
				//3.memberDTO로 묶기 (한 회원의 정보기 떄문에 한번에 묶을 수 있는 객체)
				// memberDTO에서 lombok이용해서 email,pw만 가지고 오는 생성자 만들기(오버로딩)
				// @RequiredArgsConstructor ,원하는 값에 @NonNull 이용해서 생성자 만들기.
				MemberDTO dto=new MemberDTO(id,pw);
				
				//4.로그인 기능이 있는 login메소드 호출
				//로그인 메소드->MemberDAO에서 생성
				// 결과값 받아옴 = user_info로
				MemberDTO user_info= new MemberDAO().login(dto);
				System.out.println(user_info);
				//5 페이지 이동
				String moveURL;
				

				if(user_info != null) {
					System.out.println("로그인 성공!");
					
				// 로그인 성공시 사용자의 정보 유지 -> session을 이용해서	
					moveURL="Real_Main.jsp";
					HttpSession session = request.getSession();
					session.setAttribute("user_info", user_info);
					//유저인포라는 이름으로 유저인포 저장시키겠다.
					
				}else {
					System.out.println("로그인 실패");
					
		
					return "Real_Login.jsp";
				}
				return moveURL;
	}
}

