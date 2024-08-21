package com.smhrd.controllerClass;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.frontcontroller.Command;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardVO;

public class BoardService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String savePath = request.getServletContext().getRealPath("./file");

		System.out.println("savePath : " + savePath);

		// 3. 파일 최대크기지원(int)
		int maxSize = 1024 * 1024 * 10;

		// 4. 인코딩 방식(String)
		String encoding = "UTF-8";

		// 5. 파일 이름 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		// 파일 업로드 객체- > multipart
		MultipartRequest multi;

		try {
			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
			// 요청 데이터 받아오기
			String est_title = multi.getParameter("est_title");
			String mem_id = multi.getParameter("mem_id");
			String est_file = multi.getFilesystemName("est_file");
			String est_content = multi.getParameter("est_content");
			String est_amount = multi.getParameter("est_amount");
			String est_auth = multi.getParameter("est_auth");
			String est_status = multi.getParameter("est_status");

			System.out.println("est_title"+est_title);
			System.out.println("mem_id"+mem_id);
			System.out.println("est_file"+est_file);
			System.out.println("est_content"+est_content);
			System.out.println("est_amount"+est_amount);
			System.out.println("est_auth"+est_auth);
			//System.out.println("created_at"+created_at);
			if (est_file == null) {
				est_file = "";
			}
			BoardVO vo = new BoardVO(maxSize, est_title, mem_id, est_file, est_content, est_amount, est_auth,
					est_status);
			System.out.println(vo.toString());

			// DB에 넣어주기
			int cnt = new BoardDAO().writeBoard(vo);

			if (cnt > 0) {
				System.out.println("게시글 작성 성공");
			} else {
				System.out.println("게시글 작성 실패");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "BoardMain.jsp";
	}

}
