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
    debugger;
    alert("Любина отладка, id = " + id);
    $('#idModifyDisc').val(id);
    $('#formModifingDiscipline').submit();


}