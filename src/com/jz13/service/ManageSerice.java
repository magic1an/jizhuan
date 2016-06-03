package com.jz13.service;

import java.util.List;

import com.jz13.entity.Manage;
import com.jz13.entity.PageBean;

public interface ManageSerice {
	
	
	public List<Manage> findManageList();
	
	public List<Manage> findManageList(PageBean pageBean);
	
	public long getManageCount();
	
	public void save(Manage manage);
	
	public void delete(Manage manage);
	
/*	
	public Manage fingManageById(int id);
	
	public void save(Manage manage);
	
	public void merge(Manage manage);
	*/

}
