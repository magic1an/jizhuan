package com.jz13.service;

import java.util.List;

import com.jz13.entity.PageBean;
import com.jz13.entity.Section;

public interface SectionService {

	public void saveSection(Section section);
	
	public void deleteSection(Section section);
	
	public List<Section> findSectionList(Section s_section,PageBean pageBean);
	
	public Long getSectionCount(Section s_section);
	
	public Section findSectionById(int sectionId);
	
}
