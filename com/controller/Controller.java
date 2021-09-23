package com.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ajax.AjaxProc;
import com.handler.CommonHandler;
import com.handler.HomeHandler;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private Map<String, CommonHandler> CommonHandlerMap = new HashMap<String, CommonHandler>();
	
	@Override
	public void init() throws ServletException {
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile);
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(configFilePath);
			prop.load(fis);
		} catch (IOException e) {
			throw new ServletException(e);
		}
		Iterator keyIter = prop.keySet().iterator();
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String handlerClassName = prop.getProperty(command);
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommonHandler handlerInstance = (CommonHandler)handlerClass.newInstance();
				CommonHandlerMap.put(command, handlerInstance);		
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String cmd = request.getRequestURI();
		cmd = cmd.substring(cmd.lastIndexOf("/"));
		
		CommonHandler handler = null;
		if(cmd == null || cmd.equals("/*.do")) {
			handler = new HomeHandler();
		}else if(cmd.equals("/AjaxProc.do")) {
			new AjaxProc(request, response);
		}else {
			handler = CommonHandlerMap.get(cmd);
		}
		
		if(!cmd.equals("/AjaxProc.do")) {
			String viewPage = handler.process(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);			
		}

	}
}
