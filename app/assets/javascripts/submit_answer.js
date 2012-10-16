
$(document).ready(function(){

  // Answer form validation
//=============================================================================================================

  $("#new_answer").submit( function () {

         if ($('#answer_question_id').val() == "" && $('#answer_user_name').val() == "" && $('#answer_user_answer').val() == "")
         {
            $('#q_err').css('display','block');
            $('#n_err').css('display','block');
            $('#a_err').css('display','block');
            return false;
         }

         else if ($('#answer_question_id').val() == "" && $('#answer_user_name').val() == "" && $('#answer_user_answer').val() != "")
         {
            $('#q_err').css('display','block');
            $('#n_err').css('display','block');
            $('#a_err').css('display','none');
            return false;
         }

         else if ($('#answer_question_id').val() == "" && $('#answer_user_name').val() != "" && $('#answer_user_answer').val() == "")
         {
            $('#q_err').css('display','block');
            $('#n_err').css('display','none');
            $('#a_err').css('display','block');
            return false;
         }

         else if ($('#answer_question_id').val() != "" && $('#answer_user_name').val() == "" && $('#answer_user_answer').val() == "")
         {
            $('#q_err').css('display','none');
            $('#n_err').css('display','block');
            $('#a_err').css('display','block');
            return false;
         }

         else if ($('#answer_question_id').val() == "") {
            $('#q_err').css('display','block');
            $('#n_err').css('display','none');
            $('#a_err').css('display','none');
            return false;
          }

         else if ($('#answer_user_name').val() == "") {
            $('#n_err').css('display','block')
            $('#q_err').css('display','none');
            $('#a_err').css('display','none');
            return false;
          }

         else if ($('#answer_user_answer').val() == "") {
            $('#a_err').css('display','block')
            $('#n_err').css('display','none');
            $('#q_err').css('display','none');
            return false;
         }

        else{return true;}

  });

// Question form validation
//=============================================================================================================

  $("#new_question").submit( function () {

       if ($('#question_admin_name').val() == "" && $('#question_question_name').val() == "" && $('#subject_tag').val() == "")
         {
            $('#an_err').css('display','block');
            $('#aq_err').css('display','block');
            $('#t_err').css('display','block');
            return false;
         }

         else if ($('#question_admin_name').val() == "" && $('#question_question_name').val() == "" && $('#subject_tag').val() != "")
         {
            $('#an_err').css('display','block');
            $('#aq_err').css('display','block');
            $('#t_err').css('display','none');
            return false;
         }

         else if ($('#question_admin_name').val() == "" && $('#question_question_name').val() != "" && $('#subject_tag').val() == "")
         {
            $('#an_err').css('display','block');
            $('#aq_err').css('display','none');
            $('#t_err').css('display','block');
            return false;
         }

        else if ($('#question_admin_name').val() != "" && $('#question_question_name').val() != "" && $('#subject_tag').val() == "")
         {
            $('#an_err').css('display','none');
            $('#aq_err').css('display','none');
            $('#t_err').css('display','block');
            return false;
         }

        else if ($('#question_admin_name').val() == "") {
            $('#an_err').css('display','block');
            $('#aq_err').css('display','none');
            $('#t_err').css('display','none');
            return false;
          }

        else if ($('#question_question_name').val() == "") {
            $('#an_err').css('display','none');
            $('#aq_err').css('display','block');
            $('#t_err').css('display','none');
            return false;
        }

      else if ($('#subject_tag').val() == "") {
            $('#an_err').css('display','none');
            $('#aq_err').css('display','none');
            $('#t_err').css('display','block');
            return false;
       }
      else{return true;}

   } );

});

