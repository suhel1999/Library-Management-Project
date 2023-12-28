<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.*, java.io.*,java.sql.*,java.servlet.*,java.math.BigDecimal" %>
<!--<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException" %> -->

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insertion of data using JSP</title>
</head>
<body>
    <%

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String dbURL = "jdbc:mysql://localhost:3307/library_management";
        String user = "root";
        String pass = "2399";
        connection = DriverManager.getConnection(dbURL, user, pass);

        if (connection != null) {
            String username = request.getParameter("t1");
            String BookName = request.getParameter("t2");
            int BookID = Integer.parseInt(request.getParameter("t3"));
            String BorrowDate = request.getParameter("t4");

            // Debugging statements
            out.println("Username: " + username);
            out.println("BookName: " + BookName);
            out.println("BookID: " + BookID);
            out.println("BorrowDate: " + BorrowDate);

            // Additional check for null BorrowDate
            if (BorrowDate == null) {
                throw new IllegalArgumentException("BorrowDate is null");
            }

		
	    String check="select book_id from book where book_id=?";
	    preparedStatement = connection.prepareStatement(check);
	    preparedStatement.setInt(1, BookID);
	    ResultSet rs = preparedStatement.executeQuery();


	    if (rs.next()) 
           {
            String query = "INSERT INTO book_issue_return(username,book_id,book_name,issue_date) VALUES (?, ?, ?, ?);";

	   
            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, username);
            preparedStatement.setString(3, BookName);
            preparedStatement.setInt(2, BookID);
            preparedStatement.setString(4, BorrowDate);

            preparedStatement.executeUpdate();

            response.sendRedirect("Adminpage.html");
        } else {
            throw new SQLException("No book with such book_id is present.");
        }
    }
} catch (NumberFormatException e) {
        out.println("Error: Invalid number format. Please enter a valid number for BookID.");
    } catch (IllegalArgumentException e) {
        out.println("Error: " + e.getMessage());
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
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