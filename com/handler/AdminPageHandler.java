package com.handler;

import java.io.File;
import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ItemsDao;
import com.dao.MemberDao;
import com.dao.OrderlistDao;
import com.dto.ItemsDto;
import com.dto.MemberDto;
import com.dto.OrderlistDto;
import com.dto.Orderlist_joinDto;

public class AdminPageHandler implements CommonHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pg = request.getParameter("pg");
		String uri = "/adminpage.jsp";
		if(pg == null || pg.equals("order")) {
			OrderlistDao orderDao = new OrderlistDao();
			Vector<Orderlist_joinDto> orderV = orderDao.selectOrderList();
			request.setAttribute("orderlist", orderV);
		}else if(pg.equals("orderinfo")) {
			int order_num = Integer.parseInt(request.getParameter("order_num"));
			OrderlistDao orderDao = new OrderlistDao();
			Vector<Orderlist_joinDto> orderV = orderDao.selectOrderInfo(order_num);
			request.setAttribute("orderinfo", orderV);
	    }else if(pg.equals("update_state_proc")){
	    	
			int type = Integer.parseInt(request.getParameter("type"));
			int order_num =  Integer.parseInt(request.getParameter("order_num"));
			
			OrderlistDao orderDao = new OrderlistDao();
			int result = orderDao.stateUpdate(order_num, type);
			
			if(result > 0) {
				uri = "AdminPage.do?pg=orderinfo";				
			}else {
				uri = "AdminPage.do?pg=orderinfo&err=0";
			}
			
			
		}else if(pg.equals("goods")) {
			ItemsDao itemsDao = new ItemsDao();
			Vector<ItemsDto> itemsV = itemsDao.getItemsSelectAll();
			request.setAttribute("itemlist", itemsV);
		}else if(pg.equals("goodsinfo")) {
			getGoodsInfo(request, response);
		}else if(pg.equals("goodsadd")) {
			request.getSession().setAttribute("goodsadd_chk", false);
		}else if(pg.equals("goodsupdate")) {
			request.getSession().setAttribute("goodsupdate_chk", false);
			getGoodsInfo(request, response);
		}else if(pg.equals("goodsdelete_proc")) {
			String idx = request.getParameter("idx");
			ItemsDao itemsDao = new ItemsDao();
			ItemsDto itemsDto = itemsDao.getItemsSelect(idx);
			
			ItemsDao itemsDelDao = new ItemsDao();
			int result = itemsDelDao.itemsDelete(idx);
			if(result > 0) {
				String dir = request.getServletContext().getRealPath("/img/items");
//				String dir = "E:/JAVA/Workspace/ServletProj_Team1/WebContent/img/items";
				String[] file_name = itemsDto.getItems_img().split("//");
				for (int i = 0; i < file_name.length; i++) {
					File file = new File(dir + "/" + file_name[i]); 
					if( file.exists() ) {
						if(file.delete()) {
							System.out.println("파일삭제 성공"); 
						} else { 
							System.out.println("파일삭제 실패"); 
						}
					}else{
						System.out.println("파일이 존재하지 않습니다."); 
					}									
				}
				uri = "AdminPage.do?pg=goods";
			}else {
				uri = "AdminPage.do?pg=goods&err=0";				
			}
		}else if(pg.equals("member")) {
			MemberDao memberDao = new MemberDao();
			Vector<MemberDto> memberV = memberDao.getMemberList();
			request.setAttribute("memberlist", memberV);
		}else if(pg.equals("memberinfo")) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = memberDao.selectMemberData(idx);
			request.setAttribute("memberdata", memberDto);
		}else if(pg.equals("memberblock_proc")) {
			String idx = request.getParameter("idx");
			MemberDao memberDao = new MemberDao();
			int result = memberDao.memberBlock(idx);
			
			if(result > 0) {
				uri = "AdminPage.do?pg=member";				
			}else {
				uri = "AdminPage.do?pg=member&err=0";
			}
	
		}
		return uri;
	}
	
	private void getGoodsInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		ItemsDao itemsDao = new ItemsDao();
		ItemsDto itemsDto = itemsDao.getItemsSelect(idx);
		request.setAttribute("iteminfo", itemsDto);
	}
}
