package com.szx.bean;

public class EasyBuy_ProductCategory {
	private Integer id;
	private String name;
	private Integer parentId;
	private Integer type;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	
}


//Field     Type          Collation        Null    Key     Default  Extra           Privileges                       Comment    
//--------  ------------  ---------------  ------  ------  -------  --------------  -------------------------------  -----------
//id        int(11)       (NULL)           NO      PRI     (NULL)   auto_increment  select,insert,update,references  编号     
//name      varchar(255)  utf8_general_ci  NO              (NULL)                   select,insert,update,references  名字     
//parentId  int(11)       (NULL)           NO              (NULL)                   select,insert,update,references  父分类  
//type      int(1)        (NULL)           YES             (NULL)                   select,insert,update,references  类型     

