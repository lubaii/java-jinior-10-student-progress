<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
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
                <div id="containerForm" class="row">
                    <form class="needs-validation was-validated">
                        <div id="titleForm" class="form-group row">
                            <input type="hidden" name="idModifyStuds" value="${studs.id}"> <%----%>
                            Для модификации студента введите новые значения и нажмите кнопку "Применить"
                        </div>
                        <div class="form-group row">
                            <label for="surname" class="col-sm-2 col-form-label">Фамилия*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="surname" value="${studs.lastname}" placeholder="Иванов" required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Имя*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="name" value="${studs.firstname}" placeholder="Иван" required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="surname" class="col-sm-2 col-form-label">Группа*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="group" value="${studs.group}" placeholder="КТ-21" required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-2 col-form-label">Дата поступления*</label>
                            <div class="col-sm-6">
                                <input type="date" class="form-control" id="receiptDate" value="${studs.date}" required>
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
