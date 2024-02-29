<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String product_id = request.getParameter("id");

try{
	Connection conn = ConnectionProvider.getCon();
	Statement st = conn.createStatement();
	st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
	
	response.sendRedirect("myCart.jsp?msg=removed");
}catch(Exception e){
	System.out.println(e);
}
%>
