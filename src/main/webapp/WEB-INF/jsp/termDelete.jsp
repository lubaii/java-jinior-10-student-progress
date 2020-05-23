<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
        <nav>
            <div id="divNav" class="row">
                <a id="home" href="/" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
                </a>
                <a id="termsList" href="/terms-list" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
                </a>
            </div>
        </nav>
        <div id="container">
            <section>
                <div id="containerForm" class="row">
                    <form action="/term-modify">
                        <div id="titleForm" class="form-group row">
                            Для создания семестра заполните все поля и нажмите кнопку "Создать":
                        </div>
                        <div id="divFormGroupRow" class="form-group row needs-validation was-validated">
                            <label id="lbl1" for="input" class="col-sm-6 col-form-label">Длительность семестра (в неделях):</label>
                            <div id="divInput" class="col-sm-4">
                                <input id="input" type="text" class="form-control" placeholder="24" maxlength="2" required>
                                <div class="valid-tooltip">
                                    Хорошо!
                                </div>
                                <div class="invalid-tooltip">
                                    Заполните это поле!
                                </div>
                            </div>

                        </div>
                        <div id="divFormSelect" class="form-group row">
                            <label id="lbl2" for="formControlSelect" class="col-sm-6">Дисциплины в семестре:</label>
                            <select multiple class="form-control col-sm-6" id="formControlSelect" size="7">
                                <option>Информатика</option>
                                <option>Системный анализ</option>
                                <option>Управление проектами</option>
                                <option>Основы Дискретной Математики</option>
                                <option>Высшая математика</option>
                                <option>История Науки и Техники</option>
                                <option>Теория игр</option>
                                <option>Булева алгебра</option>
                            </select>
                        </div>
                        <div class="form-group row">
                            <div id="divButton" class="col-sm-9">
                                <button type="submit" class="btn btn-outline-secondary btn btn-block">Создать</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
