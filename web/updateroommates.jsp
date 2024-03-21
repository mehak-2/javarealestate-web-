<%@ page import="java.sql.*" %>
<%@ include file="var.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Roommate</title>
</head>
<body>
    <%@ include file="adminheader.jsp" %>
      <div class="container">
    <center><h1 style="margin-top: 8%;">Update Roommate</h1></center>
    <%
    String propid = request.getParameter("propid");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
        try {
            PreparedStatement mystatement = myConnection.prepareStatement("SELECT * FROM roommates WHERE propid=?");
            mystatement.setString(1, propid);
            ResultSet myresult = mystatement.executeQuery();

            if (myresult.next()) {
    %>
    <form action="" method="post">
                <label for="roommateid"><b>Roommate ID</b></label>
                <input type="text" placeholder="Enter Roommate ID" name="roommateid" value="<%= myresult.getString("roommateid") %>" readonly>
                <label for="propid"><b>Property ID</b></label>
                <input type="text" placeholder="Enter Property ID" name="propid" value="<%= myresult.getString("propid") %>" readonly>
                <label for="name"><b>Name</b></label>
                <input type="text" placeholder="Enter Name" name="name" value="<%= myresult.getString("name") %>" required>
                <label for="age"><b>Age</b></label>
                <input type="number" placeholder="Enter Age" name="age" value="<%= myresult.getString("age") %>" required>
                <label for="gender"><b>Gender</b></label>
                <input type="text" placeholder="Enter Gender" name="gender" value="<%= myresult.getString("gender") %>" required>
                <label for="vnonv"><b>Veg/Non Veg</b></label>
                <input type="text" placeholder="Enter Veg/Non Veg" name="vnonv" value="<%= myresult.getString("vnonv") %>" required>
                <input type="submit" value="Update Roommate" name="updatebtn">
            </div>
        </main>
    </form>
    <%
if (request.getParameter("updatebtn") != null) {
    String roommateid = request.getParameter("roommateid");
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String gender = request.getParameter("gender");
    String vnonv = request.getParameter("vnonv");

    try {
        PreparedStatement updateStatement = myConnection.prepareStatement("UPDATE roommates SET name=?, age=?, gender=?, vnonv=? WHERE roommateid=?");
        updateStatement.setString(1, name);
        updateStatement.setInt(2, age);
        updateStatement.setString(3, gender);
        updateStatement.setString(4, vnonv);
        updateStatement.setString(5, roommateid);

        if (updateStatement.executeUpdate() > 0) {
            out.print("Roommate Updated successfully");
        } else {
            out.print("Error Occurred. Try again later");
        }
    } catch (Exception e) {
        out.print("Error in Query due to " + e.getMessage());
    }
}
    %>
    <%
            }
        } catch (Exception e) {
            out.print("Error in Query due to " + e.getMessage());
        }
    } catch (Exception e) {
        out.print("Error in Connection due to " + e.getMessage());
    }
    %>
    <div>
      
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
