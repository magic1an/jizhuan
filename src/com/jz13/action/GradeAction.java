package com.jz13.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.jz13.entity.Course;
import com.jz13.entity.Grade;
import com.jz13.entity.PageBean;
import com.jz13.entity.User;
import com.jz13.service.CourseService;
import com.jz13.service.GradeService;
import com.jz13.service.UserService;
import com.jz13.util.PageUtil;
import com.jz13.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;



@Controller
public class GradeAction  extends ActionSupport implements ServletRequestAware{
	
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	private GradeService gradeService;
	@Resource
	private UserService userService;
	
	@Resource
	private CourseService courseService;
	
	private HttpServletRequest request;
	
	private Grade grade;

	private String page;
	
	private String mainPage;

	private String pageCode;

	private String crumb1;
	
	private String courseTerm;
	
	private String userName;
	
	private String gradeGrade;
	
	private String courseName;
	
	private int term;

	
	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public String getCourseTerm() {
		return courseTerm;
	}

	public void setCourseTerm(String courseTerm) {
		this.courseTerm = courseTerm;
	}

	public String getGradeGrade() {
		return gradeGrade;
	}

	public void setGradeGrade(String gradeGrade) {
		this.gradeGrade = gradeGrade;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}



	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	

	private List<Grade> gradeList=new ArrayList<Grade>();
	private List<Course> courseList=new ArrayList<Course>();
	private List<User> userList=new ArrayList<User>();

	private String error;


	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public String getCrumb1() {
		return crumb1;
	}

	public void setCrumb1(String crumb1) {
		this.crumb1 = crumb1;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

	public GradeService getGradeService() {
		return gradeService;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}



	public CourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}



	public List<Grade> getGradeList() {
		return gradeList;
	}

	public void setGradeList(List<Grade> gradeList) {
		this.gradeList = gradeList;
	}

	public String getMainPage() {
		return mainPage;
	}

	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {	
		this.request=request;		
	}
	
	
	public String savelist(){
		for(Grade grade : gradeList)
			gradeService.save(grade);
		return "savelist";
		
	}
	public String save() {
		gradeService.save(grade);
		return "save";
	}
	
	public String list(){
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		if (user!=null) {
			if(StringUtil.isEmpty(page)){			
				page="1";
			}
			Grade s_grade=new  Grade();	
			s_grade.setUser(user);
			Course course=new Course();
			course.setTerm(term);
			s_grade.setCourse(course);
			int pageSize=12;
			int currentPage=Integer.parseInt(page);
			PageBean pageBean=new PageBean(currentPage, pageSize);
			gradeList=gradeService.findGradeList(s_grade, pageBean);
			String targetUrl=request.getContextPath()+"/Grade_list.action";
			long totalNum=gradeService.getGradeCount(s_grade);
			pageCode=PageUtil.genPagination(targetUrl, totalNum, currentPage, pageSize, null);
			return SUCCESS;
		}
		else {
			error = "您还没有登录，请登录！";
			return "error";
			
		}
	}
	public String listAdmin(){
		
		if(StringUtil.isEmpty(page)){			
			page="1";
		}
		
		int pageSize=12;
		int currentPage=Integer.parseInt(page);
		courseList=courseService.findCourseList(null);
		userList=userService.findUserList(null, null);
		PageBean pageBean=new PageBean(currentPage, pageSize);
		gradeList=gradeService.findGradeList(grade, pageBean);
		String targetUrl=request.getContextPath()+"/admin/Grade_listAdmin.action";
		long totalNum=gradeService.getGradeCount(grade);
		pageCode=PageUtil.genPagination(targetUrl, totalNum, currentPage, pageSize, null);
		mainPage="grade.jsp";
		crumb1="成绩管理";
		return "successadmin";	
	}
	public String add() {		
		return "add" ;
		
	}
	public String update(){
		for(Grade grade : gradeList)
		gradeService.update(grade);	
		return "save";				
	}

}
