package com.szx.util;
import java.util.*;
public class Page<T> {
	private int totalPageCount=0;
	private int pageSize=8;
	private int totalCount;
	private int currentPageNo=1;
	private List<T> list;
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if(pageSize>0){
			this.pageSize = pageSize;
		}
		
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		if(totalCount>0){
			this.totalCount = totalCount;
		}
		totalPageCount=this.totalCount%pageSize==0?(this.totalCount/pageSize==0?1:this.totalCount/pageSize):(this.totalCount/pageSize)+1;
	}
	public int getCurrentPageNo() {
		if(totalPageCount==0){
			return 0;
		}
		return currentPageNo;
		
	}
	public void setCurrentPageNo(int currentPageNo) {
		if(currentPageNo>0){
			this.currentPageNo = currentPageNo;
		}
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	
	
	
}
