<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <title>Edit Profile</title></head>
<body>
<c:choose>
    <c:when test="${sessionScope.user.username != null}">
        <jsp:include page="/WEB-INF/partials/navbarLoggedIn.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
    </c:otherwise>
</c:choose>

<div class="jumbotron jumbotron-fluid" style="margin-top: 3em">
    <div class="container">
        <h1 class="display-4">Edit your profile!</h1>
        <form action="/update" method="POST">
            <div class="form-group">
                <label for="updateName">Edit Username: </label>
                <input id="updateName" name="updateName" class="form-control" type="text"
                       value="${sessionScope.user.username}">
            </div>
            <div class="form-group">
                <label for="updateEmail">Edit Email: </label>
                <input id="updateEmail" name="updateEmail" class="form-control" type="text"
                       value="${sessionScope.user.email}">
            </div>
            <div class="form-group">
                <label for="updatePassword">Create New Password: </label>
                <input id="updatePassword" name="updatePassword" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="checkUpdate">Confirm New Password: </label>
                <input id="checkUpdate" name="checkUpdate" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Update Profile">
        </form>
    </div>
</div>

</body>
</html>