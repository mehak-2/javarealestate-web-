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
            <h1 style="text-align: center;">Add Roommate</h1>
            <%
            if(request.getParameter("submitbtn")!=null){
                String roommateid1, propid1, name1, age1, gender1, vnonv1, socializingPreferences1, favoriteHobbies1, cleanlinessLevel1;
                roommateid1 = request.getParameter("roommateid");
                propid1 = request.getParameter("propid");
                name1 = request.getParameter("name");
                age1 = request.getParameter("age");
                gender1 = request.getParameter("gender");
                vnonv1 = request.getParameter("vnonv");
                socializingPreferences1 = request.getParameter("socializingPreferences");
                favoriteHobbies1 = request.getParameter("favoriteHobbies");
                cleanlinessLevel1 = request.getParameter("cleanlinessLevel");

                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection myConnection=DriverManager.getConnection(PATH+PLACE,USERNAME, PASSWORD);
                    try{
                        PreparedStatement mystatement = myConnection.prepareStatement("insert into roommates (roommateid, propid, name, age, gender, vnonv, socializingPreferences, favoriteHobbies, cleanlinessLevel) values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
                        mystatement.setString(1, roommateid1);
                        mystatement.setString(2, propid1);
                        mystatement.setString(3, name1);
                        mystatement.setString(4, age1);
                        mystatement.setString(5, gender1);
                        mystatement.setString(6, vnonv1);
                        mystatement.setString(7, socializingPreferences1);
                        mystatement.setString(8, favoriteHobbies1);
                        mystatement.setString(9, cleanlinessLevel1);
                        
                        if (name1 != null && !name1.isEmpty() && age1.matches("\\d+") && Integer.parseInt(age1) >= 18 && Integer.parseInt(age1) <= 60 &&
                            (gender1.equals("Male") || gender1.equals("Female")) && (vnonv1.equals("Veg") || vnonv1.equals("Nonveg"))) {
                            
                            if (mystatement.executeUpdate() > 0) {
                                out.print("<center>Roommate Added Successfully. Now you can login</center>");
                            }
                        } else {
                            out.print("Invalid input. Please check your data.");
                        }
                    } catch (Exception e) {
                        out.print("Error in query due to" + e.getMessage());
                    }
                } catch (Exception e) {
                    out.print("Error in Connection due to  " + e.getMessage());
                }
            }
            %>

            <form action="" method="post">
                
                    <label for="roommateid"><b>Roommate Id</b></label>
                    <input type="text" class="form-control" placeholder="Enter Id" name="roommateid" required>

                    <label for="propid"><b>Property Id</b></label>
                    <input type="text" class="form-control" placeholder="Enter Property Id" name="propid" required>

                    <label for="name"><b>Name</b></label>
                    <input type="text" class="form-control" placeholder="Enter Name" name="name"  required>

                    <label for="age"><b>Age</b></label>
                    <input type="number" class="form-control" placeholder="Enter Age" name="age" required>
                    
                    <label for="gender"><b>Gender</b></label>
                    <select class="form-select" name="gender" required>
                        <option value="" selected disabled>Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                    <br>
                    <label for="vnonv"><b>Veg/Nonveg</b></label>
                    <select class="form-select" name="vnonv" required>
                        <option value="" selected disabled>Select Diet</option>
                        <option value="Veg">Veg</option>
                        <option value="Nonveg">Nonveg</option>
                    </select>
                    <br>
                    <label for="socializingPreferences"><b>Socializing Preferences</b></label>
                    <select class="form-select" name="socializingPreferences" required>
                        <option value="" selected disabled>Select Socializing Preferences</option>
                        <option value="Extremely introverted">Extremely introverted</option>
                        <option value="Somewhat introverted">Somewhat introverted</option>
                        <option value="Balanced">Balanced</option>
                        <option value="Somewhat extroverted">Somewhat extroverted</option>
                        <option value="Extremely extroverted">Extremely extroverted</option>
                    </select>
                    <br>
                    <label for="favoriteHobbies"><b>Favorite Hobbies</b></label>
                    <select class="form-select" name="favoriteHobbies" required>
                        <option value="" selected disabled>Select Favorite Hobbies</option>
                        <option value="Outdoor activities">Outdoor activities (e.g., hiking, biking)</option>
                        <option value="Reading or watching movies">Reading or watching movies</option>
                        <option value="Arts and crafts">Arts and crafts</option>
                        <option value="Gaming">Gaming</option>
                        <option value="Fitness and sports">Fitness and sports</option>
                    </select>
                    <br>
                    <label for="cleanlinessLevel"><b>Cleanliness and Tidiness Level</b></label>
                    <select class="form-select" name="cleanlinessLevel" required>
                        <option value="" selected disabled>Select Cleanliness and Tidiness Level</option>
                        <option value="Neat freak">Neat freak</option>
                        <option value="Moderately tidy">Moderately tidy</option>
                        <option value="Laid back">Laid back</option>
                        <option value="Very laid back">Very laid back</option>
                        <option value="OCD-level cleanliness">OCD-level cleanliness</option>
                    </select>
                    <br>

                    <input type="submit" value="Add Roommate" name="submitbtn"> 
                </div>
            </form>
            <div></div>
        </div> 
      
</div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>
