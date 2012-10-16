$(document).ready(function(){
      $('#message').bind('keyup', function() {
            $('#admins_area').show();
            $.ajax({
              url: "/chats/admin_search",
              data : {name_of_admin: $('#message').val()}
            });
      });

      $('#chat_status').bind('change', function() {
            $.ajax({
              url: "/chats/chating_status",
              data : {chat_status: $('#chat_status').val()}
            });
      });
});

