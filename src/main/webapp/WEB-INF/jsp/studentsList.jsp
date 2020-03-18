<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="UTF-8">
        <%@ include file="/templates/bootstrap.jsp" %>
        <link rel="stylesheet" href="styles/templates/header.css">
        <link rel="stylesheet" href="styles/studentsList.css">
        <title>Students list</title>
    </head>
    <body>
        <%@ include file="/templates/header" %>
        <nav>
            <div id="divNav" class="row">
                <a id="home" href="index.jsp" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
                </a>
            </div>
        </nav>
        <div id="container">
            <section>
                <div id="divStudentsList1" class="row">
                    <div class="col-sm-6">
                        <a href="/studentProgress.jsp">
                            <button id="button1" type="button" class="btn btn-outline-secondary btn-lg btn-block">Посмотреть успеваемость выбранного студента</button>
                        </a>
                    </div>
                    <div class="col-sm-6" >
                        <a href="/studentCreating.jsp">
                            <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Создать студента</button>
                        </a>
                    </div>
                </div>
                <div id="divStudentsList2" class="row">
                    <div class="col-sm-6">
                        <a href="/studentModifying.jsp">
                            <button id="button3" type="button" class="btn btn-outline-secondary btn-lg btn-block">Модифицировать выбранного студента</button>
                        </a>
                    </div>
                    <div class="col-sm-6">
                        <a href="/studentsDelete.jsp">
                            <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Удалить выбранных студентов</button>
                        </a>
                    </div>
                </div>
            </section>
            <section id="sectionTable">
                <h5>Список студентов</h5>
                <table id="table" class="table table-bordered table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbxAll" >
                                <label class="custom-control-label" for="cbxAll">Выбрать все</label>
                            </div>
<%--                            <img src="/icons-1.0.0-alpha2/icons/check-box.svg" alt="" width="20" height="20" title="Checkbox">--%>
                        </th scope="col">
                        <th scope="col">#</th>
                        <th scope="col">Фамилия</th>
                        <th scope="col">Имя</th>
                        <th scope="col">Группа</th>
                        <th scope="col">Дата поступления</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbx1">
                                <label class="custom-control-label" for="cbx1"></label>
                            </div>
                        </th>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>КТ-21</td>
                        <td>01.06.2019</td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbx2">
                                <label class="custom-control-label" for="cbx2"></label>
                            </div>
                        </th>
                        <th scope="row">2</th>
                        <td>Tom</td>
                        <td>Thornton</td>
                        <td>КТ-21</td>
                        <td>01.06.2019</td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbx3">
                                <label class="custom-control-label" for="cbx3"></label>
                            </div>
                        </th>
                        <th scope="row">3</th>
                        <td>Jacob</td>
                        <td>Larry</td>
                        <td>КТ-21</td>
                        <td>01.06.2019</td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbx4">
                                <label class="custom-control-label" for="cbx4"></label>
                            </div>
                        </th>
                        <th scope="row">4</th>
                        <td>Mikel</td>
                        <td>Bird</td>
                        <td>КТ-21</td>
                        <td>01.06.2019</td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbx5">
                                <label class="custom-control-label" for="cbx5"></label>
                            </div>
                        </th>
                        <th scope="row">5</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>КТ-21</td>
                        <td>01.06.2019</td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbx6">
                                <label class="custom-control-label" for="cbx6"></label>
                            </div>
                        </th>
                        <th scope="row">6</th>
                        <td>Tom</td>
                        <td>Thornton</td>
                        <td>КТ-21</td>
                        <td>01.06.2019</td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbx7">
                                <label class="custom-control-label" for="cbx7"></label>
                            </div>
                        </th>
                        <th scope="row">7</th>
                        <td>Jacob</td>
                        <td>Larry</td>
                        <td>КТ-21</td>
                        <td>01.06.2019</td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbx8">
                                <label class="custom-control-label" for="cbx8"></label>
                            </div>
                        </th>
                        <th scope="row">8</th>
                        <td>Mikel</td>
                        <td>Bird</td>
                        <td>КТ-21</td>
                        <td>01.06.2019</td>
                    </tr>
                    </tbody>
                </table>
            </section>
        </div>
        <%@ include file="/templates/jQuery.jsp" %>
    </body>
</html>
