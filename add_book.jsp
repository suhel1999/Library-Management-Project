<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import= "javax.servlet.http.*, java.io.*,java.sql.*,java.servlet.*" %>


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
	    out.println("1");
            String dbURL = "jdbc:mysql://localhost:3307/library_management";
            String user = "root";
            String pass = "2399";
	        connection = DriverManager.getConnection(dbURL, user, pass);
            out.println("2");
            if (connection != null) {
                 
                String BookIDString = request.getParameter("t1");
                int BookID = Integer.parseInt(BookIDString);
                  String BookName = request.getParameter("t2");
                  String ISBN = request.getParameter("t3");
                  String A1 = request.getParameter("t4");
                  String A2 = request.getParameter("t5");
                  String Subject = request.getParameter("t6");
                  String link = request.getParameter("t7");
                
                out.println("3");
                String query = "INSERT INTO book(book_id, name_of_book,isbn, author1,  author2,Sub,Link) VALUES (?, ?, ?, ?, ?, ?,?)";
  
                  PreparedStatement preparedStatement = connection.prepareStatement(query);
                  preparedStatement.setInt(1, BookID);
                  preparedStatement.setString(2, BookName);
                  preparedStatement.setString(3, ISBN);
                  preparedStatement.setString(4, A1);
                  preparedStatement.setString(5, A2);
                  preparedStatement.setString(6, Subject);
                  preparedStatement.setString(7, link);
 out.println("4");
                preparedStatement.executeUpdate();
		        out.println("5");
               response.sendRedirect("Adminpage.html"); // Redirect to success page
                out.println("6");
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
