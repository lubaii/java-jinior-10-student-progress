<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<nav>
    <div id="divNav" class="row">
        <a id="home" href="/" class="nav">
            <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
        </a>
        <a id="termsCreate" href="/" class="nav">
            <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
        </a>
    </div>
</nav>
<div id="container">
    <section>
        <div id="titleTermsList" class="row">
            <form action="/terms-list">
                <div class="form-row">
                    <div id="divFormTitle" class="form-group col-sm-4">
                        <h5>Выбрать семестр:</h5>
                    </div>
                    <div class="form-group col-sm-3">
                        <select type="text" id="select" class="form-control"
                                name="selTerm"> <%-- отправляется на джаву и вытягивается по имени--%>
                            <c:forEach items="${terms}" var="t">
                                <c:choose>
                                    <c:when test="${t.id eq selectedTerm.id}">
                                        <option value="${t.id}" selected>${t.name}</option>
                                        <br/>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${t.id}">${t.name}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-sm-3">
                        <button type="submit" id="btn" class="btn btn-outline-secondary">Выбрать</button>
                    </div>
                </div>
                <div id="divDurationTerm" class="row">
                    <h5>
                        <div class="col-sm-12">Длительность семестра <b> ${selectedTerm.duration} </b></div>
                    </h5>
                </div>
            </form>
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

                    <c:forEach items="${selectedTerm.disciplines}" var="d">
                        <tr>
                            <td>${d.discipline}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
             <c:if test="${role eq 1}">
            <div class="col-sm-5">
                <section>
                    <div id="divTermsList1" class="row">
                        <form action="/term-create">
                            <div class="divTermsList col-sm-12">
                                <input type="hidden" name="term" value="${selectedTerm.id}">
                                <button id="button1" type="submit" class="btn btn-outline-secondary btn-lg btn-block">
                                    Добавить в семестр дисциплины
                                </button>
                            </div>
                        </form>
                    </div>
                    <div id="divTermsList2" class="row">


                        <form action="/term-modify">

                            <div class="divTermsList col-sm-12">
                                <input type="hidden" name="sel" value="${selectedTerm.id}">

                                <button id="button2" type="submit" class="btn btn-outline-secondary btn-lg btn-block">
                                    Удалить дисциплины в семестре
                                </button>

                                <%--<button id="button2" type="button" class="btn btn-outline-secondary btn-lg btn-block">Модифицировать выбранный семестр</button>--%>

                            </div>

                        </form>

                        <%--</a>--%>
                    </div>
                </section>
               </div>
             </c:if>
        </div>
    </section>
</div>
