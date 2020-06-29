<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@page buffer="8192kb" autoFlush="true" %>


<nav>
    <div id="divNav" class="row">
        <a id="home" href="/" class="nav">
            <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
        </a>
        <a id="termsCreate" href="/terms-list" class="nav">
            <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
        </a>
    </div>
</nav>
<div id="container">
    <section>
        <div id="containerForm" class="row">
            <form action="/term-modify">
                <input type="hidden" name="sel" value="${select}" id="select">
                <div id="titleForm" class="form-group row">
                    Для модифицирования семестра выберете поля и нажмите кнопку "Удалить":
                </div>
                <div id="divFormGroupRow" class="form-group row needs-validation was-validated">
                    <label id="lbl1" class="col-sm-6 col-form-label">Длительность семестра (в неделях):</label>
                    <div id="divInput" class=" form-group col-sm-2">

                        <b> ${select.duration}</b>

                    </div>
                </div>
                <div id="divFormSelect" class="form-group row">
                    <label id="lbl2" class="col-sm-6">Дисциплины в семестре:</label>


                    <%--   <script>
                           $( "#formControlSelect" ).val();

                       </script>--%>
                    <select name="discP[]" multiple class="form-control col-sm-6" id="discP" size="7">
                        <c:forEach items="${disc}" var="d">
                            <option>
                                <li><c:out value="${d.discipline}"/></li>
                                <br/></option>
                        </c:forEach>
                    </select>

                </div>
                <div class="form-group row">
                    <div id="divButton" class="col-sm-9">
                        <%--
                                                <button type="submit" class="btn btn-outline-secondary btn btn-block">Редактировать</button>
                        --%>
                        <a onclick="SelectShow()">
                            <button type="button" class="btn btn-outline-secondary btn btn-block">Удалить дисциплины
                            </button>
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </section>
</div>

<form id="formModifingTerm" method="post" action="/term-modify">
    <input type="hidden" id="idModifyTerm" name="idModifyTerm"
           value=""> <%-- hidden - не виден в браузере, id - c джаваскрипта поиск, name- поиск в джаве,  --%>
</form>