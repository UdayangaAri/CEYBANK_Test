
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connections.DBConnection"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@page import="Roles.RoleDao"%>
<%@page import="Roles.Role"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Branches.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="Branches.Branch"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	Connection con = DBConnection.getConnection();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	OutputStream oImage = null;
	
	try {
		pstmt = con.prepareStatement("SELECT * FROM news_images ORDER BY imageID DESC LIMIT 1;");
		rs = pstmt.executeQuery();

		if (rs.next()) {

			byte barray[] = rs.getBytes(2);
			response.setContentType("image/gif");
			oImage = response.getOutputStream();
			
			oImage.write(barray);
			oImage.flush();
			oImage.close();

		}
	} catch (Exception ex) {
		//ex.printStackTrace();
	} finally {
		try {
			if (con != null)
				con.close();
		} catch (Exception ex) {
			// ex.printStackTrace();
		}
	}
%>