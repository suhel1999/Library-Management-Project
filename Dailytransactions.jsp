<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.*,java.io.*,java.sql.*,java.servlet.*,java.math.BigDecimal" %>

<!DOCTYPE html>

<html>

<head>

    <title>Table layout</title>
    <link rel="stylesheet" href="CSS\profile.css">

</head>

<body>
    <form action="" method="get">
        <div class="full-page"></div>

        <div class="filter">
            <center><h1 class="main-heading">Daily Transactions</h1></center>
        </div>

        <%
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                String dbURL = "jdbc:mysql://localhost:3307/library_management";
                String user = "root";
                String pass = "2399";
                connection = DriverManager.getConnection(dbURL, user, pass);

                if (connection != null) {
                    String query = "SELECT username,book_id,book_name,issue_date,return_date FROM book_issue_return where date(issue_date)=current_date or date(return_date)=current_date;";
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery(query);
                }
        %>

        <table>
            <thead>
                <tr>
                    <th>Username </th>
                    <th>Book ID </th>
                    <th>Book name</th>
                    <th>Issue date</th>
                    <th>Return date</th>
                </tr>
            </thead>
            <tbody>

                <%
                    while (resultSet.next()) {
                %>
                <tr>

                    <td><%= resultSet.getString("username") %></td>
                    <td><%= resultSet.getString("book_id") %></td>
                    <td><%= resultSet.getString("book_name") %></td>
                    <td><%= resultSet.getString("issue_date") %></td>
                    <td><%= resultSet.getString("return_date") %></td>

                </tr>
                <%
                    }
                %>

            </tbody>
        </table>

        <%
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
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

    </form>
</body>

</html>