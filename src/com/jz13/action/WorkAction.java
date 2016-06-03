package com.jz13.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.jz13.entity.PageBean;
import com.jz13.entity.Work;
import com.jz13.service.WorkService;
import com.jz13.util.PageUtil;
import com.jz13.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

public class WorkAction extends ActionSupport implements ServletRequestAware{ 
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private WorkService workService;
		
	private HttpServletRequest request;
		
	private Work work;
			
	private String page;
		
	private String pageCode;
	
	private List<Work> workList=new ArrayList<Work>();

	private int workId;

	private PageBean pageBean;

	private String mainPage;

	private String crumb1;
	
	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}

	public String getCrumb1() {
		return crumb1;
	}

	public void setCrumb1(String crumb1) {
		this.crumb1 = crumb1;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public int getWorkId() {
		return workId;
	}

	public void setWorkId(int workId) {
		this.workId = workId;
	}

	public WorkService getWorkService() {
		return workService;
	}

	public void setWorkService(WorkService workService) {
		this.workService = workService;
	}
	
	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
	
	public void setWork(Work work) {
		this.work = work;
	}
	public Work getWork() {
		return work;
	}
	
	public List<Work> getWorkList() {
		return workList;
	}

	public void setWorkList(List<Work> workList) {
		this.workList = workList;
	}


	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		// TODO Auto-generated method stub
		
	}

	public String save() {
		work.setTime(new Date());
		workService.save(work);
		return "save";
	
	}

	public String add(){			
			return "add";
		}
	public String list(){		
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		session.getAttribute("");
		PageBean pageBean = new PageBean(Integer.parseInt(page), 6);
		workList=workService.findWorkList(pageBean);
		long total=workService.getWorkCount();
		pageCode=PageUtil.genPagination(request.getContextPath()+"/Work_list.action", total, Integer.parseInt(page), 6, null);		
		mainPage="work.jsp";
		crumb1="作品管理";
		return SUCCESS;		
	}
	public String listAdmin(){		
		HttpSession session=request.getSession();
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		session.getAttribute("");
		PageBean pageBean = new PageBean(Integer.parseInt(page), 6);
		workList=workService.findWorkList(pageBean);
		long total=workService.getWorkCount();
		pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/Work_listAdmin.action", total, Integer.parseInt(page), 6, null);		
		mainPage="work.jsp";
		crumb1="作品管理";
		
		return "successadmin";
		
	}
	public String findById(){		
		work=workService.findById(workId);
		return "show";
	}
	
	public String delete() {
		Work w=workService.findById(workId);
		workService.delete(w);
		return "successadmin";
		
	}

	

}
