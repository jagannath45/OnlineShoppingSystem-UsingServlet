<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String Category = request.getParameter("Category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try{
	Connection conn = ConnectionProvider.getCon();
	Statement st = conn.createStatement();
	st.executeUpdate("update product set name='"+name+"',category='"+Category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	
	if(active.equals("No")){
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>