<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Testing JSP</title>
</head>
<body>

<h3>Enter some info</h3>

<form action="Processinfo" method="post">
<label>First Name: </label>
<input type="text" name="fname" value="${cust.fName}"><br>
<label>Last Name: </label>
<input type="text" name="lname" value="${cust.lName}"><br>
<label>Street: </label>
<input type="text" name="street" value="${cust.street}"><br>
<label>City: </label>
<input type="text" name="city" value="${cust.city}"><br>
<label>State: </label>
<input type="text" name="state" value="${cust.state}"><br>
<label>Zip Code: </label>
<input type="text" name="zipcode" value="${cust.zipcode}"><br>
<label>Email: </label>
<input type="text" name="email" value="${cust.email}"><br>
<label>Password: </label>
<input type="text" name="password" value="${cust.password}"><br>
<label>Phone: </label>
<input type="text" name="phone" value="${cust.phone}"><br>
<input type="submit" value="Send">
</form>

<%= request.getParameter("passedParam") %><br>

</body>
</html>