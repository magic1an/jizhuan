package com.jz13.service;

import java.util.List;

import com.jz13.entity.Infrom;
import com.jz13.entity.PageBean;

public interface InfromService {
	
	public List<Infrom> findList();
	
	public void save(Infrom infrom);
	
	public void delete(Infrom infrom);
	
    public List<Infrom> findList(PageBean pageBean);
    
    public long getInfromCount();
    
    public Infrom findInfromById(int infromId);


}
