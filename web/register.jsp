<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
 <%@page import="java.sql.*" %>
    <%@include file="var.jsp" %>
</head>
<body>
    <%@include file="header.jsp"%>
          <br>
                <h1 class="text-red-400 mt-8 text-2xl">REGISTER NOW</h1>

             <div class="container">
          <%
                if(request.getParameter("submitbtn")!=null){
                    String name1,email1, password1, password2;
                    name1 = request.getParameter("uname");
                    email1 = request.getParameter("email");
                    password1 = request.getParameter("psw1");
                     password2 = request.getParameter("psw2");
                     if(password1.equals(password2))
                     {
                         try{
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection myConnection=DriverManager.getConnection(PATH+PLACE,USERNAME, PASSWORD);
                                try{
                                    PreparedStatement mystatement = myConnection.prepareStatement("insert into usertable (name, email, password, usertype) values(?, ?, SHA(?),?)");
                                    mystatement.setString(1, name1);
                                    mystatement.setString(2, email1);
                                    mystatement.setString(3, password1 + SALT);
                                    mystatement.setString(4, "user");
           
                                    if(mystatement.executeUpdate()>0)
                                    {
                                       out.print("<center>Registerd Succesfully. Now you can login</center>"); 
                                    }
                                }
                                     catch(Exception e){
                                    out.print("Error in query due to"+e.getMessage());
                                }
                            } catch(Exception e){
                            out.print("Error in Connection due to  "+e.getMessage());
                            }   
                        }
                        else {
                            out.print("Password does not match. Please try again");
                        }
                    }
                    
                %>
           <form action="#">
    <label for="uname"><b>Name</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>
    <label for="email"><b>Email Id</b></label>
    <input type="email" placeholder="Enter Email Id" name="email" required>
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw1" required>
    <label for="psw"><b>Confirm Password</b></label>
    <input type="password" placeholder="Enter Confirm Password" name="psw2" required>
    <input type="submit" value="Register" name="submitbtn">
    <br><br>
     <a href="login.jsp">Login</a>
  </form>
      </div>
              
 <%@include file="footer.jsp"%>
</body>
</html>