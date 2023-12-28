<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import= "javax.servlet.http.*, java.io.*,java.sql.*,java.servlet.*,java.math.BigDecimal" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inertion of data using jsp</title>
</head>
<body>
    <%

     Connection connection=null;
	//PrintWriter out = response.getWriter();
	// response.setContentType("text/html");
	
try {        
            Class.forName("com.mysql.cj.jdbc.Driver");
	    
            String dbURL = "jdbc:mysql://localhost:3307/library_management";
            String user = "root";
            String pass = "2399";
	        connection = DriverManager.getConnection(dbURL, user, pass);
            
            if (connection != null) {
                 
		String name = request.getParameter("name");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String cpass = request.getParameter("confirmpass");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String type = request.getParameter("type");
                String mobile = request.getParameter("mobile");
                
                String query = "INSERT INTO users (fullname, username,mobile, address,  email,type, password) VALUES (?, ?, ?, ?, ?, ?, ?)";

                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, name);

                preparedStatement.setString(2, username);
                preparedStatement.setString(3, mobile);

                preparedStatement.setString(4, address);
                preparedStatement.setString(5, email);
                preparedStatement.setString(6, type);
                preparedStatement.setString(7, password);
                preparedStatement.executeUpdate();
		out.println("4");
               response.sendRedirect("loginpage.html"); // Redirect to success page
            } else {
                throw new SQLException("Failed to establish a database connection.");
            }
    } catch (NumberFormatException | SQLException |ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage()); // Pass the error message as a request attribute
           // RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");
          //  dispatcher.forward(request, response); 
          response.sendRedirect("index.html"); //Redirect to error page
            
        }
    
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