<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String uId = request.getParameter("userId");

    Class.forName("oracle.jdbc.driver.OracleDriver");

    String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";

    Connection conn = DriverManager.getConnection(url,"team5_202402M","java");

    Statement stmt = conn.createStatement();

    String sql ="select user_id from user_"
            +" where user_id='" +uId+ "'";

    ResultSet rs = stmt.executeQuery(sql);

    if(rs.next()){
%>
        {
            "rst":"fail",
            "msg":"사용불가"
        }
<%  
    } else {
%>
        {
            "rst":"ok",
            "msg":"사용가능"
        }
<%      
    }
%>
