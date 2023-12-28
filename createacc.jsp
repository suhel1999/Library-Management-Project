<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login page</title>
    <link rel="stylesheet" href="CSS\createacc.css">
</head>
<body>
<form action="http://localhost:8080/Library/InsertDetails.jsp" method="post">

    <div class="full-page">
          <div >
             <button class="BUTTON" id="log_button" onclick="location.href='loginpage.html'">Back</button>
         </div>
        <div class="sub-page">
            <div class="navigation-bar">
                <div class="logo">
                    
                </div>
                <nav>
                   
                </nav>
            </div>
            <div class="row">
                <div class="col-1">
                    <div class="form-box">
                        <div class="form">
                            <form class="login-form">
                                <center><h1 class="main-heading">create account</h1></center>
                                <span  style="display: inline-flex; align-items: center;">
                                    <p style="color: white; margin-right: 70px;">
                                        <input  type="radio" name="type" value="Student"> student</p>
                                     <p style="color: white;">
                                        <input  type="radio" name="type" value="Teacher"> Teacher
                                    </p>
                                </span>
                                <input type="text" placeholder="enter your fullname" name = "name"/>
                                <input type="text" placeholder="enter username" name = "username"/>
                                <input type="text" placeholder="enter your Address" name = "address" />
                                <input type="number" placeholder="enter your mob no." name = "mobile"/>
                                <input type="email" placeholder="enter your email" name = "email"/>                               
			                    <input type="password"placeholder="password" name = "password"/>
                                <input type="password"placeholder="confirmed password" name = "confirmpass"/>
		
				                <button>Create Account</button>
				                
				            </form>
                            
			             </div>
	                </div>
                </div>
                <div class="col-1">
                    
                </div>
            </div>
        </div>
    </div>
    
   
</body>
</html>

