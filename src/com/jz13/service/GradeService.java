package com.jz13.service;

import java.util.List;
import com.jz13.entity.Grade;
import com.jz13.entity.PageBean;

public interface GradeService{
	
	public List<Grade> findGradeList(Grade grade,PageBean pageBen);
	
	public Long getGradeCount(Grade grade);
	
	public void merge(Grade grade);

	public void save(Grade grade);
	
	public void update(Grade grade);
	
	
	
}
