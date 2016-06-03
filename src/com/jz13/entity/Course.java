package com.jz13.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="t_course")
@org.hibernate.annotations.Proxy(lazy = false)
public class Course {
	
	private int id;			//课程id
	private String 	name; 	//课程名称
	private String 	type;	//课程类型
	private String	credit; //学分
	private int 	term;	//学期
	
	private List<Grade> gradeList=new ArrayList<Grade>();
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(length=20)
	public String getType() {
		return type;
	}
	
	
	
	@Column(length=20)
	public void setType(String type) {
		this.type = type;
	}
	public String getCredit() {
		return credit;
	}
	
	@Column(length=20)
	public void setCredit(String credit) {
		this.credit = credit;
	}
	
	@Column(length=20)
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	@OneToMany(mappedBy="course")
	public List<Grade> Grade() {
		return gradeList;
	}
	public void seGradeList(List<Grade> gradeList) {
		this.gradeList = gradeList; 
	}
}
