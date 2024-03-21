<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Document</title>
       <style>
   body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0px;
            background-color: #f0f0f0;
            min-height: 100vh;
        }

        table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
            margin-top: 5%;
            margin-bottom: 10%;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: grey;
            color: white;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
    <%@page import="java.sql.*" %>
    <%@include file="var.jsp" %>
</head>
<body>
    <%@include file="adminheader.jsp" %>
    <center><h1 style="margin-top: 8%;">Properties List</h1></center>
    <table> 
        <tr>
            <th scope="col">S no.</th>
            <th scope="col">Property ID</th>
            <th scope="col">Location</th>
            <th scope="col">Budget</th>
            <th scope="col">Size</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>
        </tr>
        <%
            int sno = 0;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection myConnection=DriverManager.getConnection(PATH+PLACE, USERNAME, PASSWORD);
                try {
                    PreparedStatement mystatement = myConnection.prepareStatement("SELECT * FROM properties");
                    ResultSet myresult=mystatement.executeQuery();

                    while(myresult.next()) {
                        sno=sno+1;
        %>
        <tr>
            <td><%=sno%></td>
            <td><%=myresult.getString("propid")%></td>
            <td><%=myresult.getString("location")%></td>
            <td><%=myresult.getString("budget")%></td>
            <td><%=myresult.getString("size")%></td>
          <td><a href="updateproperty.jsp?propid=<%=myresult.getString("propid")%>"><i class='fas fa-edit' style='color: black;'></i></a></td>
             <td><a href="deleteproperty.jsp?propid=<%=myresult.getString("propid")%>"><i class='fa-solid fa-trash-can' style='color: red;'></i></a></td>
        </tr>
        <%
                    }
                } catch(Exception e) {
                    out.print("<label>"+"Error in query due to"+e.getMessage()+"</label>");
                }
            } catch(Exception e) {
                out.print("<label>"+"Error in Connection due to"+e.getMessage()+"</label>");
            } 
        %>
    </table>
    <%@include file="footer.jsp"%>
</body>
</html>
