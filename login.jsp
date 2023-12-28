<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import= "javax.servlet.http.*, java.io.*,java.sql.*,java.servlet.*,java.lang.*" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <%

   

     Connection connection=null;
	//PrintWriter out = response.getWriter();
	// response.setContentType("text/html");
	
    try
    {
    
        Class.forName("com.mysql.cj.jdbc.Driver");
	    
        String dbURL = "jdbc:mysql://localhost:3307/library_management";
        String user = "root";
        String pass = "2399";
        connection = DriverManager.getConnection(dbURL, user, pass);

    
        String u = request.getParameter("t1"); 
        String p = request.getParameter("t2");
    String q = "Select * from users where username = ? and password = ?";

    PreparedStatement pst = connection.prepareStatement(q);
    pst.setString(1, u);
    pst.setString(2, p);
    out.println(u);
    out.println(p);
    
    ResultSet rs= pst.executeQuery();
     
    if(u.equals("Admin") && p.equals("123")){
        response.sendRedirect("Adminpage.html");
     }
       else if(rs.next()) {
        //dispose();
        //out.println("Valid User");
        response.sendRedirect("Profile.html");
        
    }
    else {

        out.println("inValid User");}
    
    
    }
    catch(Exception e1) {}
    
    finally{
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


%>
</body>
</html>