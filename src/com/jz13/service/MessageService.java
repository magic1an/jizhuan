package com.jz13.service;

import java.util.List;
import com.jz13.entity.Message;
import com.jz13.entity.PageBean;

public interface MessageService {
	
  public  List<Message> findMessageList(PageBean pageBean);
  
  public long getMessageCount();

  public void save(Message message) ;
  
  public Message findMessagById(int messageId);
  
  public void delete(Message message);
}
