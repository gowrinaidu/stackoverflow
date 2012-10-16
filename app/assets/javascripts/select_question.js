$(document).ready(function(){

  $('#q_type_Answered').bind('click', function() {
    $.ajax({
      url: "/answers/user_chance_question",
      data : {question_type: "Answered"}
    });
  });

 $('#q_type_Un_answered').bind('click', function() {
    $.ajax({
      url: "/answers/user_chance_question",
      data : {question_type: "Un answered"}
    });
  });

});

