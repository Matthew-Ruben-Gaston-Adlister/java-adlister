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
    <h1>Here are all the ads!</h1>
    <c:forEach var="ad" items="${ads}">
    <div class="row">
        <div class="col-xs-12 col-md-4 mb-1">
<div class="card" style="width: 18rem;">
        <div class="card-body">
            <%! String link = "/ads/ad?id=";%>
            <h4 class="card-title" >${ad.title}</h4>
            <h6 class="card-text" >${ad.description}</h6>
            <h6 class="card-subtitle mb-2 text-muted" >$${ad.price}</h6>
            <p>Posted by: ${sessionScope.user.username}</p>
            <a href="<%=link%>${ad.id}"><input type="submit" class="btn btn-dark btn-lg" value="View Posting"></a>
        </div>
</div>
</div>
    </div>
    </c:forEach>
    </div>


</body>
</html>
