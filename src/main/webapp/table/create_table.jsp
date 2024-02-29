<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
try{
   Connection conn = ConnectionProvider.getCon();
   Statement st = conn.createStatement();
   
   
   String q1 = "create table users(name varchar(50), email varchar(50)primary key, mobileNo bigint, securityQuestion varchar(200), answer varchar(200), password varchar(50), address varchar(100), city varchar(20), state varchar(10), country varchar(20))";
   //first use this and after comment this
   //System.out.println(q1);
   //st.execute(q1);
  
   //second code
  String q2 = "create table product(id int, name varchar(500), category varchar(200),price int, active varchar(10))";
   //System.out.println(q2);
   //st.execute(q2);
   
   //third time table creation
   String q3 = "create table cart(email varchar(50),product_id int,quantity int, price int, total int, address varchar(100), city varchar(15), state varchar(15),country varchar(100),mobileNo bigint,orderDate varchar(100), deliveryDate varchar(100),paymentMethod varchar(100), transactionId varchar(100), status varchar(10))";
   //System.out.println(q3);
   //st.execute(q3);
   
   //fourth time table creation for the message storing
   String q4 = "create table message(id int AUTO_INCREMENT, email varchar(100), subject varchar(200), body varchar(1000), primary key(id))";
      //System.out.println(q4);
       //st.execute(q4);
   
   
   System.out.println("table created");
   conn.close();
}
catch(Exception e){
	System.out.println(e);

}
%>