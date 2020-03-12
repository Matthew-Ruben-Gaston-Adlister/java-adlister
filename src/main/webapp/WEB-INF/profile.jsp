<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <title>Your Profile</title>
</head>
<body>
<c:choose>
    <c:when test="${sessionScope.user.username != null}">
        <jsp:include page="/WEB-INF/partials/navbarLoggedIn.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
    </c:otherwise>
</c:choose>

<div class="container">
    <h1>Welcome, to your profile ${sessionScope.user.username}!</h1>
    <h4>Email: ${sessionScope.user.email}</h4>
    <a href="/update"><input type="submit" class="btn btn-primary btn-lg" value="Edit Profile"></a>
    <h2>Here are your created ads:</h2>
    <c:forEach var="ad" items="${UserAds}">
        <div>
            <%! String link = "/ads/ad?id=";%>
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <a href="<%=link%>${ad.id}"><input type="submit" class="btn btn-primary btn-lg" value="View Posting"></a>
        </div>
    </c:forEach>
</div>

<%--<button type="button" class="btn btn-primary btn-lg">Large button</button>--%>
<%--<button type="button" class="btn btn-secondary btn-lg">Large button</button>--%>

</body>
</html>
