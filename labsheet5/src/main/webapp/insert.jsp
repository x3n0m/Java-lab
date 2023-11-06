<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#ffffcc">
<font size="+3" color="green"><br>Welcome to Presidency University !</font>
<FORM action="insert.jsp" method="get">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >
<TR>
<TH width="50%">Employee No:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="eno"></TD>
</tr>
<TR>
<TH width="50%">Employee Name</TH>
<TD width="50%"><INPUT TYPE="text" NAME="name"></TD>
</tr>
<tr>
<TH width="50%">Employee Gender</TH>
<TD width="50%"><INPUT TYPE="text" NAME="gender"></TD>
</tr>
<tr>
<TH width="50%">Employee Department</TH>
<TD width="50%"><INPUT TYPE="text" NAME="dept"></TD>
</tr>
<tr>
<TH width="50%">Employee Salary</TH>
<TD width="50%"><INPUT TYPE="text" NAME="salary"></TD>
</tr>
<TR>
<TH></TH>
<TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
</tr>
</TABLE>
<%
int uq=0;
try {
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/javalab?characterEncoding=latin1","sammy","password");
PreparedStatement pstatement = con.prepareStatement("INSERT INTO employees VALUES(?, ?, ?, ?, ?)");
pstatement.setInt(1, Integer.valueOf(request.getParameter("eno")));
pstatement.setString(2, request.getParameter("name"));
pstatement.setString(3, request.getParameter("gender"));
pstatement.setString(4, request.getParameter("dept"));
pstatement.setFloat(5, Float.valueOf(request.getParameter("salary")));
uq=pstatement.executeUpdate();
pstatement.close();
con.close();
}
catch(Exception ex) { 
System.out.println(ex);
}
if (uq != 0) {
%>
<br>
<TABLE style="background-color: #E3E4FA;" 
WIDTH="30%" border="1">
<tr><th>Data is inserted successfully in database.</th></tr>
</table>
<%
} %> 
</form> 
</body>
</html>
</body>
</html>