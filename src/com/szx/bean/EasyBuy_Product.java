package com.szx.bean;

public class EasyBuy_Product {
	private Integer id;
	private String name;
	private String description;
	private Float price;
	private Integer stock;
	private Integer categoryLevel1;
	private Integer categoryLevel2;
	private Integer categoryLevel3;
	private String fileName;
	private Integer isDelete;
	private String img;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Integer getCategoryLevel1() {
		return categoryLevel1;
	}
	public void setCategoryLevel1(Integer categoryLevel1) {
		this.categoryLevel1 = categoryLevel1;
	}
	
	public Integer getCategoryLevel2() {
		return categoryLevel2;
	}
	public void setCategoryLevel2(Integer categoryLevel2) {
		this.categoryLevel2 = categoryLevel2;
	}
	public Integer getCategoryLevel3() {
		return categoryLevel3;
	}
	public void setCategoryLevel3(Integer categoryLevel3) {
		this.categoryLevel3 = categoryLevel3;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
}

//
//Field           Type          Collation        Null    Key     Default  Extra           Privileges                       Comment               
//--------------  ------------  ---------------  ------  ------  -------  --------------  -------------------------------  ----------------------
//id              int(11)       (NULL)           NO      PRI     (NULL)   auto_increment  select,insert,update,references  商品编号          
//name            varchar(255)  utf8_general_ci  NO              (NULL)                   select,insert,update,references  商品名字          
//description     varchar(255)  utf8_general_ci  YES             (NULL)                   select,insert,update,references  商品描述          
//price           float         (NULL)           NO              (NULL)                   select,insert,update,references  商品价格          
//stock           int(11)       (NULL)           NO              (NULL)                   select,insert,update,references  商品库存          
//categoryLevel1  int(11)       (NULL)           NO              (NULL)                   select,insert,update,references  所属一级分类ID  
//categoryLevel2  int(11)       (NULL)           YES             (NULL)                   select,insert,update,references  所属二级分类ID  
//categoryLevel3  varchar(255)  utf8_general_ci  NO              (NULL)                   select,insert,update,references  所属三级分类ID  
//fileName        varchar(255)  utf8_general_ci  NO              (NULL)                   select,insert,update,references  上传的文件名    
//isDelete        int(1)        (NULL)           NO              (NULL)                   select,insert,update,references  是否删除          