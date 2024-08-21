package com.smhrd.controllerClass;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.frontcontroller.Command;

public class DeleteCon implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[DeleteCon]");
        
        // mem_id 파라미터 가져오기
        String mem_id = request.getParameter("mem_id");
        System.out.println("mem_id: " + mem_id);
        
        if (mem_id == null || mem_id.isEmpty()) {
            System.out.println("mem_id가 전달되지 않았습니다.");
            return "redirect:/error.jsp";
        }

        // MemberDAO를 사용하여 회원정보 삭제
        int row = new MemberDAO().delete(mem_id);

        if (row > 0) {
            System.out.println("회원정보삭제 성공");
        } else {
            System.out.println("회원정보삭제 실패");
        }

        // 삭제 후 메인 페이지로 이동
        return "logoutCon.do";
    }
}
