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
    <title>Title page</title>
</head>
<body>

<header>
    <div id="containerHeader" class="container-fluid">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2"></div>
                <div id="titleHeader" class="col-sm-8">
                    <h3>Система управления студентами и их успеваемостью</h3>
                </div>
                <div class="col-sm-2">
                    <a id="logout" class="btn btn-link btn btn-sm" href="">
                        <%--<button type="button" class="btn btn-outline-secondary btn-sm">--%>Выйди,${user}<%--</button>--%>
                    </a>
                </div>
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
</body>
</html>
