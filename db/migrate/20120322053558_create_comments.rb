class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :answer_id
      t.string :c_name
      t.text :c_description

      t.timestamps
    end
  end
end
