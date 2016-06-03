package com.jz13.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="t_user")
@org.hibernate.annotations.Proxy(lazy = false)
public class User {
	private int id;        		//用户id
	private String number;		//学号
	private String name;		//用户真实姓名
	private String password;	//登录密码
	private String age;
	private String sex;			//用户性别	0男		1女
	private String face;		//头像路径
	private Date regTime;		//注册时间
	private String email;		//用户邮箱
	private String qq;			//qq
	private String mobile;		//联系电话
	private String address;
	private int type;			//用户类型	1为其他用户；2管理员
	
	private List<Section> sectionList=new ArrayList<Section>();
	private List<Topic> topicList=new ArrayList<Topic>();
	private List<Reply> replyList=new ArrayList<Reply>();
	private List<Grade> gradeList=new ArrayList<Grade>();
	private List<Manage> manageList=new ArrayList<Manage>();
	private List<Message> messageList=new ArrayList<Message>();
	private List<ReplyMessage> replyMessageList=new ArrayList<ReplyMessage>();
	private List<Work> workList=new ArrayList<Work>();

	
	@Id
	@GeneratedValue(generator="_native")
	@GenericGenerator(name="_native",strategy="native")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(length=20)
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	
	@Column(length=20)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(length=20)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(length=20)
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	@Column(length=20)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(length=20)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(length=20)
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	@Column(length=20)
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	


	@Column(length=10)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getFace() {
		return face;
	}
	public void setFace(String face) {
		this.face = face;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	/*@OneToMany(mappedBy="master")*/
	/*@OneToMany(targetEntity=Section.class,cascade=CascadeType.ALL)*/
	@OneToMany(fetch=FetchType.EAGER)
	@JoinColumn(name="masterId", updatable=false)
	public List<Section> getSectionList() {
		return sectionList;
	}
	public void setSectionList(List<Section> sectionList) {
		this.sectionList = sectionList;
	}
	
	@OneToMany(mappedBy="user")
	@Cascade(value={CascadeType.DELETE})
	public List<Topic> getTopicList() {
		return topicList;
	}
	public void setTopicList(List<Topic> topicList) {
		this.topicList = topicList;
	}
	
	@OneToMany(mappedBy="user")
	public List<Reply> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}
	
	
	@OneToMany(mappedBy="user")
	public List<Grade> Grade() {
		return gradeList;
	}
	public void seGradeList(List<Grade> gradeList) {
		this.gradeList = gradeList; 
	}
	
	@OneToMany(mappedBy="user")
	public List<Manage> getManageList() {
		return manageList;
	}
	public void setManageList(List<Manage> manageList) {
		this.manageList = manageList;
	}
	
	@OneToMany(mappedBy="user")
	public List<Message> getMssageList() {
		return messageList;
	}
	public void setMssageList(List<Message> messageList) {
		this.messageList = messageList;
	}
	
	@OneToMany(mappedBy="user")
	public List<ReplyMessage> getReplyMessageList() {
		return replyMessageList;
	}
	public void setReplyMessageList(List<ReplyMessage> replyMessageList) {
		this.replyMessageList = replyMessageList;
	}
	
	@OneToMany(mappedBy="user")
	public List<Work> getWorkList() {
		return workList;
	}
	public void setWorkList(List<Work> workList) {
		this.workList = workList;
	}
	
	
	
}
