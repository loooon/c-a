package com.credit.service;

import com.credit.dao.query.UserQuery;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by wangjunling on 2017/4/11.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-datasource.xml","classpath:spring/spring-service-tx-aop.xml"})
public class BaseTest
{
	@Resource
	private ApplicationContext applicationContext;


	@Test
	public void test(){
		System.out.println(applicationContext);
	}


}
