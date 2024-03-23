<%@ page import="java.sql.*" %>
<%@include file="var.jsp" %>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
    try {
        String roomNo = request.getParameter("room_no"); 

        if (roomNo != null && !roomNo.isEmpty()) {
            PreparedStatement deleteStatement = myConnection.prepareStatement("DELETE FROM room WHERE room_no=?");
            deleteStatement.setString(1, roomNo);

            int rowsAffected = deleteStatement.executeUpdate();
            out.print(rowsAffected + " rows deleted.");

            response.sendRedirect("roomlist.jsp"); 
        } else {
            out.print("Invalid room number. Please provide a valid room number.");
        }
    } catch (SQLException e) {
        out.print("SQL Error in delete operation: " + e.getMessage());
    }
} catch (ClassNotFoundException e) {
    out.print("Error loading JDBC driver: " + e.getMessage());
} catch (SQLException e) {
    out.print("Error in database connection: " + e.getMessage());
}
%>
