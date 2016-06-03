package com.jz13.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;
import com.jz13.entity.PageBean;
import com.jz13.entity.Zone;
import com.jz13.service.ZoneService;
import com.jz13.util.StringUtil;

@Service("zoneService")
public class ZoneServiceImpl implements ZoneService {

	@Resource
	private UserDAO<Zone> baseDAO;
	
	@Override
	public void saveZone(Zone zone) {
		baseDAO.merge(zone);
	}

	@Override
	public void deleteZone(Zone zone) {
		baseDAO.delete(zone);
	}

	@Override
	public List<Zone> findZoneList(Zone s_zone,PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Zone");
		if (s_zone!=null) {
			if (StringUtil.isNotEmpty(s_zone.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_zone.getName()+"%");
			}
		}
		if (pageBean!=null) {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return baseDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	@Override
	public Long getZoneCount(Zone s_zone) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Zone");
		if (s_zone!=null) {
			if (StringUtil.isNotEmpty(s_zone.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_zone.getName()+"%");
			}
		}
		return baseDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public Zone findZoneById(int zoneId) {
		return baseDAO.get(Zone.class, zoneId);
	}

}