<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
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
    <br>
    <br>
    <br>
    <h1>Here are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">

        <div class="col-md-6">
            <%! String link = "/ads/ad?id=";%>
            <h4>${ad.title}</h4>
            <h6>${ad.description}</h6>
            <h6>$${ad.price}</h6>
            <p>Posted by: ${sessionScope.user.username}</p>
            <a href="<%=link%>${ad.id}"><input type="submit" class="btn btn-dark btn-lg" value="View Posting"></a>
        </div>
    </c:forEach>
</div>

</body>
</html>
