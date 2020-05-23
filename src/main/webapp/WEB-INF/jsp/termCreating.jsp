<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<script>
    function validLogin(){
        if (document.terms.value == ""){
            alert ( "Выберете семестр." );
            document.terms.focus();
            return false;
        }
    }
</script>
<script>
    function deleteName(f) {
        if (confirm("Выберете семестр."))
            f.submit();
    }
</script>


        <nav>
            <div id="divNav" class="row">
                <a id="home" href="/" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">На главную</button>
                </a>
                <a id="termsCreate" href="/term-create" class="nav">
                    <button type="button" class="btn btn-outline-secondary btn-sm">Назад</button>
                </a>
            </div>
        </nav>
        <div id="container">
            <section>
                <div id="containerForm" class="row">
<%--
                    <form action="/term-create" method="post" onsubmit="return validLogin();">
--%>
                    <form action="/term-create" method="post" onsubmit="alert('Выберете семестр!');return false">
                        <div id="titleForm" class="form-group row">
                            Для создания семестра заполните все поля и нажмите кнопку "Создать":
                        </div>
                        <div id="divFormGroupRow" class="form-group row needs-validation was-validated" action="/term-create">
                            <label id="lbl1" class="col-sm-6 col-form-label">Длительность семестра (в неделях):</label>
                            <div id="divInput" class=" form-group col-sm-2" >
                           <input type="text"  list="select" name ="terms" value="" placeholder="18 недель" >
                         <datalist id="select">
                            <c:forEach items ="${terms}" var="t">
                          <option value="${t.duration}">
                          </c:forEach>
                           </datalist>
                        </div>
                           </div>
                           <div id="divFormSelect" class="form-group row">
                               <label id="lbl2" class="col-sm-6">Дисциплины в семестре:</label>
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
                                <button type="submit" class="btn btn-outline-secondary btn btn-block">Создать</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
