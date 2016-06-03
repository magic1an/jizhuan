package com.jz13.service;

import java.util.List;

import com.jz13.entity.PageBean;
import com.jz13.entity.Zone;

public interface ZoneService {

	public void saveZone(Zone zone);
	
	public void deleteZone(Zone zone);
	
	public List<Zone> findZoneList(Zone s_zone,PageBean pageBean);
	
	public Long getZoneCount(Zone s_zone);
	
	public Zone findZoneById(int zoneId);
}
