<%@ page import="java.sql.*" %>
<%@ include file="var.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
<%@ include file="adminheader.jsp" %>

<%
String propid = request.getParameter("propid");
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
    try {
        PreparedStatement mystatement = myConnection.prepareStatement("SELECT * FROM properties WHERE propid=?");
        mystatement.setString(1, propid);
        ResultSet myresult = mystatement.executeQuery();

        if (myresult.next()) {
%>
   <div class="container">
<form action="" method="post">
     
        <label for="propid"><b>Property Id</b></label>
        <input type="text" placeholder="Enter Id" name="propid" value="<%= myresult.getString("propid") %>" required>
        <label for="location"><b>Location</b></label>
        <input type="text" placeholder="Enter Location" name="location" value="<%= myresult.getString("location") %>" required>
        <label for="budget"><b>Budget</b></label>
        <input type="number" placeholder="Enter Budget" name="budget" value="<%= myresult.getString("budget") %>" required>
        <label for="size"><b>Size</b></label>
        <input type="text" placeholder="Enter Size" name="size" value="<%= myresult.getString("size") %>" required>
        <input type="submit"  value="Update Property" name="updatebtn">
    </div>
</form>
<%
if (request.getParameter("updatebtn") != null) {
    String budget1 = request.getParameter("budget");
    String location1 = request.getParameter("location");
    String size1 = request.getParameter("size");
    
    try {
        PreparedStatement updateStatement = myConnection.prepareStatement("UPDATE properties SET budget=?, location=?, size=? WHERE propid=?");
        updateStatement.setString(1, budget1);
        updateStatement.setString(2, location1);
        updateStatement.setString(3, size1);
        updateStatement.setString(4, propid);

        if (updateStatement.executeUpdate() > 0) {
            out.print("Property Updated successfully");
        } else {
            out.print("Error Occurred. Try again later");
        }
    } catch (Exception e) {
        out.print("Error in Query due to " + e.getMessage());
    }
}
%>
<div>
  
</div>
<%@ include file="footer.jsp" %>
<%
        }
    } catch (Exception e) {
        out.print("Error in Query due to " + e.getMessage());
    }
} catch (Exception e) {
    out.print("Error in Connection due to " + e.getMessage());
}
%>
</body>
</html>
