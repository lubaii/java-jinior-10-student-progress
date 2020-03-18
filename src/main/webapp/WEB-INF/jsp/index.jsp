<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <%@ include file="/templates/bootstrap.jsp"%>
        <link rel="stylesheet" href="styles/templates/header.css">
        <link rel="stylesheet" href="styles/index.css">
        <title>Title page</title>
    </head>
    <body>
        <%@ include file="/templates/header" %>
        <div id="container">
            <nav>
                <div id="navHeader" class="row">
                    <div class="col-sm-4">
                        <a href="/studentsList.jsp">
                            <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Студенты</button>
                        </a>
                    </div>
                    <div class="col-sm-4">
                        <a href="/disciplinesList.jsp">
                            <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Дисциплины</button>
                        </a>
                    </div>
                    <div class="col-sm-4">
                        <a href="/termsList.jsp">
                            <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Семестры</button>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <%@ include file="/templates/jQuery.jsp"%>
    </body>
</html>