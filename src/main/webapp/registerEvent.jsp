<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*,javax.servlet.*,java.sql.*,com.mysql.jdbc.Statement"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 

String Name = request.getParameter("name");
String emailId = request.getParameter("emailId");
String password = request.getParameter("password");
int uid = 0, acc_no_t = 0;

try {
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet", "root", "");
		
    PreparedStatement st = con
               .prepareStatement("insert into user(name, email, password) values(?, ?,?)");
	
	st.setString(1, Name);
	st.setString(2, emailId);
	st.setString(3, password);
		
	int user=st.executeUpdate();
	
	PreparedStatement st2 = con.prepareStatement("insert into account(balance, user_id) values (0, (select max(id) from user))");
	int r1 = st2.executeUpdate();
	
	PreparedStatement get_id = con.prepareStatement("select id from user where email = ?");
	get_id.setString(1, emailId);
	ResultSet rs = get_id.executeQuery();
	while(rs.next()){
		uid = rs.getInt("id");
	}
	
	PreparedStatement get_acc_no = con.prepareStatement("select acc_no from account where user_id = ?");
	get_acc_no.setInt(1, uid);
	
	ResultSet rs1 = get_acc_no.executeQuery();
	while(rs1.next()){
		acc_no_t = rs1.getInt("acc_no");
	}
	
	PreparedStatement st3 = con.prepareStatement("update user set acc_no = ? where id = ?");
	st3.setInt(1, acc_no_t);
	st3.setInt(2, uid);
	
	int i = st3.executeUpdate();
	
	if(i > 0 && r1 > 0 && user > 0) {
		out.println("<h1>Registered Successfully!!!</h1>");
	}else {
		out.println("<h1>User not registered!!!</h1>");
	}
		
	
	st.close();
 con.close();
 
 out.print("<html>");
    out.print("<body>");
    out.print("<h1>Student Registration Form Data</h1>");
    out.print("<p> Name : " + Name + "</p>");
    out.print("<p> Email Id : " + emailId + "</p>");
    out.print("<p> password : " + password + "</p>");
    out.print("</body>");
    out.print("</html>");

		
		st.close();
    con.close();
} catch (Exception e){
	
}


%>

</body>
</html>