$(document).ready(function(){

   $("#red").click( function () {
      chat_form_c_class = $('#chat_form').attr("class");
      admins_area_c_class = $('#admins_area').attr("class");
      chat_room_c_class = $('#chat_room').attr("class");
      message_c_class = $('#message').attr("class");
      chat_head_c_class = $('#chat_head').attr("class");

      $('#chat_form').removeClass(chat_form_c_class).addClass('chat_form_red');
      $('#admins_area').removeClass(admins_area_c_class).addClass('admins_area_red');
      $('#chat_room').removeClass(chat_room_c_class).addClass('change_red');
      $('#message').removeClass(message_c_class).addClass('text_red');
      $('#chat_head').removeClass(chat_head_c_class).addClass('chat_head_red');
  });

  $("#blue").click( function () {
      chat_form_c_class = $('#chat_form').attr("class");
      admins_area_c_class = $('#admins_area').attr("class");
      chat_room_c_class = $('#chat_room').attr("class");
      message_c_class = $('#message').attr("class");
      chat_head_c_class = $('#chat_head').attr("class");

      $('#chat_form').removeClass(chat_form_c_class).addClass('chat_form_blue');
      $('#admins_area').removeClass(admins_area_c_class).addClass('admins_area_blue');
      $('#chat_room').removeClass(chat_room_c_class).addClass('change_blue');
      $('#message').removeClass(message_c_class).addClass('text_blue');
      $('#chat_head').removeClass(chat_head_c_class).addClass('chat_head_blue');

  });

  $("#green").click( function () {
      chat_form_c_class = $('#chat_form').attr("class");
      admins_area_c_class = $('#admins_area').attr("class");
      chat_room_c_class = $('#chat_room').attr("class");
      message_c_class = $('#message').attr("class");
      chat_head_c_class = $('#chat_head').attr("class");

      $('#chat_form').removeClass(chat_form_c_class).addClass('chat_form_green');
      $('#admins_area').removeClass(admins_area_c_class).addClass('admins_area_green');
      $('#chat_room').removeClass(chat_room_c_class).addClass('change_green');
      $('#message').removeClass(message_c_class).addClass('text_green');
      $('#chat_head').removeClass(chat_head_c_class).addClass('chat_head_green');

  });

});

