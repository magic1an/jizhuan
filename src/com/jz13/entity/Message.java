package com.jz13.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="t_message")
public class Message {
	
	private Integer id;
	private User user;
	private String content;
	private Date m_time;
	
	private List<ReplyMessage> replyMessageList=new ArrayList<ReplyMessage>();
	
	@Id
	@GeneratedValue(generator="_native")
	@GenericGenerator(name="_native",strategy="native")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne
	@JoinColumn(name="userId")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getM_time() {
		return m_time;
	}
	public void setM_time(Date m_time) {
		this.m_time = m_time;
	}
	
	@OneToMany(mappedBy="message")
	public List<ReplyMessage> getReplyMessageList() {
		return replyMessageList;
	}
	public void setReplyMessageList(List<ReplyMessage> replyMessageList) {
		this.replyMessageList = replyMessageList;
	}
	
	

}
