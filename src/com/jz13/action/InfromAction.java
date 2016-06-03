package com.jz13.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.jz13.entity.Infrom;

import com.jz13.entity.PageBean;
import com.jz13.entity.User;

import com.jz13.service.InfromService;

import com.jz13.util.PageUtil;
import com.jz13.util.ResponseUtil;
import com.jz13.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;


public class InfromAction  extends ActionSupport implements ServletRequestAware {
	
	
	private static final long serialVersionUID = 1L;

	@Resource
	private  InfromService  infromService;
		
	private HttpServletRequest request;
	
	private List<Infrom>  infromList= new ArrayList<Infrom>();

	private String page;

	private String pageCode;
	
	private Infrom infrom;
	
	private User user;

	private String mainPage;

	private PageBean pageBean;
	
	private int infromId;
	private int infromIds;
	
	public int getInfromIds() {
		return infromIds;
	}

	public void setInfromIds(int infromIds) {
		this.infromIds = infromIds;
	}

	public int getInfromId() {
		return infromId;
	}

	public void setInfromId(int infromId) {
		this.infromId = infromId;
	}

	public InfromService getInfromService() {
		return infromService;
	}

	

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public List<Infrom> getInfromList() {
		return infromList;
	}

	public void setInfromList(List<Infrom> infromList) {
		this.infromList = infromList;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public Infrom getInfrom() {
		return infrom;
	}

	public void setInfrom(Infrom infrom) {
		this.infrom = infrom;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}


	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public String list(){		
		/*HttpSession session=request.getSession();	*/
		infromList=infromService.findList();
		return SUCCESS;
	}
	public String listAdmin(){		
		/*HttpSession session=request.getSession();*/	
		if (StringUtil.isEmpty(page)) {
			page="1";
			
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),6);
		infromList=infromService.findList(pageBean);
		long toatl=infromService.getInfromCount();
		String targetUrl=request.getContextPath()+"/admin/Infrom_listAdmin.action";
		pageCode=PageUtil.genPagination(targetUrl, toatl, Integer.parseInt(page), 6, null);
		mainPage="infrom.jsp";
		return "successadmin";
	}
	
	public String save() {
		infrom.setTime(new Date());
		infromService.save(infrom);
		return "successadmin";
		
	}
	public String delete() throws Exception {
	JSONObject result=new JSONObject();
	Infrom e=infromService.findInfromById(infromId);
	infromService.delete(e);
	result.put("success", true);
	ResponseUtil.write(ServletActionContext.getResponse(), result);
	return "successadmin";
	}
	public String deleteInfroms(){
		
		return "successadmin";
	}
	
	public String findById(int infromId){
		infrom=infromService.findInfromById(infromId);
		return "findbyid";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		
	}


	
}