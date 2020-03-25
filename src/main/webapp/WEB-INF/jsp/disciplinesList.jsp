<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<nav>
    <div id="divNav" class="row">
        <a id="home" href="index.jsp" class="nav">
            <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
        </a>
        <%-- <a id="studentsList" href="studentsList.jsp" class="nav">
             <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
         </a>--%>
    </div>
</nav>
<div id="container">
    <section>
        <div id="titleDisciplinesList" class="row">
            <h5>Список дисциплин:</h5>
        </div>
    </section>
    <section id="sectionBody">
        <div class="row">
            <div class="col-sm-7">
                <table id="table" class="table table-bordered table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbxAll">
                            </div>
                        </th>
                        <th scope="col">Наименование дисциплины</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${disces}" var="d" varStatus="i">
                        <c:if test="${d.discipline.length() > 0}">
                            <tr>
                                <th scope="row">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" value="${d.id}" class="custom-control-input" id="cbx${i.count}"
                                               required>
                                        <label class="custom-control-label" for="cbx${i.count}"></label>
                                    </div>
                                </th>
                                <td>${d.discipline}</td>
                            </tr>
                        </c:if>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
            <div class="col-sm-5">
                <section>
                    <div id="divDisciplineList1" class="row">
                        <div class="divDisciplineList col-sm-12">
                            <a href="/discipline-create">
                                <button id="button1" type="button" class="btn btn-outline-secondary btn-lg btn-block">
                                    Создать дисциплину
                                </button>
                            </a>
                        </div>
                    </div>
                    <div id="divDisciplineList2" class="row">
                        <div class="divDisciplineList col-sm-12">
                          <a onclick="modyfyDisciplines()">
                                <button id="button2" type="button" class="btn btn-outline-secondary btn-lg btn-block">
                                    Модифицировать выбранные дисциплины
                                </button>
                            </a>
                        </div>
                    </div>
                    <div id="divDisciplineList3" class="row">
                        <div class="divDisciplineList col-sm-12">
                            <a onclick="deleteDisciplines()">
                                <button id="button3" type="button" class="btn btn-outline-secondary btn-lg btn-block">
                                    Удалить выбранную дисциплину
                                </button>
                            </a>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>
</div>
<form id="formModifingDiscipline" method="get" action="/discipline-modify">
    <input type="hidden" id="idModifyDisc" name="idModifyDisc" value="">
</form>
<form id="formDeleteDisciplines" method="post" action="/disciplines">
    <input type="hidden" id="idsDeleteDiscipline" name="idsDeleteDiscipline" value="">
</form>
