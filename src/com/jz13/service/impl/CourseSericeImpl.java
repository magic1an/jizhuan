package com.jz13.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;
import com.jz13.entity.Course;
import com.jz13.entity.PageBean;
import com.jz13.service.CourseService;

@Service("CourseService")
public class CourseSericeImpl implements CourseService{

	
	@Resource
	private UserDAO<Course> CourseDAO;
	
	@Override
	public List<Course> findCourseList(int term) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Course c where c.term=?");
		param.add(term);
		return  CourseDAO.find(hql.toString(), param);
	}

	@Override
	public List<Course> findCourseList(PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		String hql="from Course course order by course.id desc";
		if (pageBean!=null) {
			return CourseDAO.find(hql, param, pageBean);
			
		}
		else {
			return CourseDAO.find(hql, param);
			
		}
	}

	@Override
	public long getCourseCount() {
		String hql="select count(*) from Course";
		return CourseDAO.count(hql);
	}

	@Override
	public Course findCouresById(int courseId) {
		return CourseDAO.get(Course.class, courseId);
	}

	@Override
	public void save(Course course) {
		 CourseDAO.merge(course);
		
	}

	@Override
	public void delete(Course course) {
		CourseDAO.delete(course);
		
	}

}
