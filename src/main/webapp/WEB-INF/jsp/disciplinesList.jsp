<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<nav>
    <div id="divNav" class="row">
        <a id="home" href="/" class="nav">
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
                        <c:if test="${role eq 1}">
                        <th scope="col">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="cbxAll">
                            </div>
                        </th>
                        </c:if>
                        <th scope="col">Наименование дисциплины</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${disces}" var="d" varStatus="i"> <%-- var текущая дисциплина d - одна дисциплина--%>
                        <c:if test="${d.discipline.length() > 0}">

                            <tr>
                        <c:if test="${role eq 1}">
                                <th scope="row">
                                    <div class="custom-control custom-checkbox">

                                        <input type="checkbox" value="${d.id}" class="custom-control-input" id="cbx${i.count}"
                                               required>
                                        <label class="custom-control-label" for="cbx${i.count}"></label>

                                    </div>
                                </th>
                        </c:if>
                                <td>${d.discipline}</td> <%-- из класса discipline, где есть гетторы и сетторы, чтобы отобразить страницу  --%>
                            </tr>
                        </c:if>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
          <c:if test="${role eq 1}">

              <div class="col-sm-5">
                <section>
                    <div id="divDisciplineList1" class="row">
                        <div class="divDisciplineList col-sm-12">
                            <a href="/discipline-create"> <%-- привязка дейсвтия на ссылку url controllera--%>
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
                                    Модифицировать выбранную дисциплину
                                </button>
                            </a>
                        </div>
                    </div>
                    <div id="divDisciplineList3" class="row">
                        <div class="divDisciplineList col-sm-12">
                            <a onclick="deleteDisciplines()">
                                <button id="button3" type="button" class="btn btn-outline-secondary btn-lg btn-block">
                                    Удалить выбранные дисциплины
                                </button>
                            </a>
                        </div>
                    </div>
                </section>
            </div>
           </c:if>
        </div>
    </section>
</div>
<form id="formModifingDiscipline" method="get" action="/discipline-modify">
    <input type="hidden" id="idModifyDisc" name="idModifyDisc" value="">  <%-- hidden - не виден в браузере, id - c джаваскрипта поиск, name- поиск в джаве,  --%>
</form>
<form id="formDeleteDisciplines" method="post" action="/disciplines">
    <input type="hidden" id="idsDeleteDiscipline" name="idsDeleteDiscipline" value="">
</form>
