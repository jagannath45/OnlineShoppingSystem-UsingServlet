<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% 
 String email = session.getAttribute("email").toString();
 String mobileNumber= request.getParameter("mobileNumber");
 String password= request.getParameter("password");
 
  int check=0;
  try{
	  
	  Connection conn = ConnectionProvider.getCon();
	  Statement st = conn.createStatement();
	  ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	   while(rs.next()){
		   check=1;
		   st.executeUpdate("update users set mobileNo='"+mobileNumber+"' where email='"+email+"'");
		   
		   response.sendRedirect("changeMobileNumber.jsp?msg=done");
	   }
	   if(check==0){
		   response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	   }
  }catch(Exception e){
	  System.out.println(e);
  }
 
 %>