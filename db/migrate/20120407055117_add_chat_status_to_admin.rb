class AddChatStatusToAdmin < ActiveRecord::Migration
  def change
        add_column :admins, :chat_status, :string, :null => false, :default => "inactive"
  end
end

