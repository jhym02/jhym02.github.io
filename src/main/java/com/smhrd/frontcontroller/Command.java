package com.smhrd.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	//Command패턴: 기존의 Servlet으로 만들어져있던 Controller를
	//			  필요한 request,response 기능을 가지고 있는 class로 변환
	// 			: 모든 class가 request,response기능을 가지고 있는 메소드 구현
	
	public abstract String execute(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException;
}
