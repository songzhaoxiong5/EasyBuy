package com.szx.bean;

import java.io.Serializable;
import java.util.Date;

public class EasyBuy_News implements Serializable {
	/**
	 * 
	 */
	private Integer id;
	private String title;
	private String content;
	private Date createTime;
	private String img;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "EasyBuy_News [title=" + title + ", content=" + content
				+ ", createTime=" + createTime + ", img=" + img + "]";
	}
}



//id          int(11)       (NULL)           NO      PRI     (NULL)             auto_increment  select,insert,update,references  编号                       
//title       varchar(255)  utf8_general_ci  NO              (NULL)                             select,insert,update,references  标题                       
//content     varchar(255)  utf8_general_ci  NO              (NULL)                             select,insert,update,references  内容                       
//createTime  datetime      (NULL)           NO              CURRENT_TIMESTAMP                  select,insert,update,references  录入日期                 
//img         varchar(255)  utf8_general_ci  YES             (NULL)                             select,insert,update,references  新闻对应图片的路径  
