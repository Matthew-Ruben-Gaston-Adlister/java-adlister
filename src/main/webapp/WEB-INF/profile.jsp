<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, to your profile!</h1>
        <h3>Username: ${sessionScope.user.username}</h3>
        <h3>Email: ${sessionScope.user.email}</h3>
        <a href="/ads/create">Create Ad</a>
        <h2>Here are your ads:</h2>
        <c:forEach var="ad" items="${UserAds}">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <form method="POST" action="/delete">
                    <input type="hidden" id="ad_id" name="ads.ad_id" value="${ads.ad_id}">
                    <input type="submit" class="btn btn-primary btn-block" value="delete">
                </form>
<%--                <a href="/delete"><input type="submit" class="btn btn-primary btn-block" value="delete"></a>--%>
                <a href="/updateAd"><input type="submit" class="btn btn-primary btn-block" value="update"></a>
            </div>
        </c:forEach>
    </div>

</body>
</html>
