class ChatsController < ApplicationController
        before_filter :authenticate_admin!, :only => [:create, :index]
        respond_to :js, :only=>[:admin_search, :chating_status, :select_chat_friend]

        def index
                session[:username] = current_admin.name_of_admin
                @chat_status = Admin.find(current_admin.id)
                @chat_status.update_attribute(:chat_status, "active")
                @all_admins_in_chat = Admin.find_all_by_chat_status("active")
        end

        def admin_search
                if !params[:name_of_admin].blank? && params[:name_of_admin].length > 1
                        if params[:name_of_admin][0]=="@"
                                @all_admins = Admin.find(:all, :conditions => ["name_of_admin LIKE ?", "#{params[:name_of_admin][1..params[:name_of_admin].length]}%"])
                        else
                                @all_admins = Admin.find(:all, :conditions => ["name_of_admin LIKE ?", "#{params[:name_of_admin]}%"])
                        end
                else
                        @all_admins = []
                end
        end

        def chating_status
                @chat_status = Admin.find(current_admin.id)
                @chat_status.update_attribute(:chat_status, params[:chat_status])
                render :text => "".inspect and return false
        end

        def select_chat_friend
               #render :text=> params.inspect and return false
               @chat_status = Admin.find(current_admin.id)
               @chat_status.update_attribute(:chat_friend_name , params[:id])
               @find_admin = Admin.find_by_name_of_admin(@chat_status.chat_friend_name)
               @find_admin.update_attribute(:chat_friend_name , current_admin.name_of_admin)
               @chat_friend_name = @chat_status.chat_friend_name
               @channel = "/messages/private/#{params[:id]}"
               @local_channel = "/messages/private/#{session[:username]}"

               @local_message = { :sender => @chat_status.chat_friend_name, :username => @find_admin.chat_friend_name,
               :msg => "requested to chat with #{ @chat_status.chat_friend_name}" , :content=>"<div id='#{@chat_status.chat_friend_name}_1'
               style='height:200px; width:250px;overflow-y:scroll; float:left;outline:1px solid #B930B9; background:white;'>
                <i class='link_to_text2' id='#{@chat_status.chat_friend_name}_2'>#{@chat_status.chat_friend_name}</i>
                <form method='post' data-remote='true' action='/new_message' ><input type='hidden' name='cval' value='#{@chat_status.chat_friend_name}'/>
                <input type='text' name='message' class='chat_text' /></form>  </div>" }

               @message = {:sender => @find_admin.chat_friend_name, :username => @find_admin.chat_friend_name,
               :msg => "wants to chat", :content=>"<div id='#{session[:username]}_1'
               style='height:200px; width:250px;overflow-y:scroll; float:left;outline:1px solid #B930B9; background:white;'>
               <i class='link_to_text2' id='#{session[:username]}_2'>#{session[:username]}</i>
               <form method='post' data-remote='true' action='/new_message' ><input type='hidden' name='cval' value='#{session[:username]}'/>
               <input type='text' name='message' class='chat_text' /></form> </div> " }

        end

        def new_message
                #if !current_admin.chat_friend_name.nil? && !current_admin.chat_friend_name.blank?
                    @name = Admin.find_by_name_of_admin(current_admin.chat_friend_name)
                    if @name.chat_status=="active"

                            @local_channel = "/messages/private/#{session[:username]}"
                            @local_message = {:sender=>params[:cval], :username => session[:username], :msg => params[:message] }
                            #@channel = "/messages/private/#{splt.first.gsub(/@/, '')}"
                            @channel = "/messages/private/#{params[:cval]}"
                            @message = {:sender=>session[:username], :username => session[:username], :msg => params[:message] }
                    else
                            @channel = "/messages/public"
                            @message = { :username => session[:username], :msg => params[:message] }
                    end
                #else
                     # @channel = "/messages/public"
                     # @message = { :username => session[:username], :msg => params[:message] }
                #end
                respond_to do |f|
                        f.js
                end
        end
end

