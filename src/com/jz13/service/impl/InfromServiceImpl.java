package com.jz13.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;
import com.jz13.entity.Infrom;
import com.jz13.entity.PageBean;
import com.jz13.service.InfromService;

@Service("infromService")
public class InfromServiceImpl implements InfromService {
	
	@Resource
	private UserDAO<Infrom> infromDAO;

	@Override
	public List<Infrom> findList() {
		String hql="from Infrom";
		return infromDAO.find(hql);
	}

	@Override
	public void save(Infrom infrom) {
		infromDAO.merge(infrom);		
	}

	@Override
	public void delete(Infrom infrom) {
		infromDAO.delete(infrom);		
	}

	@Override
	public List<Infrom> findList(PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		String hql="from Infrom infrom order by infrom.id desc";
		if (pageBean!=null) {
			return infromDAO.find(hql, param, pageBean);			
		}
		else {
			return infromDAO.find(hql, param);			
		}		
	}

	@Override
	public long getInfromCount() {
		String hql="select count(*) from Infrom";
		return infromDAO.count(hql);
	}

	@Override
	public Infrom findInfromById(int infromId) {		
		return infromDAO.get(Infrom.class,infromId);
	}

}
