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
  <%@include file="adminheader.jsp" %>    
    <div class="container">
            <h1 style="text-align: center;">Add Property</h1>
          <%
    if(request.getParameter("submitbtn") != null){
        String propid1, location1, budget1, size1;
        propid1 = request.getParameter("propid");
        location1 = request.getParameter("location");
        budget1 = request.getParameter("budget");
        size1 = request.getParameter("size");
                     
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
            try{
                PreparedStatement mystatement = myConnection.prepareStatement("insert into properties (propid, location, budget, size) values(?, ?, ?, ?)");
                mystatement.setString(1, propid1);
                mystatement.setString(2, location1);
                mystatement.setString(3, budget1);
                mystatement.setString(4, size1);

                if (location1 != null && !location1.isEmpty() && budget1.matches("\\d+")) {
                    if(mystatement.executeUpdate() > 0){
                        out.print("<center>Property Added Successfully. </center>");
                    } else {
                        out.print("Error in query. Property not added.");
                    }
                } else {
                    out.print("Invalid input. Please check your data.");
                }
            } catch(Exception e){
                out.print("Error in query due to " + e.getMessage());
            }
        } catch(Exception e){
            out.print("Error in Connection due to " + e.getMessage());
        }
    }
%>

            <form action="" method="post">
               
                
                  <label for="propid"><b>Property Id</b></label>
                  <input type="text" placeholder="Enter Id" name="propid" required>
                  <label for="location"><b>location</b></label>
                  <input type="text" placeholder="Enter Location" name="location" required>
                    <label for="budget"><b>Budget</b></label>
                  <input type="number" placeholder="Enter Budget" name="budget" required>
                  <label for="size"><b>Size</b></label>
                  <input type="text" placeholder="Enter Size" name="size" required>
             
                  <input type="submit" value="addproperty" name="submitbtn"> 
                </div>
               
              </form>
              <div>
                
              </div>
          </div>
      </div>
    </div>
   
  
<%@include file="footer.jsp" %>
</body>
</html>