<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="./recourses/css/templates/header.css">

    <link rel="stylesheet" href="./recourses/css/index.css">

    <script src="/recourses/js/fucnctions.js"type="text/javascript"></script>

    <link href="http://fonts.googleapis.com/css?family=Lobster&display=swap&subset=cyrillic" rel="stylesheet">


    <title>Title page</title>
</head>
<body>

<header>
    <div id="containerHeader" class="container-fluid">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2"></div>
                <div id="titleHeader" class="col-sm-8">
                    <h3 class="name1">Система управления студентами и их успеваемостью</h3>
                    <ul class="astra">
                        <li class="luh"></li>
                        <li class="luh"></li>
                        <li class="luh"></li>
                        <li class="luh"></li>
                    </ul>
                </div>
                <c:if test="${currentPage ne '/WEB-INF/jsp/login.jsp'}"><%-- чтобы не отображалась кнопка "выйди" в логине--%>
                <div class="col-sm-2logout">
                    <a id="logout" class="btn btn-link btn btn-sm" href="/logout">   <%--чтобы не отображалась кнопка выдйди--%>

                     Выйди,${user}
                    </a>
                </div>
                </c:if>
            </div>
        </div>
    </div>
</header>

<jsp:include page="${currentPage}" flush="true" />


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(function () {

$("#receiptDate").datepicker(
{
dateFormat: "dd/mm/yy"

}

).val();
});
</script>



</body>
</html>
