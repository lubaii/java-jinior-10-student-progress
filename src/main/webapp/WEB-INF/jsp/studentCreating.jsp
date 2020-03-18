<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <%@ include file="/templates/bootstrap.jsp"%>
        <link rel="stylesheet" href="styles/templates/header.css">
        <link rel="stylesheet" href="styles/studentCreating.css">
        <title>Student creating</title>
    </head>
    <body>
        <%@ include file="/templates/header" %>
        <nav>
            <div id="divNav" class="row">
                <a id="home" href="index.jsp" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
                </a>
                <a id="studentsList" href="studentsList.jsp" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
                </a>
            </div>
        </nav>
        <div id="container">
            <section>
                <div id="containerForm" class="row">
                    <form class="needs-validation was-validated">
                        <div id="titleForm" class="form-group row">
                            Для создания студента заполните все поля и нажмите кнопку "Создать":
                        </div>
                        <div class="form-group row">
                            <label for="surname" class="col-sm-2 col-form-label">Фамилия*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="surname" placeholder="Иванов" required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Имя*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="name" placeholder="Иван" required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="surname" class="col-sm-2 col-form-label">Группа*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="group" placeholder="КТ-21" required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Дата поступления*</label>
                            <div class="col-sm-6">
                                <input type="date" class="form-control" id="receiptDate" required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <div id="divButton" class="col-sm-5">
                                <button type="submit" class="btn btn-outline-secondary btn btn-block">Создать
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
        <%@ include file="/templates/jQuery.jsp"%>
    </body>
</html>