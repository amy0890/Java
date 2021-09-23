package com.handler;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ItemsDao;
import com.dao.ReviewDao;
import com.dto.ItemsDto;
import com.dto.MemberDto;
import com.dto.ReviewDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewWriteProcHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = "MyPage.do";
		
		HttpSession reflash = (HttpSession) request.getSession(); 
		if(reflash.getAttribute("rvwrite_chk") == null || reflash.getAttribute("rvwrite_chk").equals(false)){
					
			MemberDto memberDto = (MemberDto)request.getSession().getAttribute("memberInfo");
			int member_idx = memberDto.getMember_idx();
			ReviewDao rvDao = new ReviewDao();
			ReviewDto rvDto = new ReviewDto();
			
			String dir = request.getServletContext().getRealPath("/img/review");
//			String dir = "E:/JAVA/Workspace/ServletProj_Team1/WebContent/img/review";
			File f = new File(dir);
			if(!f.exists()) {
				f.mkdir();
			}
			
			String path = dir;
			int maxSize = 10 * 1024 * 1024;
			String enc = "utf-8";
			DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
			
			MultipartRequest mrequest = new MultipartRequest(request, path, maxSize, enc, dfrp);
			
			rvDto.setItems_idx(Integer.parseInt(mrequest.getParameter("items_idx")));
			rvDto.setMember_idx(member_idx);
			rvDto.setReview_content(mrequest.getParameter("review_content"));
			rvDto.setReview_star(Integer.parseInt(mrequest.getParameter("review_star")));
			
			int file_num = Integer.parseInt(mrequest.getParameter("file_num"));
			String review_img = "";
			
			for (int i = 0; i <= file_num; i++) {
				if(mrequest.getFilesystemName("review_img"+i) != null) {
					review_img += mrequest.getFilesystemName("review_img"+i);
					if(i < file_num) {
						review_img += "//";
					}
				}
			}
			rvDto.setReview_img(review_img);
			
			int result = rvDao.insertReview(rvDto);
			
			if(result > 0) {
				uri = "MyPage.do?pg=orderlist";				
			}else {	
				uri = "MyPage.do?pg=orderlist&err=0";				
			}	
		}
		
		return uri;
	}

}
