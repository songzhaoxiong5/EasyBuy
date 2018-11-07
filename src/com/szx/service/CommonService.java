package com.szx.service;

import java.io.Serializable;
import java.util.List;

import com.szx.util.Page;

public interface CommonService<T>{
	public int add(T t);
	public int deleteById(Serializable id);
	public int update(T t);
	public List<T> selectAll(Object ...objects);//带条件选择多个元素
	public T selectOne(Object ...objects);//带条件选择单个元素
	//CommonDao中加入分页有关的公共泛型方法
	public int getTotalCount(Object ...objects);
	public void getPageList(Page<T> pageObj, Object ...objects);//带条件分页选择元素
}
