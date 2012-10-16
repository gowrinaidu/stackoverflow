
$(document).ready(function(){

  $('#edit_user').bind('click', function() {
    $('#edit_user_answer').slideDown();
    $('#user_answer').css('display', 'none');
  });

  $('#cancel_edit').bind('click', function() {
    $('#edit_user_answer').slideUp();
    $('#user_answer').slideDown();
  });

  $('#post_comment').bind('click', function() {
    if(document.getElementById('comment_c_description').value == "")
      {
         alert("Comment can't be blank");
         return false;
      }
    else
      {
        return true;
      }

  });

});

