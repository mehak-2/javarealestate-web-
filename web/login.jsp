<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
     <%@ page import="java.sql.*" %>
     <%@include file="var.jsp" %>
  </head>
   
<body>
  <%@include file="header.jsp" %>
  
   <div class="container">
  <h1>Login</h1>
  <form>
        <%
            if(request.getParameter("submit")!=null){
                String email=request.getParameter("email1");
                String password=request.getParameter("psw");
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection myconnection= DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
                    
                    try{
                        PreparedStatement mystatement=myconnection.prepareStatement("select * from usertable where email=? and password=SHA(?)");
                        mystatement.setString(1, email);
                        mystatement.setString(2, password+SALT);
                        ResultSet myresult=mystatement.executeQuery();
                        if(myresult.next()){
                            if(myresult.getString("usertype").equals("admin")){
                                response.sendRedirect("adminpanel.jsp");
                            }
                            else{
                                if(myresult.getString("usertype").equals("user")){
                                    response.sendRedirect("welcome.jsp");
                                }         
                            }
                            session.setAttribute("name", myresult.getString("name"));
                            session.setAttribute("email", myresult.getString("email"));
                        }
                        else{
                            out.print("<center>Wrong username or password</center>");
                        }
                        
                    }catch(Exception e){
                    out.print("Error in query due to " + e.getMessage());
                }
                }catch(Exception e){
                    out.print("Error in connection due to " + e.getMessage());
                }
                
            }
        %>
         
   <label for="uname"><b>Email Id</b></label>
    <input type="email" placeholder="Enter Email Id" name="email1" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
    <br>

    <input type="submit" value="Login" name="submit">
    <br><br>
    <a href="register.jsp">Register</a>
 </form>
   </div>
           
<%@include file="footer.jsp" %>
</body>
</html>