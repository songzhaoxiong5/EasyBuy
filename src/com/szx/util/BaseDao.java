package com.szx.util;
import java.sql.*;

import javax.naming.*;
import javax.sql.DataSource;

//import com.szx.util.ConfigManager;
public class BaseDao {
	
	//protected static Connection con = null; 
	//protected static PreparedStatement stmt = null; 
	//protected static ResultSet rs = null; 

	
//	protected static boolean getConnection() {
//		try {
//			/**Context ctx=new InitialContext();
//			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/easybuy");
//			con=ds.getConnection();**/
//			
//			Class.forName(ConfigManager.getInstance().getValue("jdbc.driver"));
//			
//			con = DriverManager.getConnection(ConfigManager.getInstance()
//					.getValue("jdbc.url"), ConfigManager.getInstance()
//					.getValue("jdbc.userName"), ConfigManager.getInstance()
//					.getValue("jdbc.password"));
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return true;
//	}

	protected static Connection getConnection() {
		Connection con=null;
		try {
			Context ctx=new InitialContext();
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/easybuy");
			con=ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return con;
	}
	
	

	
	protected static int executeUpdate(String sql, Object... params) {
		Connection con=getConnection();
		PreparedStatement stmt=null;
		int rowNum = 0;
		if (con!=null) {
			try {
				stmt = con.prepareStatement(sql);
				
				for (int i = 0; i < params.length; i++) {
					stmt.setObject(i + 1, params[i]);
				}
				rowNum = stmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				
				closeAfterUpdate(stmt);
			}
		}
		return rowNum;
	}

	
	protected static ResultSet executeQuery(String sql, Object... params) {
		Connection con=getConnection();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		if (con!=null) {
			try {
				stmt = con.prepareStatement(sql);
				
				for (int i = 0; i < params.length; i++) {
					stmt.setObject(i + 1, params[i]);
				}
				rs = stmt.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs;
	}
	
	protected static void closeAfterQuery(ResultSet rs){
		Statement stmt=null;
		Connection con=null;
		try {
			stmt=rs.getStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con=stmt.getConnection();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	protected static void closeAfterUpdate(Statement stmt){
		Connection con=null;
		try {
			con=stmt.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
