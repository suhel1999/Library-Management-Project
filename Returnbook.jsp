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
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String dbURL = "jdbc:mysql://localhost:3307/library_management";
        String user = "root";
        String pass = "2399";
        connection = DriverManager.getConnection(dbURL, user, pass);

        if (connection != null) {
            // Retrieve user inputs from the form
            String bookName = request.getParameter("t1");
            int bookID = Integer.parseInt(request.getParameter("t2"));
            String returnDate = request.getParameter("t3");
            BigDecimal penalty = new BigDecimal(request.getParameter("t4"));

            // Update the table using user inputs
            String query = "UPDATE book_issue_return SET return_date = ?, penalty = ? WHERE book_name = ? AND book_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, returnDate);
            preparedStatement.setBigDecimal(2, penalty);
            preparedStatement.setString(3, bookName);
            preparedStatement.setInt(4, bookID);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("Adminpage.html");
            } else {
                out.println("Failed to return the book. Please check your input.");
            }
        }
    } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
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
