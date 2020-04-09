<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>


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
                                        <c:forEach items="${terms}" var="t">
                                            <c:choose>
                                                <c:when test="${t.id eq selectedTerm.id}">
                                                    <option selected>${t.name}</option>
                                                    <br/>
                                                </c:when>
                                                <c:otherwise>
                                                    <option>${t.name}</option>
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
                                <h5><div class="col-sm-12">Длительность семестра <b> ${selectedTerm.duration} </b></div></h5>
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

                            <c:forEach items="${selectedTerm.disciplines}" var="d">
                            <tr>
                                <td>${d.discipline}</td>
                            </tr>
                            </c:forEach>

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
