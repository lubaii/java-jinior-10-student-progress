function modyfyDisciplines() {
    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Please select discipline");
        return;
    }
    if (items.length > 1) {
        alert("Please select One disciplines");
        return;
    }
   var id = $(items[0]).attr("value");

    $('#idModifyDisc').val(id);
    $('#formModifingDiscipline').submit();

}

function deleteDisciplines() {
    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Пожалуйста, выберите хотя бы одну дисциплину");
        return;
    }

    var ids;

    for(var i = 0; i < items.length; i++){
        if(ids == null){
            ids = "'" + $(items[i]).attr("value");
        }else{
            ids = ids + "','" + $(items[i]).attr("value");
        }
        if(i == items.length-1){
            ids = ids + "'"
        }
    }

    $('#idsDeleteDiscipline').val(ids);
    $('#formDeleteDisciplines').submit();

}
function modyfyStudentes() {
    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Пожалуйста, выберете студента");
        return;
    }
    if (items.length > 1) {
        alert("Выберете только одного студента");
        return;
    }
    var id = $(items[0]).attr("value");

    $('#idModifyStuds').val(id);
    $('#formModiStudent').submit();
}

function deleteStudents() {
    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Пожалуйста, выберите хотя бы одного студента");
        return;
    }

    var ids;

    for(var i = 0; i < items.length; i++){
        if(ids == null){
            ids = "'" + $(items[i]).attr("value");
        }else{
            ids = ids + "','" + $(items[i]).attr("value");
        }
        if(i == items.length-1){
            ids = ids + "'"
        }
    }

    $('#idsDeleteStudent').val(ids);
    $('#formDeleteStudents').submit();

}
function progressStudentes() {
    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Пожалуйста, выберете студента");
        return;
    }
    if (items.length > 1) {
        alert("Выберете только одного студента");
        return;
    }
    var id = $(items[0]).attr("value");

    $('#idProgressStuds').val(id);
   $('#formProStudent').submit();
}
