<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String name= request.getParameter("name");
String email= request.getParameter("email");
String mobile= request.getParameter("mobile");
String security= request.getParameter("security");
String answer = request.getParameter("anser");
String password= request.getParameter("password");
String address="";
String city="";
String state="";
String country="";

try{
	Connection conn = ConnectionProvider.getCon();
	String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = conn.prepareStatement(sql);
	
	//set the values
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,mobile);
	ps.setString(4,security);
	ps.setString(5,answer);
	ps.setString(6,password);
	ps.setString(7,address);
	ps.setString(8,city);
	ps.setString(9,state);
	ps.setString(10,country);
	
	//query
	ps.executeUpdate();
	
	
	response.sendRedirect("signup.jsp?msg=valid");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");

}
%>