<%@ page import="java.util.List" %>
<%@ page import="org.example.demosd18312.model.Student" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<c:set var="theLocale"
       value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}"
       scope="session"/>
<fmt:setLocale value="${theLocale}"/>
<fmt:setBundle basename="mylabels"/>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello JSTL" %>
</h1>
<br/>

<%
    List<Student> students = new ArrayList<>();
    students.add(new Student("A", "AA", "a@gmail.com", true));
    students.add(new Student("B", "BB", "b@gmail.com", false));
    students.add(new Student("C", "CC", "c@gmail.com", true));

    pageContext.setAttribute("data", students);
%>

<table border="1">
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Is Passing</th>
    </tr>
    <c:forEach var="tempStudent" items="${data}">
        <tr>
            <td>${tempStudent.firstName}</td>
            <td>${tempStudent.lastName}</td>
            <td>${tempStudent.email}</td>
            <td>${tempStudent.pass}</td>
        </tr>
    </c:forEach>
</table>

<br>

<table border="1">
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Status</th>
    </tr>
    <c:forEach var="tempStudent" items="${data}">
        <tr>
            <td>${tempStudent.firstName}</td>
            <td>${tempStudent.lastName}</td>
            <td>${tempStudent.email}</td>
            <td>
                <c:if test="${tempStudent.pass}">
                    Ok
                </c:if>
                <c:if test="${not tempStudent.pass}">
                    !!!
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>

<br>

<table border="1">
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Status</th>
    </tr>
    <c:forEach var="tempStudent" items="${data}">
        <tr>
            <td>${tempStudent.firstName}</td>
            <td>${tempStudent.lastName}</td>
            <td>${tempStudent.email}</td>
            <td>
                <c:choose>
                    <c:when test="${tempStudent.pass}">Di choi</c:when>
                    <c:otherwise>Hoc lai</c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>


<%--
<c:forEach var="tempStudent" items="${data}">
    <p>${tempStudent}</p>
</c:forEach>
--%>



<%--function tags--%>
<c:set var="str" value="FPoly"/>
<p>Leng of the string <strong>${str}</strong>: ${fn:length(str)}</p>
<p>Uppercase of the string <strong>${str}</strong>: ${fn:toUpperCase(str)}</p>


<%--i18n--%>
<a href="index.jsp?theLocale=en_US">English (US)</a>
 |
<a href="index.jsp?theLocale=es_ES">Spanish (ES)</a>
 |
<a href="index.jsp?theLocale=de_DE">German (DE)</a>
<hr>

<fmt:message key="label.greeting"/> <br>
<fmt:message key="label.firstname"/> <i>John</i><br>
<fmt:message key="label.lastname"/> <i>Doe</i><br>
<fmt:message key="label.welcome"/><br>
<hr>
<p>Selected locale: ${theLocale}</p>
<hr>

<%--upload files--%>
<h3>Upload Images</h3>
<form method="POST" action="UploadServlet" enctype="multipart/form-data">
    <input type="file" name="file">
    <input type="submit" value="Upload">
</form>


<hr>
<img src="${pageContext.request.contextPath}/images/java.png">
<hr>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>
