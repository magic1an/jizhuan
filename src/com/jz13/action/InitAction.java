package com.jz13.action;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.jz13.entity.Infrom;
import com.jz13.entity.Manage;
import com.jz13.entity.Message;
import com.jz13.entity.PageBean;
import com.jz13.entity.Section;
import com.jz13.entity.Topic;
import com.jz13.entity.Work;
import com.jz13.entity.Zone;
import com.jz13.service.InfromService;
import com.jz13.service.ManageSerice;
import com.jz13.service.MessageService;

import com.jz13.service.TopicService;
import com.jz13.service.WorkService;
import com.jz13.service.ZoneService;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class InitAction implements ServletContextListener,ApplicationContextAware{

	private static ApplicationContext applicationContext;
	private Map<Section, Long> sectionTopicCount=new HashMap<Section, Long>();
	private Map<Section, Long> sectionGoodTopicCount=new HashMap<Section, Long>();
	private Map<Section, Long> sectionNoReplyTopicCount=new HashMap<Section, Long>();
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		InitAction.applicationContext=applicationContext;
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext application=servletContextEvent.getServletContext();
		ZoneService zoneService=(ZoneService) applicationContext.getBean("zoneService");
		/*SectionService sectionService=(SectionService) applicationContext.getBean("sectionService");*/
		TopicService topicService=(TopicService) applicationContext.getBean("topicService");
		ManageSerice manageSerice=(ManageSerice) applicationContext.getBean("manageSerice");
		MessageService messageService=(MessageService) applicationContext.getBean("MessageService");
		InfromService infromService=(InfromService) applicationContext.getBean("infromService");
		WorkService workService=(WorkService) applicationContext.getBean("workService");
		
		List<Work> workList=workService.findWorkList(null);
		List<Infrom> infromList=infromService.findList();
		List<Message> messageList=messageService.findMessageList(new PageBean(Integer.parseInt("1"),6));
		List<Manage> manageList=manageSerice.findManageList();
		List<Zone> zoneList=zoneService.findZoneList(null, null);
		application.setAttribute("zoneList", zoneList);
		application.setAttribute("manageList", manageList);
		application.setAttribute("messageList", messageList);
		application.setAttribute("workList", workList);
		application.setAttribute("infromList", infromList);
		
		
		for (Zone zone : zoneList) {
			for (Section section : zone.getSectionList()) {
				Topic s_topic=new Topic(); 
				s_topic.setSection(section);
				Long tatolCount=topicService.getTopicCount(s_topic);			//板块的总帖数
				s_topic.setGood(1);
				Long goodCount=topicService.getTopicCount(s_topic);			//板块的精华帖数
				s_topic.setGood(0);
				Long noReplyCount=topicService.getNoReplyTopicCount(s_topic);			//板块的无回复帖数
				
				sectionTopicCount.put(section, tatolCount);
				sectionGoodTopicCount.put(section, goodCount);
				sectionNoReplyTopicCount.put(section, noReplyCount);
			}
		}
		
		application.setAttribute("sectionTopicCount", sectionTopicCount);
		application.setAttribute("sectionGoodTopicCount", sectionGoodTopicCount);
		application.setAttribute("sectionNoReplyTopicCount", sectionNoReplyTopicCount);
	}

}
