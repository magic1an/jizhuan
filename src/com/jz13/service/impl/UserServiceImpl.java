package com.jz13.service.impl;



import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jz13.dao.UserDAO;
import com.jz13.entity.PageBean;
import com.jz13.entity.User;
import com.jz13.service.UserService;
import com.jz13.util.StringUtil;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserDAO<User> UserDAO;
	
	@Override
	public void saveUser(User user) {
		//UserDAO.update(user);
		UserDAO.merge(user);
	}

	@Override
	public boolean existUserWithName(String Name) {
		String hql="select count(*) from User where name=?";
		long count=UserDAO.count(hql, new Object[]{Name});
		if (count>0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public User login(User user) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User u where u.name=?");
		param.add(user.getName());
		return UserDAO.get(hql.toString(), param);
	}

	@Override
	public List<User> findUserList(User s_user, PageBean pageBean) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User");
		if (s_user!=null) {
			if (StringUtil.isNotEmpty(s_user.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_user.getName()+"%");
			}
			if (s_user.getType()>0) {
				hql.append(" and type = ?");
				param.add(s_user.getType());
			}
		}
		if (pageBean!=null) {
			return UserDAO.find(hql.toString().replaceFirst("and", "where"), param, pageBean);
		}else{
			return UserDAO.find(hql.toString().replaceFirst("and", "where"), param);
		}
	}

	@Override
	public Long getUserCount(User s_user) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("select count(*) from User");
		if (s_user!=null) {
			if (StringUtil.isNotEmpty(s_user.getName())) {
				hql.append(" and name like ?");
				param.add("%"+s_user.getName()+"%");
			}
			if (s_user.getType()>0) {
				hql.append(" and type = ?");
				param.add(s_user.getType());
			}
		}
		return UserDAO.count(hql.toString().replaceFirst("and", "where"), param);
	}

	@Override
	public void delete(User user) {
		UserDAO.delete(user);
	}

	@Override
	public User getUserById(int id) {
		return UserDAO.get(User.class, id);
	}

	@Override
	public User getUserByName(String name) {
		List<Object> param=new LinkedList<Object>();
		StringBuffer hql=new StringBuffer("from User");
		if (StringUtil.isNotEmpty(name)) {
			hql.append(" and name = ?");
			param.add(name);
		}
		return UserDAO.get(hql.toString().replaceFirst("and", "where"), param);
	}

}
