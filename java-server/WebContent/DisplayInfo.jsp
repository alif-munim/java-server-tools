<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello</title>
</head>
<body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h3>Thanks for the Info!</h3>
<label>First Name: </label>
${cust.fName}<br>
<label>Last Name: </label>
${cust.lName}<br>
<label>Phone: </label>
${cust.phone}<br>

<c:if test="${cust.fName.equals('Alif')}">
	<p>Hi Alif</p>
</c:if>

<c:out value="Calculate"/><br>
5 + 4 = <c:out value="${5 + 4}"/><br>
<c:out value="${cust.fName}"/><br>

<c:set var="dogName" scope="session" value="Spot"/>
<c:out value="${dogName}"/><br>
<c:remove var="dogName"/>

<c:set var="age" scope="session" value="8"/>
<c:choose>
	<c:when test="${(age >= 5) && (age <= 6)}">
		Go to KinderGarten<br>
	</c:when>
	<c:when test="${(age >= 7) && (age <= 13)}">
		Go to Middle School<br>
	</c:when>
	<c:when test="${(age >= 14) && (age <= 18)}">
		Go to High School<br>
	</c:when>
	<c:otherwise>
		Stay Home<br>
	</c:otherwise>
</c:choose>

<c:forEach var="i" begin="1" end="5" step="2">
	<c:out value="${i }"/><br>
</c:forEach>

<c:forTokens items="Tom,Sue,Ed" delims="," var="x">
	<c:out value="${x }"/><br>
</c:forTokens>

<c:catch var="divideByZeroException">
	<% int ans = 2/0; %>
</c:catch>

<c:if test="${divideByZeroException != null}">
	Exception: ${divideByZeroException }<br>
</c:if>

<c:url value="index.jsp" var="theURL">
	<c:param name="passedParam" value="passed value"/>
</c:url>

<c:import url="${theURL }"/><br>



<h3>More Stuff</h3>
<c:set var="str1" value="a random string"/>
<c:set var="arr1" value="${fn:split(str1,' ') }"/>
<c:set var="str2" value="${fn:join(arr1,' ')  }"/>



Length: ${fn:length(str2)}<br>
<c:set var="str2" value="${fn:trim(str2)}" />
String: ${str2}<br>
<c:if test="${fn:contains(str2, 'random')}">
	Index: ${fn:indexOf(str2, 'random')}<br>
	<c:set var="str2" value="${fn:replace(str2,'random', 'special')}"/>
	<c:set var="str3" value="${fn:substring(str2,2,9)}"/>
	<c:set var="str3" value="${fn:toUpperCase(str3)}"/>
	String: ${str3}<br>
</c:if>


<h3>Formatting</h3>
<fmt:requestEncoding value="UTF-8"/>
<fmt:setLocale value="en_US"/>
<c:set var="nowTime" value="<%=new java.util.Date() %>"/>

Date: <fmt:formatDate value="${nowTime}"
	type="BOTH" timeStyle="LONG" dateStyle="LONG"/><br>
	
<fmt:setTimeZone value="GMT"/>	

Date: <fmt:formatDate value="${nowTime}"
	type="BOTH" timeStyle="LONG" dateStyle="LONG"/><br>
	
Custom Date: <fmt:formatDate 
pattern="hh:mm:ss:SS a z E MMM dd yyyy G"
value="${nowTime}" dateStyle="LONG"/><br>

<c:set var="val1" value="5000.89"/>
<fmt:parseNumber var="val2" type="NUMBER" value="${val1}"/>
Number: <c:out value="${val2}"/><br>

<fmt:setLocale value="fr_FR"/>
<fmt:formatNumber value="${val2}" type="CURRENCY"/><br>
<fmt:formatNumber value="${val2}" type="PERCENT"/><br>

</body>
</html>