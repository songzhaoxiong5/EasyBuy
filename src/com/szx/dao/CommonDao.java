package com.szx.dao;
import java.io.Serializable;
import java.util.List;
public interface CommonDao<T> {
	public int add(T t);
	public int deleteById(Serializable id);
	public int update(T t);
	public List<T> selectAll(Object ...objects);//带条件选择多个元素
	public T selectOne(Object ...objects);//带条件选择单个元素
	//CommonDao中加入分页有关的公共泛型方法
	public int getTotalCount(Object ...objects);
	public List<T> getPageList(int pageNo, int pageSize, Object ...objects);//带条件分页选择元素
}