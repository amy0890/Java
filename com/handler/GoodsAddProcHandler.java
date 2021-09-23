package com.handler;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ItemsDao;
import com.dto.ItemsDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GoodsAddProcHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = "AdminPage.do";
		
		HttpSession reflash = (HttpSession) request.getSession(); 
		if(reflash.getAttribute("goodsadd_chk") == null || reflash.getAttribute("goodsadd_chk").equals(false)){		
			ItemsDao itemsDao = new ItemsDao();
			ItemsDto itemsDto = new ItemsDto();
			
			String dir = request.getServletContext().getRealPath("/img/items");
//			String dir = "E:/JAVA/Workspace/ServletProj_Team1/WebContent/img/items";
			File f = new File(dir);
			if(!f.exists()) {
				f.mkdir();
			}
			
			String path = dir;
			int maxSize = 10 * 1024 * 1024;
			String enc = "utf-8";
			DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
			
			MultipartRequest mrequest = new MultipartRequest(request, path, maxSize, enc, dfrp);
			
			itemsDto.setItems_name(mrequest.getParameter("items_name"));
			itemsDto.setPrice(Integer.parseInt(mrequest.getParameter("price")));
			itemsDto.setStock(Integer.parseInt(mrequest.getParameter("stock")));
			itemsDto.setItems_info1(mrequest.getParameter("items_info1"));
			itemsDto.setItems_info2(mrequest.getParameter("items_info2"));
			itemsDto.setItems_info3(mrequest.getParameter("items_info3"));
			itemsDto.setItems_info4(mrequest.getParameter("items_info4"));
			itemsDto.setItems_category(mrequest.getParameter("items_category"));
			
			int file_num = Integer.parseInt(mrequest.getParameter("file_num"));
			String items_img = "";
			
			for (int i = 0; i <= file_num; i++) {
				if(mrequest.getFilesystemName("items_img"+i) != null) {
					items_img += mrequest.getFilesystemName("items_img"+i);
					if(i < file_num) {
						items_img += "//";
					}
				}
			}
			itemsDto.setItems_img(items_img);
			
			int result = itemsDao.itemsInsert(itemsDto);
			
			if(result > 0) {
				uri = "AdminPage.do?pg=goods";				
			}else {	
				uri = "AdminPage.do?pg=goods&err=0";				
			}	
		}
		
		return uri;
	}

}
