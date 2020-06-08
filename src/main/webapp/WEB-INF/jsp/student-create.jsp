<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 28.03.2020
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <form class="needs-validation was-validated" action="student-create" method="post">
                        <div id="titleForm" class="form-group row">
                            Для создания студента заполните все поля и нажмите кнопку "Создать":
                        </div>
                        <div class="form-group row">
                            <label for="surnameID" class="col-sm-2 col-form-label">Фамилия*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="surnameID" name="surname"
                                       placeholder="Иванов"
                                       required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="nameId" class="col-sm-2 col-form-label">Имя*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="nameID" name="name" placeholder="Иван"
                                       required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="groupID" class="col-sm-2 col-form-label">Группа*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="groupID" name="group" placeholder="КТ-21"
                                       required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">



<%--
                                <label for="datepicker" class="col-sm-2 col-form-label">Дата поступления*</label>
                                                       <div class="col-sm-6">
                                                       <c:set var="date" value="<%= new java.util.Date() %>" />
                                                       <input type="text" class="form-control"
                                                              value="<fmt:formatDate type="date" value="${date}" pattern="dd/mm/yyyy"/>"
                                                       type="text" placeholder="" autocomplete="off" id ="datepicker" required  >
                                                       </div>--%>



                            <%--
                                                        <div class="col-sm-6">
                                                        <c:set var="now" value="<%= new java.util.Date() %>"/>
                                                        <input type="text" class="form-control" id="receiptDate2"
                                                               placeholder="<fmt:formatDate type="date" value="${now}" pattern="dd/mm/yyyy"/>">
                                                        </div>


<--%>
                                                 <label for="receiptDate" class="col-sm-2 col-form-label">Дата поступления*</label>

               <div class="col-sm-6">
<input type="text" class="form-control" id="receiptDate" name="date"
     placeholder="03-05-2020" required>
</div>

<%--
    <div class="col-sm-6">
        <c:set var="now" value="<%= new java.util.Date() %>"/>
        <input type="text" class="form-control" id="receiptDate" name="date"
               placeholder="<fmt:formatDate type = "both"   value="${now}" pattern="dd/mm/yyyy"/>">
    </div>
    --%>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-3">
                                <button type="submit" class="btn btn-outline-secondary btn btn-block">Создать</button>
                            </div>
                        </div>
                        <c:if test="${success == 1}">
                            <div class="form-group row">
                                <div class="col-sm-2"></div>
                                <div id="success" class="col-sm-10">
                                    Студент "<b>${surname} ${name}</b>" создан
                                </div>
                            </div>
                        </c:if>
                    </form>
                </div>
            </section>
        <div class="col-sm-2"></div>
    </div>
