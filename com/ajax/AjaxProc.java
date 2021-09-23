package com.ajax;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.dao.MemberDao;
import com.dto.MemberDto;

public class AjaxProc{
	public AjaxProc(HttpServletRequest request, HttpServletResponse response) throws IOException {	
		String pg = request.getParameter("pg");
		MemberDao dao = new MemberDao();
		JSONObject rtn = null;
		
		if(pg.equals("signUp")) {
			String id = request.getParameter("id");
			rtn = dao.checkIdData(id);
		} else if(pg.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			rtn = dao.checkMemberData(id, pw);
		} else if(pg.equals("pw_check")) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			String pw = request.getParameter("pw");
			rtn = dao.checkPwData(idx, pw);
		} 
		else if(pg.equals("cookie_proc")) {
			String item_idx = request.getParameter("item_idx");
			CookieMgr(request, response, item_idx, false);
			rtn = new JSONObject();
		} else if(pg.equals("cart_cnt")) {
			String idx = request.getParameter("idx");
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			CartQuantityChange(request, response, idx, cnt);
			rtn = new JSONObject();
		} else if(pg.equals("delete_cart")) {
			String item_idx = request.getParameter("item_idx");
			CookieMgr(request, response, item_idx, true);
			rtn = new JSONObject();
		}
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(rtn.toString());	
	}


	public void CartQuantityChange(HttpServletRequest request, HttpServletResponse response, String item_idx, int cnt) {
		MemberDto memberDto = (MemberDto) request.getSession().getAttribute("memberInfo");
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null; 	
		for (Cookie c : cookies) { // for������ �迭 �ȿ� �ִ� ��Ű�� �˻�
			if (c.getName().equals(memberDto.getMember_idx()+"")) { // member_idx�� �̸��� ���� ��Ű�� ������ ����
				cookie = c;
			}
		}
	
		if(cookie != null) {
			if (cookie.getValue().contains(item_idx+"#")) {
				String temp[] = cookie.getValue().split("//");
				String sum = "";
				for (int i = 0; i < temp.length; i++) {
					String itemIdx = temp[i].split("#")[0];
					int itemCnt = Integer.parseInt(temp[i].split("#")[1]);
					if (itemIdx.equals(item_idx)) {
						itemCnt = cnt;
					}
					sum += itemIdx+"#"+itemCnt+"//";
				}
				sum = sum.substring(0, sum.lastIndexOf("//"));
				cookie = new Cookie(cookie.getName(), sum);
				response.addCookie(cookie);
			}
		}		
	}
	
	public void CookieMgr(HttpServletRequest request, HttpServletResponse response, String item_idx, boolean delete) {
		MemberDto memberDto = (MemberDto) request.getSession().getAttribute("memberInfo");
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null; 	
		
		for (Cookie c : cookies) { // for������ �迭 �ȿ� �ִ� ��Ű�� �˻�
			if (c.getName().equals(memberDto.getMember_idx()+"")) { // member_idx�� �̸��� ���� ��Ű�� ������ ����
				cookie = c;
			}
		}
		if(!delete) {
			if (cookie == null) {	// ��Ű�� ���ٸ� ��Ű ���� 
				insertCookie(cookie, memberDto.getMember_idx()+"", item_idx, response);
			} else {	
				updateCookie(cookie, item_idx, response);
			} 
		} else {
			if(cookie != null) {
				deleteCookie(cookie, response, item_idx);
			}
		}
	}
	
	private void insertCookie(Cookie cookie, String member_idx, String item_idx, HttpServletResponse response) {
		cookie = new Cookie(member_idx, item_idx+"#"+1);
		response.addCookie(cookie);
		cookie.setMaxAge(60 * 60 * 6); // 6�ð� ��ȿ�Ⱓ
	}
	
	private void updateCookie(Cookie cookie, String item_idx, HttpServletResponse response) {
		if (cookie.getValue().contains(item_idx+"#")) {
			String temp[] = cookie.getValue().split("//");
			String sum = "";
			for (int i = 0; i < temp.length; i++) {
				String itemIdx = temp[i].split("#")[0];
				int itemCnt = Integer.parseInt(temp[i].split("#")[1]);
				if (itemIdx.equals(item_idx)) {
					itemCnt++;
				}
				sum += itemIdx+"#"+itemCnt+"//";
			}
			sum = sum.substring(0, sum.lastIndexOf("//"));
			cookie = new Cookie(cookie.getName(), sum);
			response.addCookie(cookie);
		} else {
			cookie = new Cookie(cookie.getName(), cookie.getValue()+"//"+item_idx+"#"+1);
			response.addCookie(cookie);
		}
	}
	
	private void deleteCookie(Cookie cookie, HttpServletResponse response, String item_idx) {
		if (cookie.getValue().contains(item_idx+"#")) {
			String temp[] = cookie.getValue().split("//");
			String sum = "";
			for (int i = 0; i < temp.length; i++) {
				String itemIdx = temp[i].split("#")[0];
				int itemCnt = Integer.parseInt(temp[i].split("#")[1]);
				if (itemIdx.equals(item_idx)) {
					continue;
				}
				sum += itemIdx+"#"+itemCnt+"//";
			}
			if(sum.equals("")) {
				deleteAllCookie(cookie, response);
			} else {
				sum = sum.substring(0, sum.lastIndexOf("//"));
				cookie = new Cookie(cookie.getName(), sum);
				response.addCookie(cookie);
			}
		}
	}
	
	private void deleteAllCookie(Cookie cookie, HttpServletResponse response) {
		if(cookie != null) {
			Cookie killCookie = new Cookie(cookie.getName(), "");
			killCookie.setMaxAge(0); // ��Ű�� ������ �ð� ���Ŀ� ��������.
			response.addCookie(killCookie); // ���������� �߰��ض�
		}
	}
}
