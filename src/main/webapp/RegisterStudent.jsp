<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*,javax.servlet.*,java.sql.*,com.mysql.jdbc.Statement,JSP_JDBC.databaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
		<%
		 
		
		String Name = request.getParameter("name");
        String emailId = request.getParameter("emailId");
        String password = request.getParameter("password");
        String action=request.getParameter("form-action");
       
        
        
        if(action==null || action.equals("")) {
        	out.println("<h1>Action not specified!!!</h1>");
        }else if(action.equals("insert")) {
        	
        	 

	   		 try {
	   			Connection con = databaseConnection.initializeDatabase();
	   			
	   			java.sql.Statement selectStatement = con.createStatement();
	   			ResultSet result=selectStatement.executeQuery("select * from employee where email='"+emailId+"'");
	   			
	   			int size =0;
	   			if (result != null) 
	   			{
	   				result.last();    // moves cursor to the last row
	   			  size = result.getRow(); // get row id 
	   			}
	   			
	   			
	   			if(size==0) {
	   				
	   				PreparedStatement st = con
		   	                   .prepareStatement("insert into employee(f_name, email, password) values(?, ?,?)");
		   			
		   			st.setString(1, Name);
		   			st.setString(2, emailId);
		   			st.setString(3, password);
		   			
		   			int i=st.executeUpdate();
		   			if(i>0) {
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
		        	
	   				
	   			}else {
	   				out.print("<h1>Student is already registered!!!</h1>");
	   			}
	   			
	   			
	   		} catch (ClassNotFoundException e) {
	   			// TODO Auto-generated catch block
	   			e.printStackTrace();
	   		} catch (SQLException e) {
	   			// TODO Auto-generated catch block
	   			e.printStackTrace();
	   		}
	   		
	   		
	
	   		
	   		    
	      }else if(action.equals("select")){
	    	  try {
		   			Connection con = databaseConnection.initializeDatabase();
		   			
		   			java.sql.Statement st = con.createStatement();
		   			
		   			ResultSet result=st.executeQuery("select * from employee");
		   			
		   			String name="";
		   			String email="";
		   			int i=1;
		   			out.print("<p><b>Name</b>\t\t<b>Email</b></p>");
		            while(result.next()) {
		              name=result.getString(2);
		              email=result.getString(8);
		              
		              out.print("<p> "+i+": "+name+"\t\t"+email+"</p>");
		              i++;
		              
		            }
		   			
		   			st.close();
		            con.close();
		   		} catch (ClassNotFoundException e) {
		   			// TODO Auto-generated catch block
		   			e.printStackTrace();
		   		} catch (SQLException e) {
		   			// TODO Auto-generated catch block
		   			e.printStackTrace();
		   		}
	      }else if(action.equals("delete")){
	    	  
	    	  
	    	  try {
		   			Connection con = databaseConnection.initializeDatabase();
		   			
		   			java.sql.Statement st = con.createStatement();
		   			ResultSet res=st.executeQuery("select * from employee where email='"+emailId+"'");
		   			
		   			System.out.println(res);
		   			if (res != null) 
		   			{
		   				java.sql.Statement dst = con.createStatement();
		   				int result=dst.executeUpdate("delete from employee where email='"+emailId+"'");
			   			
			   			String name="";
			   			String email="";
			   			int i=1;
			   			out.print("<h1>Deleted Records : </h1>");
			   			out.print("<p><b>Name</b>\t\t<b>Email</b></p>");
			            while(res.next()) {
			              name=res.getString(1);
			              email=res.getString(2);
			              
			              out.print("<p> "+i+": "+name+"\t\t"+email+"</p>");
			              i++;
			              
			            }
			   			
			   			st.close();
			            con.close();
		   				
		   				
		   			}else {
		   				
		   				out.print("<h1>No student is registered with that email!!!</h1>");
		   			}
		   			
		   			
		   			
		   			
		   			
		   			
		   		} catch (ClassNotFoundException e) {
		   			// TODO Auto-generated catch block
		   			e.printStackTrace();
		   		} catch (SQLException e) {
		   			// TODO Auto-generated catch block
		   			e.printStackTrace();
		   		}
	    	  
	      }else if(action.equals("update")) {
	    	  
	    	  try {
		   			Connection con = databaseConnection.initializeDatabase();
		   			
		   			java.sql.Statement st = con.createStatement();
		   			ResultSet res=st.executeQuery("select * from employee where email='"+emailId+"'");
		   			
		   			if (res != null) 
		   			{
		   				java.sql.Statement dst = con.createStatement();
		   				int result=dst.executeUpdate("update employee SET name='"+Name+"', password='"+password+"' where email='"+emailId+"'");
			   			
			   			out.print("<h1>Data Updated Successfully!!!</h1>");
			   			
			   			st.close();
			            con.close();
		   				
		   				 
		   			}else {
		   				
		   				out.print("<h1>No student to update data with that email!!!</h1>");
		   			}
		   			
		   			
		   			
		   			
		   			
		   			
		   		} catch (ClassNotFoundException e) {
		   			// TODO Auto-generated catch block
		   			e.printStackTrace();
		   		} catch (SQLException e) {
		   			// TODO Auto-generated catch block
		   			e.printStackTrace();
		   		}
	    	  
	      }
		
		%>
</body>
</html>