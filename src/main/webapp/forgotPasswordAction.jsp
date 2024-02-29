<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<% String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String security = request.getParameter("security");
String answer = request.getParameter("answer");
String newpassword = request.getParameter("newpassword");

int check=0;

try{
	Connection conn = ConnectionProvider.getCon();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"'");
	
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set password='"+newpassword+"'where email='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
	
}catch(Exception e){
	  System.out.println(e);
}


%>