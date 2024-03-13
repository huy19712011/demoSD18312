
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Student List</title>
</head>
<body>
    <h2>Students</h2>
    <c:forEach var="tempStudent" items="${studentList}">
        <h4>${tempStudent}</h4>
    </c:forEach>
</body>
</html>
