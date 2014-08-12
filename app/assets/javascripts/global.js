$(document).ready(function(){

  $(".datetimepicker").each(function(index){
    var $input = $(this),
        $input_copy = $input.clone();


    $input.replaceWith(
      $("<div>", {class:"input-group"}).append(
        $input_copy.datetimepicker({
          lang: 'ru',
          step:30,
          format: 'd.m.Y H:i'
        }),
        $("<span>", {class:"input-group-btn"}).append(
          $("<a>", {class:"btn btn-default", title:"clear", "data-clearinput":"yes"}).text("X")
        )
      )
    )
  });

  $("body").on("click", "a[data-clearinput='yes']", function(){
    var $btn = $(this),
        $input_group = $btn.closest("div.input-group"),
        $input = $input_group.find("input");

    $input.val("")
  });
})