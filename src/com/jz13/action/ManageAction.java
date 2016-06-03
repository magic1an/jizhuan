package com.jz13.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.interceptor.ServletRequestAware;

import com.jz13.entity.Manage;
import com.jz13.entity.PageBean;
import com.jz13.entity.Position;
import com.jz13.entity.User;
import com.jz13.service.ManageSerice;
import com.jz13.util.PageUtil;
import com.jz13.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class ManageAction extends ActionSupport implements ServletRequestAware {
	
	
	private static final long serialVersionUID = 1L;
	
	private HttpServletRequest request;
	
	@Resource
	private ManageSerice manageSerice;
	
/*	@Resource
	private PositionSerice positionSerice;*/

	
	
	private Manage  manage;
	
	private User user;
	private int manageId;
	private Position position;
/*	private int id;*/
	
	private List<Manage> manageList=new ArrayList<Manage>();

	private String page;

	private String pageCode;

	private String mainPage;

	private String crumb1;
	
	//private List<Position> positionList=new ArrayList<Position>();
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		// TODO Auto-generated method stub
		
	}
	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public Manage getManage() {
		return manage;
	}

	public void setManage(Manage manage) {
		this.manage = manage;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public List<Manage> getManageList() {
		return manageList;
	}

	public void setManageList(List<Manage> manageList) {
		this.manageList = manageList;
	}

	/*public List<Position> getPositionList() {
		return positionList;
	}

	public void setPositionList(List<Position> positionList) {
		this.positionList = positionList;
	}*/
	
	public int getManageId() {
		return manageId;
	}

	public void setManageId(int manageId) {
		this.manageId = manageId;
	}
	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public String getCrumb1() {
		return crumb1;
	}

	public void setCrumb1(String crumb1) {
		this.crumb1 = crumb1;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}
	
	public String list(){
		/*HttpSession session=request.getSession();*/
		manageList=manageSerice.findManageList();
/*		positionList=positionSerice.findPositionList();*/
		return SUCCESS;
	}
	public String listAdmin(){
		/*HttpSession session=request.getSession();*/
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),6);
		manageList=manageSerice.findManageList(pageBean);
		long total=manageSerice.getManageCount();
		pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/Manage_listAdmin.action", total, Integer.parseInt(page), 6,null);
		mainPage="manage.jsp";
		crumb1="班干管理";
		return "successadmin";
		
	}
	
	public void save() {
		manageSerice.save(manage);
		
	}
	
	public void delete() {
		manageSerice.delete(manage);
		
	}


}
