package com.jz13.service.impl;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;
import com.jz13.entity.PageBean;
import com.jz13.entity.Section;
import com.jz13.service.SectionService;
import com.jz13.util.StringUtil;

@Service("sectionService")
public class SectionServiceImpl implements SectionService {

	@Resource
	private UserDAO<Section> UserDAO;
	
	@Override
	public void saveSection(Section section) {
		UserDAO.merge(section);
	}

	@Override
	public void deleteSection(Section section) {
		UserDAO.delete(section);
	}

	@Override
	public List<Section> findSectionList(Section s_section,PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from Section");
		if (s_section!=null) {
			if (StringUtil.isNotEmpty(s_section.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_section.getName()+"%");
			}
		}
		if (s_section!=null) {
			if (s_section.getZone()!=null&&s_section.getZone().getId()>0) {
				hql.append(" and zoneId = ?");
				param.add(s_section.getZone().getId());
			}
		}
		if (s_section!=null) {
			if (s_section.getMaster()!=null&&s_section.getMaster().getId()>0) {
				hql.append(" and masterId = ?");
				param.add(s_section.getMaster().getId());
			}
		}
		if (pageBean!=null) {
			return UserDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else {
			return UserDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}
	
	@Override
	public Long getSectionCount(Section s_section) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from Section");
		if (s_section!=null) {
			if (StringUtil.isNotEmpty(s_section.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_section.getName()+"%");
			}
			if (s_section!=null) {
				if (s_section.getZone()!=null&&s_section.getZone().getId()>0) {
					hql.append(" and zoneId = ?");
					param.add(s_section.getZone().getId());
				}
			}
			if (s_section!=null) {
				if (s_section.getMaster()!=null&&s_section.getMaster().getId()>0) {
					hql.append(" and masterId = ?");
					param.add(s_section.getMaster().getId());
				}
			}
		}
		return UserDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public Section findSectionById(int sectionId) {
		return UserDAO.get(Section.class, sectionId);
	}

}
