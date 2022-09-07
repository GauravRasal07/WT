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

try {
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_assign_7", "root", "");
    
    java.sql.Statement st = con.createStatement();
		
		ResultSet result=st.executeQuery("select * from employee");
		
		String name="";
		String email="";
		int i=1;
		out.print("<p><b>Name</b>\t\t<b>Email</b></p>");
    while(result.next()) {
      name=result.getString(1);
      email=result.getString(2);
      
      out.print("<p> "+i+": "+name+"\t\t"+email+"</p>");
      i++;
      
    }
		
		st.close();
    con.close();
} catch (Exception e){
	
}


%>

</body>
</html>