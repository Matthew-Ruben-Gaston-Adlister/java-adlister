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
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h2>Here are your ads:</h2>
        <c:forEach var="ad" items="${userAds}">
            <div class="col-md-6">
                <%! String link = "/ads/ad?id=";%>
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <a href="<%=link%>${ad.id}">link</a>
            </div>
        </c:forEach>



        </c:forEach>
        <a href="/ads/create">Create Ad</a>
        <h2>Delete Ad</h2>
        <input type="submit" class="btn btn-primary btn-block" value="delete">
    </div>

</body>
</html>
