package com.handler;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ItemsDao;
import com.dto.ItemsDto;

public class PaymentPageHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int items_cnt = Integer.parseInt(request.getParameter("items_cnt"));
		Vector<ItemsDto> itemsV = new Vector<>();
		 for (int i = 1; i <= items_cnt; i++) {
			 String items_idx = request.getParameter("items_idx" + i);
			 int quantity = Integer.parseInt(request.getParameter("quantity" + i));
			ItemsDao itemsDao = new ItemsDao();
			ItemsDto itemsDto = itemsDao.getItemsSelect(items_idx);
			itemsDto.setQuantity(quantity);
			itemsV.add(itemsDto);
		 }
		request.setAttribute("itemsInfo", itemsV);
		
		return "/payment.jsp";
	}

}
