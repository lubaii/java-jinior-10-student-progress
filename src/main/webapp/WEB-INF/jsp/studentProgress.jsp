<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

            <div id="divNav" class="row">
                <a id="home" href="/" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
                </a>
                <a id="studentsList" href="studentsList.jsp" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
                </a>
            </div>
        </nav>
        <div id="container">
            <form action="/student-progress">
            <section >
                <div id="titleStudentProgress" class="row">
                    <h4>Отображена успеваемость для следущего студента:</h4>
                </div>
            </section>
            <section id="sectionTable">
                <h5>Список студентов</h5>
         <%--<form action="/student-progress">--%>
             <input type="hidden" name="idProgressStuds" value="${stuD.id}" varstatus="status">

             <table id="table" class="table table-bordered table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Фамилия</th>
                            <th scope="col">Имя</th>
                            <th scope="col">Группа</th>
                            <th scope="col">Дата поступления</th>
                        </tr>
                    </thead>
                    <tbody id="myTable">
                        <tr>
                            <td>${stuD.firstname}</td>
                            <td>${stuD.lastname}</td>
                            <td>${stuD.group}</td>
                            <fmt:parseDate value="${stuD.date}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${date}" var="dateP" pattern="dd/MM/yyyy" />
                            <td>${dateP}</td>
                        </tr>
                    </tbody>
                </table>
               <%-- </form>--%>

            </section>

            <section id="sectionBody">
                <div class="row">
                    <div class="col-sm-6">
                        <table id="table1" class="table table-bordered table table-hover">
                            <thead>
                            <tr id="tr">
                                <th scope="col">Дисциплина</th>
                                <th scope="col">Оценка</th>
                            </tr>
                            </thead>
                            <tbody>
                         <c:forEach items="${dis.disciplines}" var="d">
                             <c:forEach items="${dis.mark}" var="m">
                            <tr>
                                <td>${d.discipline}</td>
                                <td class="tdTable2">${m.mark}</td>
                            </tr>
                             </c:forEach>
                         </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <%--<form method="post" action="/student-progress">
                        <input type="hidden" name="idProgressStuds" value="${stuD.id}" varstatus="status">
                    --%>
                    <div class="col-sm-6">
                        <div class="form">
                            <div class="form-row">
                                <div class="form-group col-sm-5">
                                    <h6><b>Выбрать семестр:</b></h6>
                                </div>
                                <div class="form-group col-sm-4">
                                    <select type="text" id="select" class="form-control" name="selTerm">

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
                                <div class="form-group col-sm-2">
                                    <button type="submit" id="btn" class="btn btn-outline-secondary">Выбрать</button>
                                </div>
                            </div>
                            <div class="row">
                                <h5>
                                    <div class="col-sm-12">Средняя оценка за семестр: <b> ${selectedTerm.duration}</b> балла.</div>
                                </h5>
                            </div>
                        </div>
                    </div>

                   <%-- </form>--%>

                </div>
            </section>
            </form>
        </div>

