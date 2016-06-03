package com.jz13.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.jz13.entity.Course;
import com.jz13.entity.PageBean;
import com.jz13.entity.User;
import com.jz13.service.CourseService;
import com.jz13.util.PageUtil;
import com.jz13.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;


public class CourseAction  extends ActionSupport implements ServletRequestAware {
	
	
	private static final long serialVersionUID = 1L;

	@Resource
	private  CourseService courseService;
		
	private HttpServletRequest request;
	
	private List<Course> courseList= new ArrayList<Course>();

	private int term;
	
	private User user;
	
	private User currentUser;
	
	private String mainPage;
	
	private String crumb1;
	
	private String page;
	private String pageCode;

	private Course course;

	private int courseId;


	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getPageCode() {
		return pageCode;
	}

	public void setPageCode(String pageCode) {
		this.pageCode = pageCode;
	}

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

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public CourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		
		this.request=request;
		// TODO Auto-generated method stub
		
	}
	
	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public User getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String list(){
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		session.setAttribute("currentUser", user);	
		courseList=courseService.findCourseList(term);	
		return "success" ;
		
	}
	public String listAdmin(){
		 if (StringUtil.isEmpty(page)) {
			 page="1";	
		}
		 PageBean pageBean=new PageBean(Integer.parseInt(page), 6);
		 courseList=courseService.findCourseList(pageBean);
		 long total=courseService.getCourseCount();
		 pageCode=PageUtil.genPagination(request.getContextPath()+"/admin/Course_listAdmin.action", total, Integer.parseInt(page), 6, null);
		 mainPage="course.jsp";
		 crumb1="课程管理";
		 return "successadmin" ;
		
	}
	public String save() {
		
		courseService.save(course);
		return "successadmin" ;
		
	}
	
	public String delete() {
		Course c=courseService.findCouresById(courseId);
		courseService.delete(c);
		return "successadmin" ;
		
		
	}
}
