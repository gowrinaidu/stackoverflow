class AddClientNameToAdmins < ActiveRecord::Migration
  def change
      add_column :admins, :chat_friend_name, :string, :null => false, :default => ""
  end
end

