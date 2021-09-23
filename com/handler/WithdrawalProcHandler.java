package com.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.MemberDao;

public class WithdrawalProcHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int withdrawalResult = dao.withdrawalMember(idx);
		
		String uri = null;
		if(withdrawalResult > 0) {
			uri = "/withdrawal_view.jsp";
			request.getSession().invalidate();
		} else {
			uri = "MyPage.do?pg=withdrawal&err=0";
		}
		return uri;
	}
}
