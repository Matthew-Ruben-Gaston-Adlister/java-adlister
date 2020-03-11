<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
    <title>Ad</title>
</head>
<body>
<c:choose>
    <c:when test="${sessionScope.user.username != null}">
        <jsp:include page="/WEB-INF/partials/navbarLoggedIn.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    </c:otherwise>
</c:choose>

    <h1>Here is the ad!</h1>
<div class="container" style="margin-top: 5em">
    <c:forEach var="ad" items="${UserAds}">
        <div>
            <c:if test="${ad.id == sessionScope.id}">
                <p>${ad.title}</p>
                <p>${ad.description}</p>
                <form action="/delete" method="post">
                    <input type="hidden" name="ad_id" value="${ad.id}">
                    <input class="btn btn-danger btn-sm" type="submit" name="deleteBtn" value="Delete">
                </form>
                <form action="/updateAd" method="post">
                    <input type="hidden" name="other" value="${ad.id}">
                    <input class="btn btn-warning btn-sm" name="updateBtn" type="submit" value="Update">
                </form>
            </c:if>
        </div>
    </c:forEach>

<%--    <c:forEach var="category" items="${adCategory}">--%>
<%--        <div>--%>
<%--            <p>${category.name}</p>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>

</div>
</body>
</html>