package com.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MemberDao;
import com.dto.MemberDto;

public class SignUpProcHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession reflash = (HttpSession) request.getSession(); 
		if(reflash.getAttribute("signup_chk") == null || reflash.getAttribute("signup_chk").equals(false)){			
			MemberDao dao = new MemberDao();

			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String postcode = request.getParameter("postcode");
			String roadAddress = request.getParameter("roadAddress");
			String detailAddress = request.getParameter("detailAddress");
			String address = postcode + "//" + roadAddress + "//" + detailAddress;
			String tel = request.getParameter("tel");

			MemberDto dto = new MemberDto(id, pw, name, email, address, tel);
			int insertResult = dao.insertMemberData(dto);

			if (insertResult > 0) {
				reflash.setAttribute("signup_chk", true);
				return "/signUp_success.jsp";
			} else {
				return "/signUp.jsp?err=0";
			}
		} else {
			return "/signUp_success.jsp";
		}
	}
}
