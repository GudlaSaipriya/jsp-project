<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		int accno = Integer.parseInt(request.getParameter("accno"));
		int amt = Integer.parseInt(request.getParameter("amt"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info1","root","root");
			PreparedStatement stmt = conn.prepareStatement("insert into detailes1 values(?,?)");
			stmt.setInt(1, accno);
			stmt.setInt(2, amt);
			int i = stmt.executeUpdate();
			if(i>0) {
				out.println("Successfully updated");
				out.println("<html><body>");
				out.println("<a href='showdetails.jsp'>show records</a>");
				out.println("</body></html>");
			}else{
				out.println("Login Fail");
				out.println("<html><body>");
				out.println("<a href='Home1.html'>Home1</a>");
				out.println("</body></html>");
			}
			
		}catch(ClassNotFoundException ex) {
			ex.printStackTrace();
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
%>

</body>
</html>