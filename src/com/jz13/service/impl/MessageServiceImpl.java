package com.jz13.service.impl;


import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;
import com.jz13.entity.Message;
import com.jz13.entity.PageBean;
import com.jz13.service.MessageService;


@Service("MessageService")
public class MessageServiceImpl implements MessageService {

	@Resource
	private UserDAO<Message> messageDAO;
	


	@Override
	public List<Message> findMessageList(PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		String hql="from Message message order by message.id desc";
		if (pageBean!=null) {
			return messageDAO.find(hql, param, pageBean);
			
		}
		else {
			return messageDAO.find(hql, param);
			
		}
		
	}

	@Override
	public long getMessageCount() {
		String hql="select count(*) from Message";
		
		return messageDAO.count(hql);
	}

	@Override
	public void save(Message message) {	
	
		messageDAO.save(message);
		
	}
	

	@Override
	public void delete(Message message) {
		
		messageDAO.delete(message);
		
	}

	@Override
	public Message findMessagById(int messageId) {
		StringBuffer hql=new StringBuffer("from Message where id=?");
		hql.append(messageId);
		return messageDAO.get(Message.class, messageId);
		
		
	}

}
