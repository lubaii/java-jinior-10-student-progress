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
function modyfyTerm() {
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

    $('#idModifyTerm').val(id);
    $('#formModifingTerm').submit();}

function SelectShow()
{

    var len= document.getElementById("discP").options.length;
/*
    var len2= document.getElementById("discP").options.selectedIndex==false;
*/
    var SelectElements = new Array;
    var i =0;


    for (var n = 0; n < len; n++)
    {
        if (document.getElementById("discP").options[n].selected==true)
        {
            SelectElements[i]=document.getElementById("discP").options[n].text;

            i++;
        }
       /* if (document.getElementById("discP").options[n].selected==false)
        {
            alert("Выберете хотя бы один семестр");

        }*/
    }
    if (SelectElements.length ==0) {
        alert("Выберете хотя бы один семестр");
        return;
    }



    var arr = jQuery.makeArray( SelectElements );

    $('#idModifyTerm').val(arr);
    $('#formModifingTerm').submit();

}
  function AddDiscShow(){
      var len= document.getElementById("formControlSelect").options.length;
      var SelectElements = new Array;
      var i =0;
      for (var n = 0; n < len; n++)
      {
          if (document.getElementById("formControlSelect").options[n].selected==true)
          {
              SelectElements[i]=document.getElementById("formControlSelect").options[n].text;

              i++;
          }

      }
      if (SelectElements.length ==0) {
          alert("Выберете хотя бы одну дисциплину");
          return;
      }
      var arrDis = jQuery.makeArray(SelectElements);

      $( "#idAdddisciplines" ).val(arrDis);
      $( "#formControlSelectDis" ).submit();

  }


