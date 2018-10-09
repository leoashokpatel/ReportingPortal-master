package com.comlink.dao.impl;


import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.comlink.dao.UserDao;
import com.comlink.model.User;
import com.comlink.rowmapper.UserListMapper;


public class UserDaoImpl implements UserDao{
	
	private JdbcTemplate jdbcTemplate;
	 
	public void setDataSource(DataSource dataSource)
	{
	   this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	
	public int registerUser(User user)
	{
	
	  return this.jdbcTemplate.update("CALL create_user(?,?,?,?,?)",user.getFirstName(),user.getLastName(),user.getPassword(),user.getUserName(),user.getType());
	}
    
	
	public User login(String username,String password)
	{
	      User user=new User();
	      List<Map<String, Object>> certs = this.jdbcTemplate.queryForList("call login(?,?)",username,password);  		    
		  if(certs.size()>0)
		  {
				user.setId(certs.get(0).get("id").toString());
				user.setType(certs.get(0).get("type").toString());
				return user;
		   }
		return null;
	}

	
	public int updateUser(String id,String password)
	{
	   return this.jdbcTemplate.update("call UserUpdate_proc(?,?)",Long.valueOf(id),password);
    }

	
	public User getUserById(String id) {
		User user=new User();
	    List<Map<String, Object>> certs =this.jdbcTemplate.queryForList("call getuserbyid_proc(?)",Long.valueOf(id)); 		    
		if(certs.size()>0)
		{
			user.setId(certs.get(0).get("id").toString());
			return user;
		}
		return user;
	}

	
	public List<User> getAllUser() 
	{
		return this.jdbcTemplate.query("call new_proc()",new UserListMapper());
     }

	
	public int editUser(User user)
	{
		
	  return this.jdbcTemplate.update("call edit_user_proc(?,?,?,?)",user.getFirstName(),user.getLastName(),user.getUserName(),user.getId());
	}

	
	public int deleteUser(String id) 
	{
		
	   return this.jdbcTemplate.update("call deleteUser(?)", Long.valueOf(id));
		
	}

	
	public List<User> uniqueuser()
	{
		String sql="select * from user";
		List<User> list = jdbcTemplate.query(sql, new UserListMapper());
		return list;
	}
	

}
	

