package com.jz13.service.impl;


import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;

import com.jz13.entity.Grade;
import com.jz13.entity.PageBean;
import com.jz13.entity.User;
import com.jz13.service.GradeService;
import com.jz13.util.StringUtil;


@Service("GradeService")
public class GradeServiceImpl implements GradeService{
	
	
	@Resource
	private UserDAO<Grade> GradeDAO;

	
/*	@Override
	public Long getGradeCount(User s_user) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Grade");
		if (s_user!=null) {
			if (StringUtil.isNotEmpty(s_user.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_user.getName()+"%");
			}		
		}
		return UserDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public List<Grade> findGradeList(User s_user, PageBean pageBen) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Grade");
		if (s_user!=null) {
			if (StringUtil.isNotEmpty(s_user.getName())) {
				hql.append(" and user.id ?");
				param.add(s_user.getId());
			}
			
		}
		if (pageBen!=null) {
			return UserDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBen);
		}else{
			return UserDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
		
	}
	@Override
	public List<Grade> findGradeList(User s_user, int term) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Grade where user.id=? and course.term=?");
		param.add(s_user.getId());
		param.add(term);
		// TODO Auto-generated method stub
		return  UserDAO.find(hql.toString(), param);
	}
	@Override
	public List<Grade> findGradeList(User s_user) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Grade where user.id=?");
		param.add(s_user.getId());
	
		// TODO Auto-generated method stub
		return  UserDAO.find(hql.toString(), param);
	}


		
	}

	@Override
	public List<Grade> findGradeList() {
		String hql="from Grade";
		return UserDAO.find(hql);
	}
*/
	@Override
	public List<Grade> findGradeList(Grade grade, PageBean pageBen) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Grade");
		if (grade!=null) {
			if (grade.getUser()!=null && grade.getUser().getId()>0) {
					hql.append(" and user.id= ?");
					param.add(grade.getUser().getId());
				}
		if (grade.getCourse()!=null &&grade.getCourse().getTerm()>0) {
				hql.append(" and course.term= ?");
				param.add(grade.getCourse().getTerm());
			}
	
		if (grade.getCourse()!=null && !StringUtil.isEmpty(grade.getCourse().getName())) {
				hql.append(" and course.name= ?");
				param.add(grade.getCourse().getName());
			}

		if (grade.getGrade()>0) {
				hql.append(" and grade >= ?");
				param.add(grade.getGrade());
			}
		}
			
		
		if (pageBen!=null) {
			return GradeDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBen);
		}else{
			return GradeDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
		
	}

	@Override
	public Long getGradeCount(Grade grade) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Grade");
		if (grade!=null) {
			if (grade.getUser()!=null &&grade.getUser().getId()>0) {
				hql.append(" and user.id=?");
				param.add(grade.getUser().getId());
			}	
			if (grade.getCourse()!=null &&grade.getCourse().getTerm()>0) {
				hql.append(" and course.term= ?");
				param.add(grade.getCourse().getTerm());
			}
			
		}
		return GradeDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public void merge(Grade grade) {
		GradeDAO.merge(grade);
	
		
	}

	@Override
	public void save(Grade grade) {
		GradeDAO.save(grade);
	
		
	}
	@Override
	public void update(Grade grade) {
		GradeDAO.update(grade);
	
	}
}
