class AddChatStatusToChats < ActiveRecord::Migration
  def change
          add_column :chats, :chat_status, :string
  end
end

