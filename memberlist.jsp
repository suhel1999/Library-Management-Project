<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import= "javax.servlet.http.*, java.io.*,java.sql.*,java.servlet.*,java.math.BigDecimal" %>

<!DOCTYPE html>

<html>

<head>

 <title>Table layout</title>

 <link rel="stylesheet" href="CSS\profile.css">

</head>

<body>
<form action="" method = "post">
    <div class="full-page"></div>
        
             
           
        <div class="filter">
            <center><h1 class="main-heading">Member's List</h1></center>
        </div>
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

	 if (connection != null) 
	{
	    String query = "SELECT fullname,username,mobile,email,type FROM users;";
	    statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

	 
 %>


 <table >
 <tr>
    <th>Name </th>
    <th> Username  </th>
    <th> Mobile Number   </th>
    <th> Email-ID     </th>
    <th> UserType   </th>
 </tr>
     
    <%
          while (resultSet.next()) {
    %>

  <tr>

 <td><%= resultSet.getString("fullname") %></td>

 <td><%= resultSet.getString("username") %></td>

 <td><%= resultSet.getString("mobile") %></td>

 <td><%= resultSet.getString("email") %></td>

 <td><%= resultSet.getString("type") %></td>

 </tr>

<%
                }
%>

</table>

<%
            } else {
                throw new SQLException("Failed to establish a database connection.");
            }
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
</div>
 </body>

</html>