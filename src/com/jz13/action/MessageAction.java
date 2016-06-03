package com.jz13.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.interceptor.ServletRequestAware;



import com.jz13.entity.Message;
import com.jz13.entity.PageBean;
import com.jz13.entity.User;

import com.jz13.service.MessageService;
import com.jz13.util.PageUtil;
import com.jz13.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;


public class MessageAction  extends ActionSupport implements ServletRequestAware {
	
	
	private static final long serialVersionUID = 1L;

	@Resource
	private  MessageService  messageService;
		
	private HttpServletRequest request;
	
	private List<Message> messageList= new ArrayList<Message>();

	private String page;

	private String pageCode;
	
	private Message message;
	
	private User user;
	
	private int messageId;

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



	public MessageService getMessageService() {
		return messageService;
	}



	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}



	public int getMessageId() {
		return messageId;
	}



	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}



	public String getPage() {
		return page;
	}



	public void setPage(String page) {
		this.page = page;
	}



	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		// TODO Auto-generated method stub
		
	}



	public List<Message> getMessageList() {
		return messageList;
	}



	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

	public String getPageCode() {
		return pageCode;
	}



	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}



	public Message getMessage() {
		return message;
	}



	public void setMessage(Message message) {
		this.message = message;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}
	
	public String list(){
		
		/*HttpSession session=request.getSession();*/
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),6);
		messageList=messageService.findMessageList(pageBean);
		long total=messageService.getMessageCount();
		pageCode=PageUtil.genPagination(request.getContextPath()+"/Message_list.action", total, Integer.parseInt(page), 6,null);
		return SUCCESS;
	}
	public String listAdmin(){
		
		/*HttpSession session=request.getSession();*/
		if (StringUtil.isEmpty(page)) {
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),6);
		messageList=messageService.findMessageList(pageBean);
		long total=messageService.getMessageCount();
		pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/Message_listAdmin.action", total, Integer.parseInt(page), 6,null);
		mainPage="message.jsp";
		crumb1="消息列表";
		return "successadmin";
	}
	
	public String save() {
		message.setM_time(new Date());
		messageService.save(message);
		return "save";
		
	}
	
	public String delete(){
		Message m=messageService.findMessagById(messageId);
		messageService.delete(m);
		
		return "successadmin";
		
	}
	public String deleteMessages(){
		Message m=messageService.findMessagById(messageId);
		messageService.delete(m);
		
		return "successadmin";
		
	}




}