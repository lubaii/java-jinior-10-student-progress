<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <%@ include file="/templates/bootstrap.jsp"%>
        <link rel="stylesheet" href="styles/templates/header.css">
        <link rel="stylesheet" href="styles/termsList.css">
        <title>Disciplines list</title>
    </head>
    <body>
        <%@ include file="/templates/header" %>
        <nav>
            <div id="divNav" class="row">
                <a id="home" href="index.jsp" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
                </a>
                <a id="studentsList" href="studentsList.jsp" class="nav" hidden>
                    <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
                </a>
            </div>
        </nav>
        <div id="container">
            <section>
                <div id="titleTermsList" class="row">
                        <div class="form">
                            <div class="form-row">
                                <div id="divFormTitle" class="form-group col-sm-4">
                                    <h5>Выбрать семестр:</h5>
                                </div>
                                <div class="form-group col-sm-3">
                                    <select type="text" id="select" class="form-control">
                                        <option selected>Семестр 1</option>
                                        <option>Семестр 2</option>
                                        <option>Семестр 3</option>
                                        <option>Семестр 4</option>
                                        <option>Семестр 5</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-3">
                                    <button type="submit" id="btn" class="btn btn-outline-secondary">Выбрать</button>
                                </div>
                            </div>
                            <div id="divDurationTerm" class="row">
                                <h5><div class="col-sm-12">Длительность семестра: <b> 4.8 </b>недели.</div></h5>
                            </div>
                        </div>
                    </div>
            </section>
            <section id="sectionBody">
                <div class="row">
                    <div class="col-sm-7">
                        <h5>Список дисциплин семестра:</h5>
                        <table id="table" class="table table-bordered table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Наименование дисциплины</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Информатика</td>
                            </tr>
                            <tr>
                                <td>Системный анализ</td>
                            </tr>
                            <tr>
                                <td>Управление проектами</td>
                            </tr>
                            <tr>
                                <td>Основы Дискретной Математики</td>
                            </tr> <tr>
                                <td>Высшая математика</td>
                            </tr>
                            <tr>
                                <td>История Науки и Техники</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-sm-5">
                        <section>
                            <div id="divTermsList1" class="row">
                                <div class="divTermsList col-sm-12">
                                    <a href="/termCreating.jsp">
                                        <button id="button1" type="button" class="btn btn-outline-secondary btn-lg btn-block">Создать дисциплину</button>
                                    </a>
                                </div>
                            </div>
                            <div id="divTermsList2" class="row">
                                <div class="divTermsList col-sm-12" >
                                    <a href="/termModifying.jsp">
                                        <button id="button2" type="button" class="btn btn-outline-secondary btn-lg btn-block">Модифицировать выбранную дисциплину</button>
                                    </a>
                                </div>
                            </div>
                            <div id="divTermsList3" class="row">
                                <div class="divTermsList3 col-sm-12">
                                    <a href="#">
                                        <button id="button3" type="button" class="btn btn-outline-secondary btn-lg btn-block">Удалить выбранную дисциплину</button>
                                    </a>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </section>
        </div>
        <%@ include file="/templates/jQuery.jsp"%>
    </body>
</html>