<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ page import="java.sql.*" %>
    <%@include file="var.jsp" %>
</head>
<body>
    <%@include file="adminheader.jsp" %>
    <div class="container">
            <h1 style="text-align: center;">Add Room </h1>
         <%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
    try {
        if (request.getParameter("submitbtn") != null) {
            String roomno1, propid1, sd1, vnonv1, aca1;
            roomno1 = request.getParameter("roomno");
            propid1 = request.getParameter("propid");
            sd1 = request.getParameter("sd");
            vnonv1 = request.getParameter("vnonv");
            aca1 = request.getParameter("aca");

            PreparedStatement mystatement = myConnection.prepareStatement("INSERT INTO room (room_no, prop_id, sd, vnonv, aca) VALUES (?, ?, ?, ?, ?)");
            mystatement.setString(1, roomno1);
            mystatement.setString(2, propid1);
            mystatement.setString(3, sd1);
            mystatement.setString(4, vnonv1);
            mystatement.setString(5, aca1);

            if (roomno1 != null && !roomno1.isEmpty() && propid1 != null && !propid1.isEmpty() && sd1 != null && !sd1.isEmpty() &&
                vnonv1 != null && !vnonv1.isEmpty() && aca1 != null && !aca1.isEmpty()) {
                if (mystatement.executeUpdate() > 0) {
                    out.print("<center>Room Added Successfully.</center>");
                } else {
                    out.print("Error in query. Room not added.");
                }
            } else {
                out.print("Invalid input. Please check your data.");
            }
        }
    } catch (Exception e) {
        out.print("Error in query due to " + e.getMessage());
    }
} catch (Exception e) {
    out.print("Error in Connection due to " + e.getMessage());
}
%>

            <form action="" method="post">
        
                    <label for="roomid"><b>Room Id</b></label>
                    <input type="text" placeholder="Enter Room Id" name="roomid" required>

                    <label for="roomno"><b>Room Number</b></label>
                    <input type="text" placeholder="Enter Room Number" name="roomno" required>

                    <label for="propid"><b>Property Id</b></label>
                    <input type="text" placeholder="Enter Property Id" name="propid" required>
               
                    <label for="sd"><b>Type </b></label>
                    <select class="form-select" name="sd" required>
                        <option value="" selected disabled>Select Room</option>
                        <option value="Occupied">Single</option>
                        <option value="Non Occupied">Double</option>
                    </select>
                    <br>
                    <label for="vnonv"><b>Veg/Nonveg</b></label>
                    <select class="form-select" name="vnonv" required>
                        <option value="" selected disabled>Select Diet</option>
                        <option value="Veg">Veg</option>
                        <option value="Nonveg">Nonveg</option>
                    </select>
                    <br>
                    <label for="aca"><b>Occupied or Non Occupied</b></label>
                    <select class="form-select" name="aca" required>
                        <option value="" selected disabled>Select Room Occupancy</option>
                        <option value="Occupied">Occupied</option>
                        <option value="Non Occupied">Non Occupied</option>
                    </select>
                    <br>
                    <input type="submit" value="Add Room" name="submitbtn"> 
                </div>
            </form>
            <div></div>
        </div>
    </main>

    <p>We are a diverse, caring community of donors and recipients, driven by the shared vision of making healthcare accessible to all through medicine donations.</p>
    </div>
    </div>

    <%@include file="footer.jsp" %>
</body>
</html>
