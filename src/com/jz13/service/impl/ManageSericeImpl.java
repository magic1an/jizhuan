package com.jz13.service.impl;

import java.util.LinkedList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;
import com.jz13.entity.Manage;
import com.jz13.entity.PageBean;

import com.jz13.service.ManageSerice;

@Service("manageSerice")
public class ManageSericeImpl implements ManageSerice {
	
	
	@Resource
	private UserDAO<Manage> ManageDAO;	
	@Override
	public List<Manage> findManageList() {	
		String  hql="from Manage";
		return  ManageDAO.find(hql);
	}
	@Override
	public List<Manage> findManageList(PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		String hql="from Manage manage order by manage.id desc";
		if (pageBean!=null) {
			return ManageDAO.find(hql, param, pageBean);
			
		}
		else {
			return ManageDAO.find(hql, param);
			
		}
		
	
	}
	@Override
	public long getManageCount() {
		String hql="select count(*) from Manage";
		
		return ManageDAO.count(hql);
	}
	@Override
	public void save(Manage manage) {
		ManageDAO.merge(manage);
	}
	
	@Override
	public void delete(Manage manage) {
		ManageDAO.delete(manage);
		
	}
	

}
