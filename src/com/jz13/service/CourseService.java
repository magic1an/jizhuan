package com.jz13.service;

import java.util.List;

import com.jz13.entity.Course;
import com.jz13.entity.PageBean;

public interface CourseService {
		
	public List<Course> findCourseList(int term);
	
	public List<Course> findCourseList(PageBean pageBean);
	
	public long getCourseCount();
	
	public Course findCouresById(int courseId);
	
	public void save(Course course);
	
	public void delete(Course course);


}
