package com.jz13.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;
import com.jz13.entity.PageBean;
import com.jz13.entity.Work;
import com.jz13.service.WorkService;

@Service("workService")
public class WorkServiceImpl implements WorkService {
	
	@Resource
	private UserDAO<Work> WorkDAO;

	@Override
	public List<Work> findWorkList(PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		String hql="from Work";

		if (pageBean!=null) {
			return WorkDAO.find(hql, param, pageBean);
		}
		else {
			return WorkDAO.find(hql,param);
			
	}
	}

	@Override
	public long getWorkCount() {
		String hql="select count(*) from Work";		
		return WorkDAO.count(hql);
	}

	@Override
	public void save(Work work) {
		WorkDAO.merge(work);
		
	}

	@Override
	public void delete(Work work) {
		WorkDAO.delete(work);
		
	}

	@Override
	public Work findById(int workId) {
		
		return WorkDAO.get(Work.class, workId);
	}

}
