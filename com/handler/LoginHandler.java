package com.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		return "/login.jsp";
	}

}
