<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<link rel="stylesheet" href="./recourses/css/style.css">
<style>
    .col-sm-8 {
        font-family: 'Lobster', cursive;
    }
    .row {
        /*border: 1px solid #6c757d;
        border-radius: 5px;
        color: #6c757d;*/
        border:none !important;
        /*width: 295px !important;*/
        margin: 30px 0;
        padding: 15px 0;
        /* box-shadow: 0 0 12px 2px #6c757d;*/
         box-shadow: none !important;
         text-align: center;
    }
    /*.form-group row{
        border:none;
    }*/
    .titleForm {
        padding-left: 36px;
        font-size: large;

    }
    .col-sm-2 col-form-label{
        width: 300px !important;
    }
</style>

    <div class="wrapper-no4">
        <div id="container" class="container-fluid">
    <div class="row">
        <div class="col-sm-2">

        </div>
        <div class="col-md-8">
            <section>
                <div id="containerForm" class="row">
                    <form class="needs-validation was-validated" action="login" method="post">
                        <div id="titleForm" class="form-group row">
                            Для входа заполните все поля и нажмите кнопку "Войти":
                        </div>
                        <div class="form-group row">
                            <label for="loginID" class="col-sm-2 col-form-label">Логин*</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="loginID" name="login"
                                       placeholder="Логин"
                                       required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="passId" class="col-sm-2 col-form-label">Пароль*</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="passId" name="pass" placeholder="****"
                                       required>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <div class="form-group row">
                            <label for="roleID" class="col-sm-2 col-form-label">Роль*</label>
                            <div class="col-sm-6">
                                <select class="form-control" id="roleID" name="role">
                                    <option value="1">Администратор</option>
                                    <option value="2">Студент</option>
                                </select>
                            </div>
                            <div class="valid-tooltip">Хорошо!</div>
                            <div class="invalid-tooltip">Заполните это поле!</div>
                        </div>
                        <%--<div class="wrapper-no4">--%>
                        <div class="form-group row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-3">
                               <%-- <button type="submit" class="btn btn-outline-secondary btn btn-block">Войти</button>--%>
                                    <%--<div class="wrapper-no4">--%>
                                    <button  class="button-bird">
                                            <p class="button-bird__text">SEND</p>
                                            <svg version="1.1" class="feather" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 75 38" style="enable-background:new 0 0 75 38;" xml:space="preserve">
        <g>
            <path d="M20.8,31.6c3.1-0.7,2.9-2.3,2,1c9.1,4.4,20.4,3.7,29.1-0.8l0,0c0.7-2.1,1-3.9,1-3.9c0.6,0.8,0.8,1.7,1,2.9
                c4.1-2.3,7.6-5.3,10.2-8.3c0.4-2.2,0.4-4,0.4-4.1c0.6,0.4,0.9,1.2,1.2,2.1c4.5-6.1,5.4-11.2,3.7-13.5c1.1-2.6,1.6-5.4,1.2-7.7
                c-0.5,2.4-1.2,4.7-2.1,7.1c-5.8,11.5-16.9,21.9-30.3,25.3c13-4,23.6-14.4,29.1-25.6C62.8,9,55.6,16.5,44.7,20.7
                c2.1,0.7,3.5,1.1,3.5,1.6c-0.1,0.4-1.3,0.6-3.2,0.4c-7-0.9-7.1,1.2-16,1.5c1,1.3,2,2.5,3.1,3.6c-1.9-0.9-3.8-2.2-5.6-3.6
                c-0.9,0.1-10.3,4.9-22.6-12.3C5.9,17.7,11.8,26.9,20.8,31.6z"/>
        </g>
        </svg>
                                            <span class="bird"></span>
                                            <span class="bird--1"></span>
                                            <span class="bird--2"></span>
                                            <span class="bird--3"></span>
                                            <span class="bird--4"></span>
                                            <span class="bird--5"></span>
                                            <span class="bird--6"></span>
                                            <span class="bird--7"></span>
                                            <span class="bird--8"></span>
                                            <span class="bird--9"></span>
                                            <span class="bird--10"></span>
                                            <span class="bird--11"></span>
                                            <span class="bird--12"></span>
                                            <span class="bird--13"></span>
                                            <span class="bird--14"></span>
                                            <span class="bird--15"></span>
                                            <span class="bird--16"></span>
                                            <span class="bird--17"></span>
                                            <span class="bird--18"></span>
                                            <span class="bird--19"></span>
                                            <span class="bird--20"></span>
                                            <span class="bird--21"></span>
                                            <span class="bird--22"></span>
                                            <span class="bird--23"></span>
                                            <span class="bird--24"></span>
                                            <span class="bird--25"></span>
                                            <span class="bird--26"></span>
                                            <span class="bird--27"></span>
                                            <span class="bird--28"></span>
                                            <span class="bird--29"></span>
                                            <span class="bird--30"></span>
                                        </button>
                                    <%--</div>--%>
                            </div>
                        </div>
                       <c:if test="${errorMessage eq 1}">
                        <div> Логин или пароль не верны! </div>
                        </c:if>
                    </form>
                </div>

            </section>
        </div>
        <div class="col-sm-2"></div>
    </div>
</div>
</div>
<%--
<head>
    <!--<meta> charset="utf-8"-->

    <link rel="stylesheet" href="./recourses/css/style.css">

    <title>Главная</title>
</head>
<body>


<div class="wrapper-no4">
    <div id="containerForm" class="row">
        <form class="needs-validation was-validated" action="login" method="post">
            <div id="titleForm" class="form-group row">
                Для входа заполните все поля и нажмите кнопку "Войти":
            </div>
            <div class="form-group row">
                <label for="loginID" class="col-sm-2 col-form-label">Логин*</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="loginID" name="login"
                           placeholder="Логин"
                           required>
                </div>
                <div class="valid-tooltip">Хорошо!</div>
                <div class="invalid-tooltip">Заполните это поле!</div>
            </div>
            <div class="form-group row">
                <label for="passId" class="col-sm-2 col-form-label">Пароль*</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="passId" name="pass" placeholder="****"
                           required>
                </div>
                <div class="valid-tooltip">Хорошо!</div>
                <div class="invalid-tooltip">Заполните это поле!</div>
            </div>
            <div class="form-group row">
                <label for="roleID" class="col-sm-2 col-form-label">Роль*</label>
                <div class="col-sm-6">
                    <select class="form-control" id="roleID" name="role">
                        <option value="1">Администратор</option>
                        <option value="2">Студент</option>
                    </select>
                </div>
                <div class="valid-tooltip">Хорошо!</div>
                <div class="invalid-tooltip">Заполните это поле!</div>
            </div>
            <div class="form-group row">
                <div class="col-sm-2"></div>
                <div class="col-sm-3">
                    <button class="button-bird">
                        <p class="button-bird__text">SEND</p>
                        <svg version="1.1" class="feather" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             viewBox="0 0 75 38" style="enable-background:new 0 0 75 38;" xml:space="preserve">
            <g>
                <path d="M20.8,31.6c3.1-0.7,2.9-2.3,2,1c9.1,4.4,20.4,3.7,29.1-0.8l0,0c0.7-2.1,1-3.9,1-3.9c0.6,0.8,0.8,1.7,1,2.9
                    c4.1-2.3,7.6-5.3,10.2-8.3c0.4-2.2,0.4-4,0.4-4.1c0.6,0.4,0.9,1.2,1.2,2.1c4.5-6.1,5.4-11.2,3.7-13.5c1.1-2.6,1.6-5.4,1.2-7.7
                    c-0.5,2.4-1.2,4.7-2.1,7.1c-5.8,11.5-16.9,21.9-30.3,25.3c13-4,23.6-14.4,29.1-25.6C62.8,9,55.6,16.5,44.7,20.7
                    c2.1,0.7,3.5,1.1,3.5,1.6c-0.1,0.4-1.3,0.6-3.2,0.4c-7-0.9-7.1,1.2-16,1.5c1,1.3,2,2.5,3.1,3.6c-1.9-0.9-3.8-2.2-5.6-3.6
                    c-0.9,0.1-10.3,4.9-22.6-12.3C5.9,17.7,11.8,26.9,20.8,31.6z"/>
            </g>
            </svg>
                        <span class="bird"></span>
                        <span class="bird--1"></span>
                        <span class="bird--2"></span>
                        <span class="bird--3"></span>
                        <span class="bird--4"></span>
                        <span class="bird--5"></span>
                        <span class="bird--6"></span>
                        <span class="bird--7"></span>
                        <span class="bird--8"></span>
                        <span class="bird--9"></span>
                        <span class="bird--10"></span>
                        <span class="bird--11"></span>
                        <span class="bird--12"></span>
                        <span class="bird--13"></span>
                        <span class="bird--14"></span>
                        <span class="bird--15"></span>
                        <span class="bird--16"></span>
                        <span class="bird--17"></span>
                        <span class="bird--18"></span>
                        <span class="bird--19"></span>
                        <span class="bird--20"></span>
                        <span class="bird--21"></span>
                        <span class="bird--22"></span>
                        <span class="bird--23"></span>
                        <span class="bird--24"></span>
                        <span class="bird--25"></span>
                        <span class="bird--26"></span>
                        <span class="bird--27"></span>
                        <span class="bird--28"></span>
                        <span class="bird--29"></span>
                        <span class="bird--30"></span>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>--%>

<script>
    document.addEventListener("DOMContentLoaded", function(){
        var el = document.querySelector(".button-bird");
        var text = document.querySelector(".button-bird__text");
        el.addEventListener('click', function() {
            el.classList.toggle('active');

            if(el.classList.contains('active')){
                console.log('true');
                text.innerHTML = ' ';
            }else{
                text.innerHTML = 'SEND';
            }
        });
    });
</script>
