<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
        <nav>
            <div id="divNav" class="row">
                <a id="home" href="index.jsp" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
                </a>
                <a id="disciplinesList" href="disciplinesList.jsp" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
                </a>
            </div>
        </nav>
        <div id="container">
            <section>
                <div id="containerForm" class="row">
                    <form class="needs-validation was-validated" method="post" action="/discipline-modify"><%-- action контролер который задействован   --%>
                        <input type="hidden" name="idModifyDisc" value="${disc.id}"> <%--доставаться из джавы одну диссциплины, где гетторы и сессторы из класса --%>

                        <div id="titleForm" class="form-group row">
                            Для модификации дисциплины заполните все поля и нажмите кнопку "Применить":
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Название*</label>
                            <div class="col-sm-8">
                                <input type="text" name="modifyDisc" class="form-control" id="name" value=" ${disc.discipline}" required>
<%--     вытянуть имя из контроллера                            --%>
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
