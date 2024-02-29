<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("Category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try{
	Connection conn= ConnectionProvider.getCon();
	PreparedStatement ps = conn.prepareStatement("insert into product values(?,?,?,?,?) ");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,category);
	ps.setString(4,price);
	ps.setString(5,active);
	//execute the above query
	ps.executeUpdate();
	 response.sendRedirect("addNewProduct.jsp?msg=done");
}catch(Exception e){
	System.out.println(e);
	 response.sendRedirect("addNewProduct.jsp?msg=wrong");

}
%>