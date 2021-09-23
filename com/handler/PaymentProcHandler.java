package com.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ItemsDao;
import com.dao.OrderlistDao;
import com.dao.OrderlistItemDao;
import com.dto.ItemsDto;
import com.dto.MemberDto;
import com.dto.OrderlistDto;
import com.dto.OrderlistItemDto;

public class PaymentProcHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			MemberDto memberInfo = (MemberDto) session.getAttribute("memberInfo");
			String uri = "Home.do";
			
			int member_idx = memberInfo.getMember_idx();
		
			
			String order_name = request.getParameter("order_name");
			String order_phone = request.getParameter("order_phone");
			String order_email = request.getParameter("order_email");
			
			String postcode = request.getParameter("addr1");
			String roadAddress = request.getParameter("addr2");
			String detailAddress = request.getParameter("addr3");
			String order_address = postcode + "//" + roadAddress + "//" + detailAddress;

			String order_memo = request.getParameter("order_memo");
			String order_state = "결제완료";
			
			int total_price = Integer.parseInt(request.getParameter("total_price"));
			int use_point = Integer.parseInt(request.getParameter("use_point"));
			int payment = Integer.parseInt(request.getParameter("payment"));
			

			OrderlistDao aiDao = new OrderlistDao();
			int ai = aiDao.getAI();
			
			OrderlistDto orderlistDto = new OrderlistDto(
						member_idx,
						order_name,
						order_phone,
						order_email,
						order_address,
						order_memo,
						total_price,
						use_point,
						payment,
						order_state);
			orderlistDto.setOrder_num(ai);
			OrderlistDao dao = new OrderlistDao();
			int result = dao.insertOrderList(orderlistDto);
			if(result > 0) {
				int items_cnt = Integer.parseInt(request.getParameter("items_cnt"));
				for (int i = 1; i <= items_cnt; i++) {
					OrderlistItemDto oliDto = new OrderlistItemDto();
					oliDto.setOrder_num(ai);
					oliDto.setItems_idx(Integer.parseInt(request.getParameter("items_idx" + i)));
					oliDto.setQuantity(Integer.parseInt(request.getParameter("quantity" + i)));
					OrderlistItemDao oliDao = new OrderlistItemDao();
					int oliResult = oliDao.insertOL_item(oliDto);
					
					
					
					if(oliResult > 0) {
						ItemsDao itemDao = new ItemsDao();
						int itemResult = itemDao.sales_cntUpdate(oliDto.getItems_idx(), oliDto.getQuantity());
						if(itemResult > 0) {
							uri = "paymentcompletepage.jsp";							
						}else {
							uri = "Home.do?err=2";							
						}
					}else {
						uri = "Home.do?err=1";
					}
				}				
			}else {
				uri = "Home.do?err=0";				
			}
			
			
			return uri;
	}	
}
	


	

