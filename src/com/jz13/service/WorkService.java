package com.jz13.service;

import java.util.List;

import com.jz13.entity.PageBean;
import com.jz13.entity.Work;

public interface WorkService {
	
	
	public void save(Work work); 
	
	public void delete(Work work);
	
	public List<Work> findWorkList(PageBean pageBean);
	
	public long getWorkCount();
	
	public Work findById(int workId);
	

}
