class SessionsController < ApplicationController
  def new
  end

  def create
        session[:username] = current_admin.name_of_admin
        redirect_to "/chats"
  end
end

