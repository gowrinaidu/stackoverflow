class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :sender_name
      t.text :content

      t.timestamps
    end
  end
end
