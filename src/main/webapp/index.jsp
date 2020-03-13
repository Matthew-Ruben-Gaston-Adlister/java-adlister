<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="MYFACE" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <div  class="jumbotron jumbotron-fluid" id="jumbotron"  style="text-align: center">
            <img src="/resources/img/storageunit.png" width="450" height="300" alt="">
            <div class="container">
                <h1 class="display-4">Sell your Junk</h1>
                <p class="lead">Random stuff for sale that you don't need or probably doesnt work</p>
                <p class="lead">Click on MYFACE to see all the ads</p>
            </div>
        </div>
    </div>
</body>
</html>
