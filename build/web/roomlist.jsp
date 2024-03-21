<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Room List</title>
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

        select {
            padding: 5px;
            width: 100px;
        }

        .veg {
            display: none;
        }
    </style>
    <%@page import="java.sql.*" %>
    <%@include file="var.jsp" %>
</head>
<body>
<%@include file="adminheader.jsp" %>
<center><h1 style="margin-top: 8%;">Rooms List</h1></center>
<select id="dietSelect">
    <option value="all">All</option>
    <option value="Veg">Veg</option>
    <option value="Nonveg">Non-veg</option>
</select>
<table id="roomTable">
    <tr>
        <th scope="col">S no.</th>
        <th scope="col">Room ID</th>
        <th scope="col">Room Number</th>
        <th scope="col">Property ID</th>
        <th scope="col">Single/Double</th>
        <th scope="col">Veg/Non-veg</th>
        <th scope="col">Occupied/Non-Occupied</th>
        <th scope="col">Add Roommate</th>
        <th scope="col">Delete</th>
    </tr>
    <%
    int sno = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
        try {
            PreparedStatement mystatement = myConnection.prepareStatement("SELECT * FROM room");
            ResultSet myresult = mystatement.executeQuery();

            while (myresult.next()) {
                sno = sno + 1;
    %>
    <tr class="<%= myresult.getString("vnonv") %>">
        <td><%=sno%></td>
        <td><%=myresult.getString("room_id")%></td>
        <td><%=myresult.getString("room_no")%></td>
        <td><%=myresult.getString("prop_id")%></td>
        <td><%=myresult.getString("sd")%></td>
        <td><%=myresult.getString("vnonv")%></td>
        <td><%=myresult.getString("aca")%></td>
        <td><a href="addroommate.jsp?room_id=<%=myresult.getString("room_id")%>"><i class='fas fa-edit' style='color: black;'></i></a></td>
        <td><a href="deleteroom.jsp?room_id=<%=myresult.getString("room_id")%>"><i class='fa-solid fa-trash-can' style='color: red;' ></i></a></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.print("<label>" + "Error in query due to" + e.getMessage() + "</label>");
        }
    } catch (Exception e) {
        out.print("<label>" + "Error in Connection due to" + e.getMessage() + "</label>");
    }
    %>
</table>
<%@include file="footer.jsp"%>

<script>
    document.getElementById('dietSelect').addEventListener('change', function() {
        const diet = this.value;
        const rows = document.querySelectorAll('#roomTable tr');
        rows.forEach(row => {
            if (diet === 'all') {
                row.style.display = 'table-row';
            } else {
                const dietClass = row.classList.contains(diet);
                row.style.display = dietClass ? 'table-row' : 'none';
            }
        });
    });
</script>
</body>
</html>
