package com.jz13.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;
import com.jz13.entity.Position;
import com.jz13.service.PositionSerice;

@Service("PositionSerice")
public class PositionSericeImpl implements PositionSerice {
	
	@Resource
	private UserDAO<Position> positionDAO;

	@Override
	public List<Position> findPositionList() {
		
		List<Object> param=new LinkedList<Object>();
		String  hql="from Position";
		// TODO Auto-generated method stub
		return  positionDAO.find(hql.toString(), param);
		
	}

}
