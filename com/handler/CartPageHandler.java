package com.handler;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ItemsDao;
import com.dto.CartInfoDto;
import com.dto.ItemsDto;
import com.dto.MemberDto;

public class CartPageHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDto memberInfo = (MemberDto) request.getSession().getAttribute("memberInfo");		
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		if(memberInfo != null) {
			for (Cookie c : cookies) { // for문으로 배열 안에 있는 쿠키들 검색
				if (c.getName().equals(memberInfo.getMember_idx()+"")) { // member_idx의 이름을 갖는 쿠키의 정보를 담음
					cookie = c;
				}
			}
		}
				
		if(cookie != null) {
			Vector<CartInfoDto> infoVec = new Vector<>();
			String temp[] = cookie.getValue().split("//");
			String itemIdx="", itemCnt="";
			
			for(int i=0; i<temp.length; i++) {
				itemIdx = temp[i].split("#")[0];
				itemCnt = temp[i].split("#")[1];
				ItemsDto dto = new ItemsDao().getItemsSelect(itemIdx);
				CartInfoDto cartDto = new CartInfoDto();
				cartDto.setItems_idx(dto.getItems_idx());
				cartDto.setItems_name(dto.getItems_name());
				cartDto.setPrice(dto.getPrice());
				cartDto.setStock(dto.getStock());
				cartDto.setItems_img(dto.getItems_img());
				cartDto.setItems_category(dto.getItems_category());
				cartDto.setQuantity(Integer.parseInt(itemCnt));
				infoVec.add(cartDto);
			}	
			request.setAttribute("itemInfo", infoVec);
		}
		
		return "/cart.jsp";
	}
}
