<%@ page import="java.sql.*" %>
<%@include file="var.jsp" %>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
    try {
        PreparedStatement deleteStatement = myConnection.prepareStatement("DELETE FROM roommates");
        int rowsAffected = deleteStatement.executeUpdate();
        out.print(rowsAffected + " rows deleted."); 

        response.sendRedirect("roommateslist.jsp");
    } catch (Exception e) {
        out.print("Error in delete operation: " + e.getMessage());
    }
} catch (Exception e) {
    out.print("Error in database connection: " + e.getMessage());
}
%>
