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
<div class="card" style="width: 18rem;">
    <c:forEach var="ad" items="${UserAds}">
        <div class="card-body">
            <c:if test="${ad.id == sessionScope.id}">
                <h4 class="card-title">${ad.title}</h4>
                <h6 class="card-text" >${ad.description}</h6>
                <h6 class="card-subtitle mb-2 text-muted" >$${ad.price}</h6>
                <p>Posted by: ${sessionScope.user.username}</p>
                <form action="/delete" method="post">
                    <input type="hidden" name="ad_id" value="${ad.id}">
                    <input class="btn btn-dark btn-sm" type="submit" name="deleteBtn" value="Delete">
                </form>
                <form action="/updateAd" method="post">
                    <input type="hidden" name="other" value="${ad.id}">
                    <input class="btn btn-dark btn-sm" name="updateBtn" type="submit" value="Update">
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