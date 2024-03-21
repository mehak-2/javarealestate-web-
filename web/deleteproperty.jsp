<%@ page import="java.sql.*" %>
<%@include file="var.jsp" %>
<%
    String propid = request.getParameter("propid");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection myConnection = DriverManager.getConnection(PATH + PLACE, USERNAME, PASSWORD);
        try {
            // Update foreign key in roommates table
            PreparedStatement updateStatement = myConnection.prepareStatement("UPDATE roommates SET propid=NULL WHERE propid=?");
            updateStatement.setString(1, propid);
            updateStatement.executeUpdate();

            
            PreparedStatement deleteStatement = myConnection.prepareStatement("DELETE FROM properties WHERE propid=?");
            deleteStatement.setString(1, propid);
            deleteStatement.executeUpdate();

            response.sendRedirect("propertieslist.jsp");
        } catch (Exception e) {
            out.print(e);
        }
    } catch (Exception e) {
        out.print(e);
    }
%>
