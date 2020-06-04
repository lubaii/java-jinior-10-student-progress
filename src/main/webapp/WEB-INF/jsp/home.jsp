<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<div id="container">
    <nav>
        <div id="navHeader" class="row">
            <div class="col-sm-4">
                <a href="/students">
                    <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Студенты</button>
                </a>
            </div>
            <div class="col-sm-4">
                <a href="/disciplines">
                    <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Дисциплины</button>
                </a>
            </div>
            <div class="col-sm-4">
                <a href="/terms-list">
                    <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Семестры</button>
                </a>
            </div>
        </div>
    </nav>
</div>
<%--<script>jQuery(document).ready(function(){
    jQuery('.bxslider').bxSlider();
});</script>--%>
<%--<script>
    $('.bxslider').bxSlider({
        auto: true,
        autoControls: true,
        stopAutoOnClick: true,
        pager: true,
        slideWidth: 600
    });
</script>--%>
<style>
.cont{
    width: 600px;
    position: absolute;
    bottom: 75px; /* Положение от нижнего края */
    right: 600px;}
</style>
<script>jQuery(document).ready(function(){
    jQuery('.bxslider').bxSlider({
        auto: true,
        autoControls: true,
        stopAutoOnClick: true,
        pager: true,
       // slideWidth: 600
    });
});</script>
<div class="cont">
<div class="bxslider">
    <div><img src="./recourses/picture/cast.jpg"></div>
    <div><img src="./recourses/picture/matem.jpg"></div>
    <div><img src="./recourses/picture/library.jpg"></div>
</div>
</div>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>--%>
