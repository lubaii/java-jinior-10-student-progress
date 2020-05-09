<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<nav>
    <div id="divNav" class="row">
        <a id="home" href="/" class="nav">
            <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
        </a>
        <a id="termsMod" href="/term-modify" class="nav">
            <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
        </a>
    </div>
</nav>
<div id="container">
    <section>
        <div id="containerForm" class="row">
            <form action="/term-modify" method="">
                <div id="titleForm" class="form-group row">
                    Для редактирования семестра заполните все поля и нажмите кнопку "Редактировать":
                </div>
                <div id="divFormGroupRow" class="form-group row needs-validation was-validated" action="/term-modify">
                    <label id="lbl1" class="col-sm-6 col-form-label">Длительность семестра (в неделях):</label>
                    <div id="divInput" class=" form-group col-sm-2" >
                        <input type="text" list="ter" name ="terms" placeholder="семестры">
                        <datalist id="ter">
                            <c:forEach items ="${terms}" var="t">
                            <option value="${t.duration}">
                                </c:forEach>
                        </datalist>

                    </div>
                </div>
                <div id="divFormSelect" class="form-group row">
                    <label id="lbl2" class="col-sm-6">Дисциплины в семестре:</label>
                    <%--
                    <script>
                        $(function() {
                            $('.mdb-select').materialSelect();
                        });
                    </script>
                    <select class="mdb-select md-form" multiple>
                        <option value="" disabled selected>Choose your country</option>
                        <option value="1">USA</option>
                        <option value="2">Germany</option>
                        <option value="3">France</option>
                        <option value="4">Poland</option>
                        <option value="5">Japan</option>
                    </select>
                    <button class="btn-save btn btn-primary btn-sm">Save</button>--%>
                    <%--
                                                   <select class="mdb-select md-form" id="formControlSelect" name="discP" multiple searchable="Search here..">
                                                          <c:forEach items="${disc}" var="d">

                                                              <option><li><c:out value="${d.discipline}"/></li><br /></option>
                                                          </c:forEach>

                                                   </select>
                                                   <label class="mdb-main-label">Label example</label>
                                                   <button class="btn-save btn btn-primary btn-sm">Save</button>--%>

                    <script>
                        $( "#formControlSelect" ).val();
                    </script>
                    <select name="discP" multiple class="form-control col-sm-6" id="formControlSelect" size="7">
                        <c:forEach items="${disc}" var="d">
                            <option><li><c:out value="${d.discipline}"/></li><br /></option>
                        </c:forEach>
                    </select>

                </div>
                <div class="form-group row">
                    <div id="divButton" class="col-sm-9">
                        <button type="submit" class="btn btn-outline-secondary btn btn-block">Редактировать</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
</div>