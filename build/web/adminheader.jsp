<%
if(session.getAttribute("name")==null){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Real Estate</title>
</head>
<body>
<nav>
  <h1>Real Estate</h1>
  <ul class="nav-ul">
    <li><a href="index.jsp">Home</a></li>
    <li><a href="about.jsp">About</a></li>
    <li><a href="contact.jsp">Contact</a></li>
    <li>
      <select onchange="location = this.value;">
        <option value="" selected disabled>Add</option>
        <option value="addproperty.jsp">Add Property</option>
        <option value="addroommate.jsp">Add Roommate</option>
        <option value="addroom.jsp">Add Room</option>
        <option value="propertieslist.jsp">Properties List</option>
        <option value="roommateslist.jsp">Roommates List</option>
        
      </select>
    </li>
    <li>
      <% if(session.getAttribute("name")==null){ %>
      <a class="btnn" href="login.jsp">Login/Register</a>
      <% } else { %>
      <a  href="logout.jsp">Logout</a>
      <% } %>
    </li>
  </ul>
</nav>
<hr />
</body>
</html>
