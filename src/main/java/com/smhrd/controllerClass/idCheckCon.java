package com.smhrd.controllerClass;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.MemberDAO;

public class idCheckCon implements Command {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("[idCheckCon]");

        // id 받아오기
        String mem_id = request.getParameter("id");
        System.out.println("id: " + mem_id);

        // IDCheck할 메소드 실행
        boolean idCheck = new MemberDAO().idCheck(mem_id);

        // true : 중복 O, false : 중복 X
        String result;
        if (idCheck) {
            result = "아이디가 중복됩니다.";
        } else {
            result = "사용 가능한 아이디입니다.";
        }

        // 결과를 response에 출력
        response.setContentType("text/plain; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(result);
        out.flush();
        out.close();

        return null; // 페이지 이동이 아닌 결과만 반환하므로 null 반환
    }
}
