<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jstl/fmt" %>
<%--<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/xml" %>--%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
    $( function() {
        $( "#receiptDate" ).datepicker();
    } );
</script>

        <nav>
            <div id="divNav" class="row">
                <a id="home" href="/" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
                </a>
            </div>
        </nav>
        <div id="container">
            <section>
                <div id="divStudentsList1" class="row">
                    <div class="col-sm-6">
<%--
                        <a href="/student-progress">
--%>                            <a onclick="progressStudentes()">
                            <button id="button1" type="button" class="btn btn-outline-secondary btn-lg btn-block">Посмотреть успеваемость выбранного студента</button>
                        </a>
                    </div>
                    <div class="col-sm-6" >
                        <a href="/student-create">
                            <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Создать студента</button>
                        </a>
                    </div>
                </div>
                <div id="divStudentsList2" class="row">
                    <div class="col-sm-6">
                        <a onclick="modyfyStudentes()">
                            <button id="button3" type="button" class="btn btn-outline-secondary btn-lg btn-block">Модифицировать выбранного студента</button>
                        </a>
                    </div>

                    <div class="col-sm-6">
                        <a onclick="deleteStudents()">
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
                        <th scope="col">Фамилия</th>
                        <th scope="col">Имя</th>
                        <th scope="col">Группа</th>
                        <th scope="col">Дата поступления</th>
                    </tr>
                    </thead>
                    <%--
                    <tbody>--%>

                    <c:forEach items="${studs}" var="s" varStatus="i"> <%-- var текущая дисциплина d - одна дисциплина--%>

                        <c:if test="${s.firstname.length() > 0}">
                            <tr>
                                <c:if test="${role eq 1}">
                                    <th scope="row">
                                        <div class="custom-control custom-checkbox">

                                            <input type="checkbox" value="${s.id}" class="custom-control-input" id="cbx${i.count}"
                                                   required>
                                            <label class="custom-control-label" for="cbx${i.count}"></label>

                                        </div>
                                    </th>
                                </c:if>
                                <td>${s.firstname}</td>
                                <td>${s.lastname}</td>
                                <td>${s.group}</td>
                                <fmt:parseDate value="${s.date}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${date}" var="dateP" pattern="dd/MM/yyyy" />

                                       <td>${dateP}


                                       <%--
                                           <ftm: parseDate value="${s.date}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                           <ftm: formatDate value="${date}" var="dateP" pattern="dd/MM/yyyy"/>--%>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>

            </section>
        </div>

<form id="formModiStudent" method="get" action="/student-modify">
    <input type="hidden" id="idModifyStuds" name="idModifyStuds" value="">  <%-- hidden - не виден в браузере, id - c джаваскрипта поиск, name- поиск в джаве,  --%>
</form>
<form id="formDeleteStudents" method="post" action="/students">
    <input type="hidden" id="idsDeleteStudent" name="idsDeleteStudent" value="">
</form>
<form id="formProStudent" method="get" action="/student-progress">
    <input type="hidden" id="idProgressStuds" name="idProgressStuds" value="">
</form>