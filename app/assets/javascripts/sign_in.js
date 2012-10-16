
$(document).ready(function(){

  // Sign in form validation
//=============================================================================================================

  $("#sign_in").submit( function () {
         if ($('#admin_email').val() == "" && $('#admin_password').val() == "")
         {
            $('#email_err').css('display','block');
            $('#pwd_err').css('display','block');
            return false;
         }

         else if ($('#admin_email').val() == "") {
            $('#email_err').css('display','block');
            $('#pwd_err').css('display','none');
            return false;
          }

         else if ($('#admin_password').val() == "") {
            $('#email_err').css('display','none');
            $('#pwd_err').css('display','block');
            return false;
          }

        else{return true;}

  });

});

