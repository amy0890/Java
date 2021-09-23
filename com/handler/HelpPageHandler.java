package com.handler;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AnnounceDao;
import com.dao.Qna_boardDao;
import com.dao.Qna_replDao;
import com.dto.AnnounceDto;
import com.dto.Announce_joinDto;
import com.dto.MemberDto;
import com.dto.Qna_boardDto;
import com.dto.Qna_board_joinDto;
import com.dto.Qna_replDto;

public class HelpPageHandler implements CommonHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pg = request.getParameter("pg");
		String uri = "/helppage.jsp";
		
		if(pg == null || pg.equals("notice")) {
			
			AnnounceDao dao = new AnnounceDao();
            Vector<Announce_joinDto> v = dao.selectNotice();
            request.setAttribute("announceDto", v);
            
		}else if(pg.equals("faq")) {
			
		}else if(pg.equals("qna")) {
			
	         Qna_boardDao qnaDao = new Qna_boardDao();
	         Vector<Qna_board_joinDto> qnaV = qnaDao.getQboard();
	         request.setAttribute("qnalist", qnaV);
	         
		}else if(pg.equals("notice_show")) {
			
			int anno_idx = Integer.parseInt(request.getParameter("anno_idx"));
			AnnounceDao dao = new AnnounceDao();
			Announce_joinDto announceDto  = dao.getNoticeContent(anno_idx);
			request.setAttribute("announceDto", announceDto);
			
		}else if(pg.equals("notice_write")) {	
			
		}else if(pg.equals("notice_write_proc")) {
			
			MemberDto sessionDto = (MemberDto)request.getSession().getAttribute("memberInfo"); 
			AnnounceDao dao = new AnnounceDao();
			
			int member_idx = sessionDto.getMember_idx();
			String anno_title = request.getParameter("anno_title");
			String anno_content = request.getParameter("anno_content");
			
			AnnounceDto announceDto = new AnnounceDto(member_idx,anno_title,anno_content);
			int insertResult = dao.insertNotice(announceDto);
			
			if (insertResult > 0) {
				uri = "HelpPage.do?pg=notice";
			} else {
				
			}		
		}else if(pg.equals("notice_update")) {
			
			int anno_idx = Integer.parseInt(request.getParameter("anno_idx"));
			AnnounceDao dao = new AnnounceDao();
			Announce_joinDto announceDto = dao.getNoticeContent(anno_idx);
			
			request.setAttribute("announceDto", announceDto);
			
		}else if(pg.equals("notice_update_proc")) {
			
	         AnnounceDao dao = new AnnounceDao();
	         
	         int anno_idx = Integer.parseInt(request.getParameter("anno_idx"));
	         String anno_title = request.getParameter("anno_title");
	         String anno_content = request.getParameter("anno_content");
	         String anno_date = request.getParameter("anno_date");
	         
	         AnnounceDto announceDto = new AnnounceDto(anno_idx, anno_title, anno_content, anno_date);
	         int updateResult = dao.updateNotice(announceDto, anno_idx);
	         
	         if (updateResult > 0) {
	        		uri = "HelpPage.do?pg=notice_show";
	         } else {
	            
	         }   

		}else if(pg.equals("notice_delete")){
			
			AnnounceDao dao = new AnnounceDao();
			
			int anno_idx = Integer.parseInt(request.getParameter("anno_idx"));
			
			int deleteResult = dao.deleteNotice(anno_idx);
			
			if (deleteResult > 0) {
				uri = "HelpPage.do?pg=notice";
			} else {
				
			}	
		}else if(pg.equals("qna_write")) {
			
		}else if(pg.equals("qna_write_proc")) {

			MemberDto sessionDto = (MemberDto) request.getSession().getAttribute("memberInfo");
			Qna_boardDao dao = new Qna_boardDao();

			int member_idx = sessionDto.getMember_idx();
			String qna_title = request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");
			String qna_date = request.getParameter("qna_date");
			String qna_category = request.getParameter("qna_category");

			Qna_boardDto qdto = new Qna_boardDto(member_idx, qna_title, qna_content, qna_date, qna_category);
			int insertResult = dao.insertQBoard(qdto);

			if (insertResult > 0) {
				uri = "HelpPage.do?pg=qna";
			} else {
				uri = "HelpPage.do?pg=qna&err=0";
			}
		         
		}else if(pg.equals("qna_show")) {
			
			int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
			Qna_boardDao qdao = new Qna_boardDao();
			Vector<Qna_board_joinDto> jDto = qdao.idxQboard(qna_idx);
			
			request.setAttribute("jDto", jDto);
			
	    }else if(pg.equals("qna_update")) {
	    	
			int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
			Qna_boardDao dao = new Qna_boardDao();
			Vector<Qna_board_joinDto> jDto  = dao.idxQboard(qna_idx);
			
			request.setAttribute("jDto", jDto);
	    }else if(pg.equals("qna_update_proc")) {
	    	 
	    	 Qna_boardDao dao = new Qna_boardDao();
	         
	         int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
	         String qna_category = request.getParameter("qna_category");
	         String qna_title = request.getParameter("qna_title");
	         String qna_content = request.getParameter("qna_content");
	         String qna_date = request.getParameter("qna_date");
	         
	         Qna_boardDto qDto = new Qna_boardDto(qna_idx, qna_title, qna_content, qna_date, qna_category);
	         
	         int updateResult = dao.updateQBoard(qDto, qna_idx);
	         
	         if (updateResult > 0) {
	            uri= "HelpPage.do?pg=qna_show";
	         } else {
	            
	         }   
	         
	    }else if(pg.equals("qna_delete")) {
	    	
	    	Qna_boardDao dao = new Qna_boardDao();
			
			int qna_idx = Integer.parseInt(request.getParameter("qna_idx"));
			
			int deleteResult = dao.deleteQBoard(qna_idx);
			
			if (deleteResult > 0) {
				uri= "HelpPage.do?pg=qna";
			} else {
				
			}	
		}else if(pg.equals("qna_repl_update")) {
			String qna_repl_idx = request.getParameter("qna_repl_idx");
			Qna_replDao qrDao = new Qna_replDao();
			Qna_replDto qrDto = qrDao.getSelect(qna_repl_idx);
			request.setAttribute("qrdata", qrDto);
			
		}else if(pg.equals("qna_repl_update_proc")) {
			String qna_repl_idx = request.getParameter("qna_repl_idx");
			String qna_idx = request.getParameter("qna_idx");
			String repl_content = request.getParameter("repl_content");
			Qna_replDao qrDao = new Qna_replDao();
			int result = qrDao.qnaReplUpdate(qna_repl_idx, repl_content);
			
			if(result > 0) {
				uri = "HelpPage.do?pg=qna_show&qna_idx=" + qna_idx;
			}else {
				uri = "HelpPage.do?pg=qna_show&qna_idx=" + qna_idx + "&err=0";
			}
		}else if(pg.equals("qna_repl_delete_proc")) {
			String qna_repl_idx = request.getParameter("qna_repl_idx");
			String qna_idx = request.getParameter("qna_idx");
			Qna_replDao qrDao = new Qna_replDao();
			int result = qrDao.qnaReplDelete(qna_repl_idx);
			
			if(result > 0) {
				uri = "HelpPage.do?pg=qna_show&qna_idx=" + qna_idx;
			}else {
				uri = "HelpPage.do?pg=qna_show&qna_idx=" + qna_idx + "&err=0";
			}
			
		}else if(pg.equals("qna_repl_write_proc")) {
			String qna_idx = request.getParameter("qna_idx");
			String member_idx = request.getParameter("member_idx");
			String repl_content = request.getParameter("repl_content");
			
			Qna_replDao qrDao = new Qna_replDao();
			int result = qrDao.qnaReplWrite(qna_idx, member_idx, repl_content);
			
			if(result > 0) {
				uri = "HelpPage.do?pg=qna_show&qna_idx=" + qna_idx;
			}else {
				uri = "HelpPage.do?pg=qna_show&qna_idx=" + qna_idx + "&err=0";
			}
		}
		
		return uri;
	}

}
