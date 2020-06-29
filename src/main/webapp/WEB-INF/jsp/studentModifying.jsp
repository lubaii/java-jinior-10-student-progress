<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%--
<script>
    $( function() {
        $( "#receiptDate" ).datepicker();
    } );
</script>
--%>
<nav>
    <div id="divNav" class="row">
        <a id="home" href="/" class="nav">
            <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
        </a>
        <a id="studentsList" href="/students" class="nav">
            <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
        </a>
    </div>
</nav>
<div id="container">
    <section>
        <%--<div id="containerForm" class="row">--%>
        <div id="containerForm" class="rowCreateStudent">

            <form class="needs-validation was-validated" method="post" action="/student-modify">
                <%--<form class="needs-validation was-validated"  method="post" action="/students">--%>
                <div id="titleForm" class="form-group row">
                    <input type="hidden" name="idModifyStuds" value="${studs.id}"> <%----%>
                    Для модификации студента введите новые значения и нажмите кнопку "Применить"
                </div>
                <div class="form-group row">
                    <label for="surname" class="col-sm-2 col-form-label">Фамилия*</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="surname" name="surname" value="${studs.lastname}"
                               placeholder="Иванов" required>
                    </div>
                    <div class="valid-tooltip">Хорошо!</div>
                    <div class="invalid-tooltip">Заполните это поле!</div>
                </div>
                <div class="form-group row">
                    <label for="namep" class="col-sm-2 col-form-label">Имя*</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="namep" name="name" value="${studs.firstname}"
                               placeholder="Иван" required>
                    </div>
                    <div class="valid-tooltip">Хорошо!</div>
                    <div class="invalid-tooltip">Заполните это поле!</div>
                </div>
                <div class="form-group row">
                    <label for="group1" class="col-sm-2 col-form-label">Группа*</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="group1" name="group" value="${studs.group}"
                               placeholder="КТ-21" required>
                    </div>
                    <div class="valid-tooltip">Хорошо!</div>
                    <div class="invalid-tooltip">Заполните это поле!</div>
                </div>
                <div class="form-group row">
                    <label for="receiptDate" class="col-sm-2 col-form-label">Дата поступления*</label>
                    <div class="col-sm-6">
                        <%-- <input type="date" class="form-control" id="receiptDate" value="${studs.date}" required> --%>
                        <input type="text" class="form-control" id="receiptDate" name="date" value="${studs.date}"
                               placeholder=""
                               required>
                        <%-- <input type="date" class="form-control" id="receiptDate" value="date" placeholder="2020-03-05" required>

                        <%--
                        <c:set var="now" value="<%= new java.util.Date() %>"/>
                        <input type="text" class="form-control" id="receiptDate"
                               placeholder="<fmt:formatDate type="date" value="${now}" pattern="dd/mm/yyyy"/>">--%>

                        <%--
                                                           <fmt:parseDate value="${stud.date}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                           <fmt:formatDate value="${date}" var="dateP" pattern="dd/MM/yyyy"/>
                                                             <input type="text" class="form-control" id="receiptDate"
                                                                  placeholder="<fmt:formatDate type="date" value="${dateP}" pattern="dd/mm/yyyy"/>">
                                                           --%>
                        <%--
                        <fmt:parseDate value="${stud.date}" var="date" pattern="dd/MM/yyyy"/>
                        <fmt:formatDate value="${date}" var="dateP" />

                        <input type="text" class="form-control" id="receiptDate"
                               placeholder="<fmt:formatDate type="date" value="${dateP}" pattern="dd/mm/yyyy"/>">
                        --%>
                    </div>
                    <div class="valid-tooltip">Хорошо!</div>
                    <div class="invalid-tooltip">Заполните это поле!</div>
                </div>
                <div class="form-group row">
                    <div id="divButton" class="col-sm-5">
                        <button type="submit" class="btn btn-outline-secondary btn btn-block">Применить</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
</div>
