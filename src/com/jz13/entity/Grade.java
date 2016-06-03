package com.jz13.entity;


import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="t_grade")

public class Grade {
	
	private int id;		
	private int grade;	//成绩
	private User user;	//用户
	private Course course;	//科目
	private double grade_p;//绩点
	private java.lang.String remark;
	private java.lang.Long grade_ps;
	private java.lang.Long grade_bk;
	private java.lang.Long grade_cx;
	
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
	public java.lang.String getRemark() {
		return remark;
	}
	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}
	
	@Column(length=20)
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	@ManyToOne
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToOne
	@JoinColumn(name="course_id")
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
	@Column(length=20)
	public double getGrade_p() {
		return grade_p;
	}
	public void setGrade_p(double grade_p) {
		this.grade_p = grade_p;
	}
	
	@Column(length=20)
	public java.lang.Long getGrade_ps() {
		return grade_ps;
	}
	public void setGrade_ps(java.lang.Long grade_ps) {
		this.grade_ps = grade_ps;
	}
	
	@Column(length=20)
	public java.lang.Long getGrade_bk() {
		return grade_bk;
	}
	public void setGrade_bk(java.lang.Long grade_bk) {
		this.grade_bk = grade_bk;
	}
	
	@Column(length=20)
	public java.lang.Long getGrade_cx() {
		return grade_cx;
	}
	public void setGrade_cx(java.lang.Long grade_cx) {
		this.grade_cx = grade_cx;
	}
	

	
}
