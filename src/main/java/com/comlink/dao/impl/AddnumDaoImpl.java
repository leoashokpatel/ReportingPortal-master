package com.comlink.dao.impl;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.comlink.dao.AddnumDao;
import com.comlink.model.Addnum;

public class AddnumDaoImpl implements AddnumDao
{
	private JdbcTemplate jdbcTemplate;
	 
	public void setDataSource(DataSource dataSource)
	{
	   this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int registernum(Addnum addnum) {
    return this.jdbcTemplate.update("CALL addnum(?,?,?,?)",addnum.getCompanyName(),addnum.getCountryName(),addnum.getNum(),addnum.getFax_answer());
	}

	
}
