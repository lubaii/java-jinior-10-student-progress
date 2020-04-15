<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            <section>
                <div id="titleStudentProgress" class="row">
                    <h4>Отображена успеваемость для следущего студента:</h4>
                </div>
            </section>
            <section id="sectionTable">
                <h5>Список студентов</h5>
                <table id="table" class="table table-bordered table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Фамилия</th>
                            <th scope="col">Имя</th>
                            <th scope="col">Группа</th>
                            <th scope="col">Дата поступления</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>КТ-21</td>
                            <td>01.06.2019</td>
                        </tr>
                    </tbody>
                </table>
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
                            <tr>
                                <td>Информатика</td>
                                <td class="tdTable2">5</td>
                            </tr>
                            <tr>
                                <td>Системный анализ</td>
                                <td class="tdTable2">5</td>
                            </tr>
                            <tr>
                                <td>Управление проектами</td>
                                <td class="tdTable2">4</td>
                            </tr>
                            <tr>
                                <td>Основы Дискретной Математики</td>
                                <td class="tdTable2">4</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-sm-6">
                        <div class="form">
                            <div class="form-row">
                                <div class="form-group col-sm-5">
                                    <h6><b>Выбрать семестр:</b></h6>
                                </div>
                                <div class="form-group col-sm-4">
                                    <select type="text" id="select" class="form-control">
                                        <option selected>Семестр 1</option>
                                        <option>Семестр 2</option>
                                        <option>Семестр 3</option>
                                        <option>Семестр 4</option>
                                        <option>Семестр 5</option>
                                    </select>
                                </div>
                                <div class="form-group col-sm-2">
                                    <button type="submit" id="btn" class="btn btn-outline-secondary">Выбрать</button>
                                </div>
                            </div>
                            <div class="row">
                                <h5>
                                    <div class="col-sm-12">Средняя оценка за семестр: <b> 4.8 </b> балла.</div>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

