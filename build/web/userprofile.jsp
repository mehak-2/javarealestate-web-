<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Real Estate</title>
</head>
<body>
    <%@include file="userheader.jsp" %>
<%@include file="var.jsp" %>
    <br>
    <br>
    
    <br><br>
  <div class="container">
        <h1>User Profile</h1>
        <strong><label for="name">Name:</label></strong>
        <%
            if(session.getAttribute("name") != null){
                out.print(session.getAttribute("name").toString());
            }
        %><br><br>
        <strong><label for="email">Email:</label></strong>
        <%
            if(session.getAttribute("email") != null){
                out.print(session.getAttribute("email").toString());
            }
        %><br><br>
      
    </div>
   
    <%@include file="footer.jsp" %>
</body>
</html>