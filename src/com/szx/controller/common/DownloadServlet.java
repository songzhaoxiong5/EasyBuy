package com.szx.controller.common;

import java.io.FileInputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.log4j.*;
public class DownloadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//private Logger logger=Logger.getLogger(DownloadServlet.class);

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String downloadURL=request.getParameter("filePath");
		String fileName=request.getParameter("fileName");
		response.setContentType(getServletContext().getMimeType(fileName));
		response.setHeader("Content-Disposition", "attachment;filename="+fileName);
		String fullFileName=request.getServletContext().getRealPath("\\")+downloadURL;
		System.out.println(fullFileName);
		InputStream in=new FileInputStream(fullFileName);
		OutputStream out=response.getOutputStream();
		int b;
		while((b=in.read())!=-1){
			out.write(b);
		}
		out.flush();
		in.close();
		out.close();
	}
	

}
