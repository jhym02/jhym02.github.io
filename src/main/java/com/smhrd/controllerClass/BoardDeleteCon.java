package com.smhrd.controllerClass;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.frontcontroller.Command;
import com.smhrd.model.BoardDAO;

public class BoardDeleteCon implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("[BoardDeleteCon]");

        String id = request.getParameter("id");
        if (id != null) {
            int est_idx = Integer.parseInt(id);
            BoardDAO dao = new BoardDAO();
            int result = dao.deleteBoard(est_idx);

            if (result > 0) {
                System.out.println("게시글 삭제 성공");
            } else {
                System.out.println("게시글 삭제 실패");
            }
        }

        return "BoardMain.jsp"; // 삭제 후 게시글 목록 페이지로 이동
    }
}
