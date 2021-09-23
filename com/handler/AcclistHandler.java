package com.handler;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ItemsDao;
import com.dto.Items_ReviewDto;

public class AcclistHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ItemsDao itemsDao = new ItemsDao();
		Vector<Items_ReviewDto> itemVe = itemsDao.SelectItemsList();
		request.setAttribute("Items_ReviewDto", itemVe);
		
		return "/acclist.jsp";
	}

}
